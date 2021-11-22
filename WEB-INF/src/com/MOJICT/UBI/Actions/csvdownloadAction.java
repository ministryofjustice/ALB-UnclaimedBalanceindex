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

import com.MOJICT.UBI.Beans.Data;
import com.MOJICT.UBI.Forms.DataForm;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForward;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class csvdownloadAction extends Action
{
    String strQry;
    Boolean flag;
    Boolean dateFlag;

    public csvdownloadAction() {
        this.flag = false;
        this.dateFlag = false;
    }

    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
    	Logger logger = Logger.getLogger(csvdownloadAction.class);
    	Session session = null;
        SessionFactory factory = null;
        List<String> arrResults = null;
        Query qry = null;
        this.strQry = "from Data";
        this.dateFlag = false;
        try {
        	factory = DBConnection.getDBConnection();
            session = (Session)factory.openSession();
            
            qry = session.createQuery(this.strQry);
            //logger.info(this.strQry);
           
            arrResults = qry.list();
            
            String commalist="";
            Data data=null;
            //FileWriter writer = new FileWriter("/files/data.csv");
            for(Object map : arrResults)
            {
            	data = (Data) map;
            	commalist=commalist+data.getPrime_index()+","+data.getCase_number()+","+data.getYear_carried()+","+data.getCredit_detail()+","+data.getDate_account()+"\n";
            	
            	
            	//System.out.println(data.getPrime_index());
            	//System.out.println(data.getCase_number());
            	
            	
            }

          // commalist = StringUtils.join(arrResults.toArray(), ",");
            //System.out.println(commalist);

           // writer.write(commalist);
           // writer.close();
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
