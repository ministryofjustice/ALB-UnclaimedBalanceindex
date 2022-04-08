package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;

import java.io.IOException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.MOJICT.UBI.Beans.UserBean;
import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.PasswordService;
import com.MOJICT.UBI.Forms.loginBean;
import com.library.plugin.HibernatePlugin;

import io.sentry.Sentry;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class Pingdomalert extends Action
{
    String msg;

    public Pingdomalert() {
        this.msg = null;
    }

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        SessionFactory factory = null;
        Session session = null;
        loginBean frm = null;
        String RETURN = null;
        String errMsg = null;
        try {
		factory = DBConnection.getDBConnection();
		//factory = (SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
            session = (Session)factory.openSession();
            frm = (loginBean)form;
           final Query qry = session.createQuery("from UserBean usr");
           
            final List lst = qry.list();
            if (!lst.isEmpty()) {
                final UserBean usr = (UserBean) lst.get(0);
                RETURN = "success";
            }
            else {
                errMsg = "Database connection can not be established";
                request.setAttribute("DBError", errMsg);
                RETURN = "failure";
            }
        }
        catch (Exception e) {
            System.out.println("Hibernate error" + e.getMessage());
            e.printStackTrace();
            session.close();
            factory.close();
            Sentry.capture(e.getStackTrace().toString());
            return mapping.findForward("failure");
        }
        frm = null;
        session.close();
        factory.close();
        request.setAttribute("errMsg", (Object)errMsg);
        return mapping.findForward(RETURN);
    }
}
