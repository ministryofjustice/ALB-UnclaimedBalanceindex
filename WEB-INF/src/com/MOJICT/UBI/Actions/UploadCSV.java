//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;

import org.apache.struts.upload.FormFile;
import org.hibernate.Session;

import java.util.Date;
import java.io.IOException;
import java.io.Serializable;

import com.MOJICT.UBI.Beans.Path;
import com.library.plugin.FileUtility;

import java.net.InetAddress;

import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.Validator;
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

public class UploadCSV extends Action
{
    String errMsg;

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        Session session = null;
        SessionFactory factory = null;
        //factory = (SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
        factory = DBConnection.getDBConnection();
        session = (Session)factory.openSession();

        final String fileName = null;
        if (request.getSession().getAttribute("user_id") != null) {
            try {
                final loginBean frm = (loginBean)form;
                this.errMsg = Validator.validateForm(frm);
                final FormFile file = frm.getTheFile();
                final boolean flag = Validator.validFileContent(file.getInputStream());
                if (this.errMsg.equals("") && flag) {
                    final InetAddress localMachine = InetAddress.getLocalHost();
                    String Server = localMachine.getHostName();
                    Server = Server.substring(0, 5);
                    try {
                        final String path = "/opt/hmcs/data/ubi/files/UBI_DATA.csv";
                        //System.out.println(">>>>>>>>>>>>>><<<<<<<<<<<<"+path);
                        FileUtility.SaveFile(path, file);
                        request.setAttribute("uploaded", "yes");
                        Path obj = new Path();
                        obj.setPath_id(1);
                       // System.out.println(">>>>>>>>>>>>>><<<<<<<<<<<<"+obj.getPath_id());
                        obj.setFile_path("UBI_DATA.csv");
                        //System.out.println(">>>>>>>>>>>>>><<<<<<<<<<<<"+obj.getFile_path());
                        session.beginTransaction();
                        session.save((Object)obj);
                        session.getTransaction().commit();
                    }
                    catch (IOException ex) {
                        request.setAttribute("errMsg", (Object)(this.errMsg = ex.getMessage()));
                        ex.printStackTrace();
                        return mapping.findForward("failure");
                    }
                    return mapping.findForward("success");
                }
                if (this.errMsg.equals("")) {
                    this.errMsg = "Invalid file. Please upload correct file";
                }
                request.setAttribute("errMsg", (Object)this.errMsg);
                System.out.println(String.valueOf(file.getFileName()) + " is rejected by server at " + new Date());
                return mapping.findForward("failure");
            }
            catch (Exception ex2) {
                ex2.printStackTrace();
                request.setAttribute("errMsg", (Object)(this.errMsg = ex2.getMessage()));
                return mapping.findForward("failure");
            }
        }
        request.setAttribute("errMsg", (Object)(this.errMsg = "Session expired. Please login"));
        return mapping.findForward("session");
    }
}
