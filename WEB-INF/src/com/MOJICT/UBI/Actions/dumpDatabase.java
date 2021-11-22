//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;

import java.io.IOException;

import javax.servlet.ServletContext;

import org.hibernate.Session;

import java.io.FileNotFoundException;
import java.util.Date;

import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.myDate;
import com.MOJICT.UBI.Beans.Data;

import java.io.Reader;

import au.com.bytecode.opencsv.CSVReader;

import java.io.FileReader;
import java.io.Serializable;

import com.MOJICT.UBI.Beans.Path;
import com.library.plugin.HibernatePlugin;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class dumpDatabase extends Action
{
    String errMsg;

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        Session session = null;
        SessionFactory factory = null;

        factory = DBConnection.getDBConnection();
			//(SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
        session = (Session)factory.openSession();
        String result = null;
        if (request.getSession().getAttribute("user_id") != null) {
            try {
                final Path objPath = (Path)session.get(Path.class, (Serializable)1);
                final ServletContext context = this.servlet.getServletContext();
                final String FILE_PATH = "/opt/hmcs/data/ubi/files/UBI_DATA.csv";
                System.out.println(FILE_PATH);
                final CSVReader reader = new CSVReader(new FileReader(FILE_PATH));
                Data obj = null;
                session.beginTransaction();
                session.createQuery("delete Data").executeUpdate();
                session.getTransaction().commit();
                session.beginTransaction();
                int ctr = 0;
                int number = 0;
                try {
			int id = 0;
                    String[] nextLine = reader.readNext();
                    while ((nextLine = reader.readNext()) != null) {
                        final int line = nextLine.length;
                        int counter = 0;
                        id = id+1;
                        ++ctr;

                        obj = new Data();
                        obj.setUbi_id(id);
                        if (counter < line) {
                            obj.setCase_number(String.valueOf(nextLine[0]) + nextLine[3]);
                        }
                        if (++counter < line) {
                            obj.setYear_carried(nextLine[1].trim());
                        }
                        if (++counter < line) {
                            obj.setPrime_index(nextLine[2].trim());
                        }
                        if (++counter < line) {
                            obj.setChk_char(nextLine[3].trim());
                        }
                        if (++counter < line) {
                            obj.setDate_account(nextLine[4].trim());
                        }

                        ++counter;
                        try {
                            final String[] split = nextLine[4].split("/");
                            int i = Integer.parseInt(split[2]);
                            i += 2000;
                            split[2] = String.valueOf(i);
                            obj.setDate_search((Date)myDate.String2Date(String.valueOf(split[0]) + "/" + split[1] + "/" + split[2]));
                        }
                        catch (Exception ex2) {}
                        if (counter < line) {
                            obj.setCredit_detail(nextLine[5].trim());
                        }
                        ++counter;
                        ++number;
                        session.save(obj);
                        /*if (ctr == 1000) {
                            session.getTransaction().commit();
                            session.clear();
                            ctr = 0;
                            session.getTransaction().begin();
                        }*/
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                    result = "an error has occured while reading file";
                    System.out.println("coming here in error");
                    return mapping.findForward("success");
                }

                session.getTransaction().commit();
                result = String.valueOf(number) + " Records added in database";
                session.clear();
                //session.close();
                //factory.close();
                request.setAttribute("errMsg", (Object)result);
                return mapping.findForward("success");
            }
            catch (Exception e) {
                result = "Cannot find UBI_DATA.CSV file";
                System.out.println("coming here in 2nd error");
                e.printStackTrace();
            }
            finally
            {
            	 session.clear();
                 session.close();
                 factory.close();
            }
            request.setAttribute("errMsg", (Object)result);
            return mapping.findForward("success");
        }
        request.setAttribute("errMsg", (Object)(this.errMsg = "Session expired. Please login"));
        return mapping.findForward("session");
    }
}
