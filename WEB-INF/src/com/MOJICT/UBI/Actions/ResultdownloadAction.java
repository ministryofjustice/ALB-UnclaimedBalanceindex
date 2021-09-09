//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.Validator;

import javax.servlet.ServletException;

import java.io.ByteArrayInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.hibernate.Query;

import java.util.List;

import org.hibernate.Session;

import java.util.Date;

import com.MOJICT.UBI.Util.myDate;
import com.library.plugin.HibernatePlugin;

import org.hibernate.SessionFactory;

import com.MOJICT.UBI.Forms.DataForm;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class ResultdownloadAction extends Action
{
    String strQry;
    Boolean flag;
    Boolean dateFlag;

    public ResultdownloadAction() {
        this.flag = false;
        this.dateFlag = false;
    }

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        Session session = null;
        SessionFactory factory = null;
        List<String> arrResults = null;
        Query qry = null;
        this.strQry = "from Data data ORDER BY to_date(data.date_account,'DD/MM/YYYY') where ";
        this.dateFlag = false;
        try {
            DataForm frm = (DataForm)form;
            //factory = (SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
            factory = DBConnection.getDBConnection();
            session = (Session)factory.openSession();

            String msg = "";
            if (frm.getName().trim() == null || frm.getName().trim().equals("")) {
                msg = "required";
            }
            else {
                msg = this.validateform(frm);
            }
            if (msg != "") {
                if (msg.equals("date")) {
                    request.setAttribute("dateError", (Object)"date");
                }
                else if (msg.equals("year")) {
                    request.setAttribute("yearError", (Object)"year");
                }
                else if (msg.equals("invalid")) {
                    request.setAttribute("invalidError", (Object)"invalid");
                }
                else if (msg.equals("required")) {
                    request.setAttribute("requiredError", (Object)"required");
                }
                return mapping.findForward("failure");
            }
            if (!this.flag) {
                request.setAttribute("fieldError", (Object)"fieldError");
                return mapping.findForward("failure");
            }
            qry = session.createQuery(this.strQry);
            System.out.println(this.strQry);
            if (this.dateFlag) {
                final int frm_year = Integer.parseInt(frm.getFrom_year()) + 2000;
                final String from_year = String.valueOf(frm_year);
                final int too_year = Integer.parseInt(frm.getTo_year()) + 2000;
                final String to_year = String.valueOf(too_year);
                qry.setDate("from_date", (Date)myDate.String2Date(String.valueOf(frm.getFrom_day()) + "/" + frm.getFrom_month() + "/" + from_year));
                qry.setDate("to_date", (Date)myDate.String2Date(String.valueOf(frm.getTo_day()) + "/" + frm.getTo_month() + "/" + to_year));
            }
            arrResults = qry.list();
            frm = null;
            FileWriter writer = new FileWriter("/opt/hmcs/data/ubi/files/data.csv");


            String commalist = StringUtils.join(arrResults.toArray(), ",");
            System.out.println(commalist);

            writer.write(commalist);
            writer.close();
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=\"userDirectory.csv\"");
            try
            {
                OutputStream outputStream = response.getOutputStream();
                //String outputResult = "xxxx, yyyy, zzzz, aaaa, bbbb, ccccc, dddd, eeee, ffff, gggg\n";
                outputStream.write(commalist.getBytes());
                System.out.println(commalist.toString());
                outputStream.flush();
                outputStream.close();
            }
            catch(Exception e)
            {
                System.out.println(e.toString());
            }
            
        }
        catch (Exception ex) {

            //request.setAttribute("results", (Object)arrResults);
           // System.out.println("Its coming here in catch exception");
            ex.printStackTrace();
        }
        finally
        {
		 session.clear();
             session.close();
             factory.close();
        }
        return mapping.findForward("success");
    }

    private String validateform(final DataForm frm) {
        String errMsg = "";
        this.flag = false;
        if (frm.getName().trim() != null && !frm.getName().trim().equals("")) {
            if (Validator.IsValidName(frm.getName())) {
                this.strQry = String.valueOf(this.strQry) + " (lower(data.prime_index) like '%" + frm.getName().trim().toLowerCase() + "%' OR lower(data.credit_detail) like '%" + frm.getName().trim().toLowerCase() + "%' )";
                this.flag = true;
            }
            else {
                errMsg = "invalid";
            }
        }
        if (frm.getCase_number().trim() != null && !frm.getCase_number().equals("")) {
            if (Validator.IsValidNumber(frm.getCase_number())) {
                if (this.flag) {
                    this.strQry = String.valueOf(this.strQry) + "and data.case_number like '%" + frm.getCase_number().trim() + "%' ";
                }
                else {
                    this.strQry = String.valueOf(this.strQry) + "data.case_number like '" + frm.getCase_number().trim() + "%' ";
                }
                this.flag = true;
            }
            else {
                errMsg = "invalid";
            }
        }
        if (!frm.getTo_day().equals("0") || !frm.getTo_month().equals("0") || !frm.getTo_year().equals("0") || !frm.getFrom_day().equals("0") || !frm.getFrom_month().equals("0") || !frm.getFrom_year().equals("0")) {
            if (frm.getTo_day().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else if (frm.getTo_month().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else if (frm.getTo_year().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else if (frm.getFrom_day().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else if (frm.getFrom_month().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else if (frm.getFrom_year().equals("0")) {
                errMsg = "date";
                this.flag = false;
            }
            else {
                if (Integer.parseInt(frm.getFrom_year()) == Integer.parseInt(frm.getTo_year())) {
                    if (Integer.parseInt(frm.getFrom_month()) <= Integer.parseInt(frm.getTo_month())) {
                        if (Integer.parseInt(frm.getFrom_month()) == Integer.parseInt(frm.getTo_month()) && Integer.parseInt(frm.getFrom_day()) > Integer.parseInt(frm.getTo_day())) {
                            errMsg = "date";
                        }
                    }
                    else {
                        errMsg = "date";
                    }
                }
                if (Validator.isValidDate(String.valueOf(frm.getTo_day()) + "/" + frm.getTo_month() + "/" + frm.getTo_year())) {
                    if (!Validator.isValidDate(String.valueOf(frm.getFrom_day()) + "/" + frm.getFrom_month() + "/" + frm.getFrom_year())) {
                        errMsg = "date";
                    }
                }
                else {
                    errMsg = "date";
                }
                if (Integer.parseInt(frm.getFrom_year()) <= Integer.parseInt(frm.getTo_year())) {
                    if (this.flag) {
                        this.dateFlag = true;
                        this.strQry = String.valueOf(this.strQry) + " AND data.date_search BETWEEN :from_date AND :to_date";
                    }
                    else {
                        this.dateFlag = true;
                        this.strQry = String.valueOf(this.strQry) + " data.date_search BETWEEN :from_date AND :to_date";
                    }
                    this.flag = true;
                }
                else {
                    errMsg = "year";
                    this.flag = false;
                }
            }
        }
        return errMsg;
    }
}
