//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;

import java.io.IOException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.MOJICT.UBI.Beans.UserBean;
import com.MOJICT.UBI.Util.BCrypt;
import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.PasswordService;
import com.MOJICT.UBI.Forms.loginBean;
import com.library.plugin.HibernatePlugin;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class ValidateAdminLoginAction extends Action
{
    String msg;

    public ValidateAdminLoginAction() {
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
            final String pwd = PasswordService.getInstance().encrypt(frm.getPassword());
            final Query qry = session.createQuery("from UserBean usr where usr.login_name= ?");
            qry.setString(0, frm.getLogin_name());
            final List lst = qry.list();
            if (!lst.isEmpty()) {
                final UserBean usr = (UserBean) lst.get(0);
               // BCrypt.checkpw(frm.getPassword(), usr.getPassword());
               // if (usr.getPassword().equals(pwd)) 
                if(BCrypt.checkpw(frm.getPassword(), usr.getPassword()))
                {
                    RETURN = "success";
                    request.getSession().setAttribute("user_id", (Object)usr.getUser_id());
                }
                else {
                    errMsg = "Username / Password is invalid.";
                    RETURN = "failure";
                }
            }
            else {
                errMsg = "Username / password is invalid.";
                RETURN = "failure";
            }
        }
        catch (Exception e) {
            System.out.println("Hibernate error" + e.getMessage());
            e.printStackTrace();
            session.close();
            factory.close();
            return mapping.findForward("failure");
        }
        
        finally
        {
		 session.clear();
             session.close();
             factory.close();
        }
        frm=null;
        request.setAttribute("errMsg", (Object)errMsg);
        return mapping.findForward(RETURN);
    }
}
