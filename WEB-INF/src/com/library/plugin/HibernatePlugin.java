//
// Decompiled by Procyon v0.5.30
//

package com.library.plugin;

import org.hibernate.HibernateException;
import javax.servlet.ServletException;
import org.apache.struts.config.ModuleConfig;
import org.apache.struts.action.ActionServlet;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.struts.action.PlugIn;

public class HibernatePlugin implements PlugIn
{
    private Configuration config;
    private SessionFactory factory;
    private static Class clazz;
    public static String KEY_NAME;

    static {
        HibernatePlugin.clazz = HibernatePlugin.class;
        HibernatePlugin.KEY_NAME = HibernatePlugin.clazz.getName();
    }

    public void init(final ActionServlet servlet, final ModuleConfig modConfig) throws ServletException {
        try {
            final Configuration cfg = new Configuration();
            cfg.addResource("/hibernate.cfg.xml");
            cfg.configure();
            this.factory = cfg.buildSessionFactory();
            this.factory = new Configuration().configure().buildSessionFactory();
            servlet.getServletContext().setAttribute(HibernatePlugin.KEY_NAME, (Object)this.factory);
        }
        catch (Exception e) {
            System.out.println("Exception >>>>>>>>>>>>>>>>" + e.getMessage());
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            this.factory.close();
        }
        catch (HibernateException ex) {}
    }
}
