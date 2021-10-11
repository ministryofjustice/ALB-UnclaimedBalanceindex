//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import com.MOJICT.UBI.Util.DBConnection;
import com.MOJICT.UBI.Util.Validator;

import javax.servlet.ServletException;

import java.io.IOException;

import org.hibernate.Query;

import java.util.List;

import org.hibernate.Session;

import java.util.Date;

import com.MOJICT.UBI.Util.myDate;
import com.library.plugin.HibernatePlugin;

import org.hibernate.SessionFactory;

import com.MOJICT.UBI.Forms.DataForm;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class SearchAction extends Action
{
    String strQry;
    Boolean flag;
    Boolean dateFlag;

    public SearchAction() {
        this.flag = false;
        this.dateFlag = false;
    }

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
    	Logger logger = Logger.getLogger(SearchAction.class);
    	Session session = null;
        SessionFactory factory = null;
        List arrResults = null;
        Query qry = null;
        this.strQry = "from Data data where ";
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
            String genericerror="";
            if (msg != "") {
                if (msg.equals("date")) {
                    genericerror=genericerror+"dateerror";
                    request.setAttribute("genericerror", genericerror);
                	request.setAttribute("dateError", (Object)"date");
                }
                else if (msg.equals("year")) {
                	genericerror=genericerror+"yearerror";
                	request.setAttribute("genericerror", genericerror);
                    request.setAttribute("yearError", (Object)"year");
                }
                else if (msg.equals("invalid")) {
                	genericerror=genericerror+"invalidError";
                	request.setAttribute("genericerror", genericerror);
                    request.setAttribute("invalidError", (Object)"invalid");
                }
                else if (msg.equals("required")) {
                	genericerror=genericerror+"requirederror";
                	request.setAttribute("genericerror", genericerror);
                    request.setAttribute("requiredError", (Object)"required");
                }
                return mapping.findForward("failure");
            }
            if (!this.flag) {
            	genericerror=genericerror+"fielderror";
            	request.setAttribute("genericerror", genericerror);
                request.setAttribute("fieldError", (Object)"fieldError");
                return mapping.findForward("failure");
            }
            qry = session.createQuery(this.strQry);
            logger.info(this.strQry);
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
            //qry.

            request.setAttribute("results", (Object)arrResults);
        }
        catch (Exception ex) {

            request.setAttribute("results", (Object)arrResults);
           logger.info("Its coming here in catch exception");
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
