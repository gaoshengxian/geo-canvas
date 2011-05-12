package com.gc.spatial;

import java.sql.Types;
import org.hibernate.dialect.Oracle10gDialect;

public class OracleSpatialDialect extends Oracle10gDialect {
    public OracleSpatialDialect() {
        super();
        registerColumnType( Types.OTHER, "sdo_geometry");
    }
}
