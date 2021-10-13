package com.MOJICT.UBI.Util;

import java.sql.Connection;
import java.sql.DriverManager;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBConnection {
    public DBConnection() {
    }

    public static SessionFactory getDBConnection() throws Exception {
        String dbHost = System.getenv("DB_HOST");
        String dbPort = System.getenv("DB_PORT");
        String dbUser = System.getenv("DB_USER");
        String dbPass = System.getenv("DB_PASSWORD");
        String dbName = System.getenv("DB_NAME");
        String dbUrl = "jdbc:postgresql://"+dbHost+":5432/"+dbName;
        Configuration cfg = new Configuration();
        cfg.addResource("hibernate.cfg.xml");
        cfg.addResource("com/MOJICT/UBI/Beans/Data.hbm.xml");
        cfg.addResource("com/MOJICT/UBI/Beans/UserBean.hbm.xml");
        cfg.addResource("com/MOJICT/UBI/Beans/Path.hbm.xml");
        cfg.setProperty("hibernate.connection.url", dbUrl);
        //System.out.println(dbUrl);
        cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        cfg.setProperty("connection.driver_class","org.postgresql.Driver");
        cfg.setProperty("hibernate.connection.username", dbUser);
        cfg.setProperty("hibernate.connection.password", dbPass);
        cfg.setProperty("javax.persistence.query.timeout","200000");
        //cfg.setProperty("hibernate.hbm2ddl.auto", "update");
        cfg.setProperty("show_sql", "false");
        //cfg.setProperty("hibernate.connection.pool_size", "1");
        //cfg.setProperty("hibernate.jdbc.batch_size","10000");

        SessionFactory factory = cfg.buildSessionFactory();
        return factory;

    }
}