package com.gc.spatial;

import java.sql.Types;
import org.hibernate.dialect.Oracle10gDialect;

/**
 * This class extends the Oracle9Dialect for Hibernate by adding the
 * sdo_geometry type as an sql.OTHER type.
 *
 * @author Joel Schuster - The NAVSYS Corporation
 * @version 1.0
 * @see com.navsys.spatial.OracleSpacialDialect
 *
 */
public class OracleSpatialDialect extends Oracle10gDialect {
    public OracleSpatialDialect() {
        super();
        registerColumnType( Types.OTHER, "sdo_geometry");
    }
}
