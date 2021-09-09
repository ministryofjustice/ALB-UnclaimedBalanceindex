//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;

import java.io.IOException;

import org.hibernate.Query;

import java.util.List;

import org.hibernate.Session;

import com.MOJICT.UBI.Beans.Data;
import com.MOJICT.UBI.Util.DBConnection;
import com.library.plugin.HibernatePlugin;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class DetailAction extends Action
{
    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        Session session = null;
        SessionFactory factory = null;
        final List arrResults = null;
        Query qry = null;
        //factory = (SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
        factory = DBConnection.getDBConnection();
        session = (Session)factory.openSession();
        try {
            final String case_id = request.getParameter("case_id");
            qry = session.createQuery("from Data data where data.case_number=:id");
            qry.setString("id", case_id);
            final Data obj = (Data) qry.list().get(0);
            request.setAttribute("detail", (Object)obj);
            request.setAttribute("case", (Object)case_id);
            qry = null;
            session.clear();
            session.close();
            factory.close();
            return mapping.findForward("success");
        }
        catch (Exception ex) {
		session.clear();
            session.close();
            return mapping.findForward("failure");
        }
    }
}
