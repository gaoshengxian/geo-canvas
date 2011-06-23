-- To check spatial db version.
select sdo_version from dual;

-- clean up data
delete from cola_markets;

-- Create a table for cola (soft drink) markets in a 
-- given geography (such as city or state). 
-- Each row will be an area of interest for a specific 
-- cola (for example, where the cola is most preferred 
-- by residents, where the manufacturer believes the 
-- cola has growth potential, and so on).
-- (For restrictions on spatial table and column names, see 
-- Section 2.6.1 and Section 2.6.2.)
create table cola_markets ( mkt_id number primary key, name varchar2(32), shape sdo_geometry);

-- cola_a
insert into cola_markets (mkt_id, name, shape) values ('1','cola_a', sdo_geometry(2003, NULL, NULL, sdo_elem_info_array(1,1003,3), sdo_ordinate_array(1,1, 5,7)));  
-- cola_b
insert into cola_markets (mkt_id, name, shape) values ('2','cola_b', sdo_geometry(2003, NULL, NULL, sdo_elem_info_array(1,1003,1), sdo_ordinate_array(5,1, 8,1, 8,6, 5,7, 5,1)));  
-- cola_c
insert into cola_markets (mkt_id, name, shape) values ('3','cola_c', sdo_geometry(2003, NULL, NULL, sdo_elem_info_array(1,1003,1), sdo_ordinate_array(3,3, 6,3, 6,5, 4,5, 3,3)));  
-- cola_d
insert into cola_markets (mkt_id, name, shape) values ('4','cola_d', sdo_geometry(2003, NULL, NULL, sdo_elem_info_array(1,1003,4), sdo_ordinate_array(8,7, 10,9, 8,11)));  
-- cola_e (alternative way to create sdo_geometry)
insert into cola_markets (mkt_id, name, shape) values ('5','cola_e', sdo_geometry('POLYGON ((13.0 6.0))'));  
-- cola_f (alternative way to create sdo_geometry)
insert into cola_markets (mkt_id, name, shape) values ('6','cola_f', sdo_geometry('POLYGON ((10.0 1.0, 11.0 1.0, 11.0 2.0, 10.0 2.0))'));  

-- Update META DATA to take effect to Geometry objects
insert into user_sdo_geom_metadata (TABLE_NAME,COLUMN_NAME, DIMINFO, SRID) values ('cola_markets', 'shape', sdo_dim_array(sdo_dim_element('X', 0, 20, 0.005), sdo_dim_element('Y', 0, 20, 0.005) ), NULL );
-- To create INDEX
create index cola_spatial_idx on cola_markets(shape) indextype is MDSYS.SPATIAL_INDEX;


-- To find the area in which the searching object is contained.
SELECT c.mkt_id, c.name FROM cola_markets c 
WHERE 
  SDO_CONTAINS(c.shape,
    SDO_GEOMETRY(
      2003, NULL, NULL, 
      SDO_ELEM_INFO_ARRAY(1,1003,1), 
      SDO_ORDINATE_ARRAY(4,4)
    )
  ) = 'TRUE';
  
-- To load WKT
select c.name , c.shape.Get_WKT() from cola_markets c;
-- To load WKB
select c.name , c.shape.Get_WKB() from cola_markets c;
  
--------------------------------------------------------------------------------
-- To test with Hibernate stored procedure
-- To find market info by name.
create or replace
function findMarketInfo_fn( cm_name in VARCHAR2)
  return SYS_REFCURSOR
is
  cm_info_cursor SYS_REFCURSOR;
begin
  open cm_info_cursor for
    select c.mkt_id, c.name, c.shape 
    from cola_markets c
    where c.name LIKE '%' || cm_name || '%';
  
  return cm_info_cursor;  
end;

--------------------------------------------------------------------------------
-- To find the current maket boundary in which the searching object exists.
create or replace
function findBoundary_fn( cm_points in clob)
  return SYS_REFCURSOR
is
  boundary_cursor SYS_REFCURSOR;
  cola_geom SDO_GEOMETRY;
begin

  cola_geom := SDO_GEOMETRY(cm_points);
  open boundary_cursor for
    select c.mkt_id, c.name, c.shape 
    from cola_markets c
    where SDO_CONTAINS(c.shape, cola_geom) = 'TRUE';
  
  return boundary_cursor;  
end;

-- To test CLOB
create or replace
function findDoc_fn( cm_name in CLOB)
  return SYS_REFCURSOR
is
  cm_info_cursor SYS_REFCURSOR;
begin
  open cm_info_cursor for
    select c.*
    from t_clob c
    where dbms_lob.compare(nvl(c.doc_text,'Null'),nvl(cm_name,'Null')) = 0;
  
  return cm_info_cursor;  
end;