package com.MOJICT.UBI.Actions;

import com.MOJICT.UBI.Actions.*;
import com.MOJICT.UBI.Beans.Data;
import com.MOJICT.UBI.Util.*;
import com.MOJICT.UBI.Forms.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.OutputStream;
import org.hibernate.Query;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import java.util.Date;
import com.MOJICT.UBI.Util.myDate;

import io.sentry.Sentry;

import org.hibernate.SessionFactory;
import com.MOJICT.UBI.Forms.DataForm;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.web.WebLoggerContextUtils;
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
    	final Logger logger = LogManager.getLogger(SearchAction.class);
    	Session session = null;
        SessionFactory factory = null;
        List arrResults = null;
        Query qry = null;
        this.strQry = "from Data data where (";
        this.dateFlag = false;
        String[] searches = null;
        boolean nameflag=false;
        
        try {
            DataForm frm = (DataForm)new DataForm();
            //factory = (SessionFactory)this.servlet.getServletContext().getAttribute(HibernatePlugin.KEY_NAME);
            factory = DBConnection.getDBConnection();
            session = (Session)factory.openSession();
            String name=request.getParameter("name");
            frm.setName(request.getParameter("name"));
            frm.setFrom_day(request.getParameter("from_day"));
            frm.setFrom_month(request.getParameter("from_month"));
            frm.setFrom_year(request.getParameter("from_year"));
            frm.setTo_day(request.getParameter("to_day"));
            frm.setTo_month(request.getParameter("to_month"));
            frm.setTo_year(request.getParameter("to_year"));
          
            String case_number=null;

            String msg = "";
            if (frm.getName().trim() == null || frm.getName().trim().equals("")) {
                //msg = "required";
                nameflag=true;
                this.flag=true;
                
              //  System.out.println("Coming in here");
                msg.equals(this.validateform(frm));
            }
            else {
                msg.equals(this.validateform(frm));
            }
            
            //msg.equals(this.validateform(frm));
            
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
            this.strQry=String.valueOf(this.strQry) +" order by date_search desc";
            qry = session.createQuery(this.strQry);
            if(!nameflag)
            {
            searches = name.split(",", -1);
            for(int i=0;i<searches.length;i++)
        	{
            	name=searches[i];
            	String searchparam="searchname" + i;
            //	System.out.println(searchparam+">>>>>>"+name);
            qry.setString(searchparam, "%"+name+"%");
        	}
            }
           /* if (frm.getCase_number().trim() != null && !frm.getCase_number().equals("")) {
                if (Validator.IsValidNumber(frm.getCase_number())) {
            qry.setString("case_number", "%"+case_number+"%");
                }
                }
            */
          //  System.out.println(this.strQry);
            logger.info(this.strQry);
            if (this.dateFlag) {
            	//System.out.println("coming in here in date");
                final int frm_year = Integer.parseInt(frm.getFrom_year()) + 2000;
                final String from_year = String.valueOf(frm_year);
                final int too_year = Integer.parseInt(frm.getTo_year()) + 2000;
                final String to_year = String.valueOf(too_year);
                qry.setDate("from_date", (Date)myDate.String2Date(String.valueOf(frm.getFrom_day()) + "/" + frm.getFrom_month() + "/" + from_year));
                qry.setDate("to_date", (Date)myDate.String2Date(String.valueOf(frm.getTo_day()) + "/" + frm.getTo_month() + "/" + to_year));
            }
            
            arrResults = qry.list();
           
            frm = null;
            String commalist="Name,Account number,Year Carried Over,Credit Details,Date Account Opened"+"\n";

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

            Date date=new Date();

            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");



            response.setHeader("Content-Disposition", "attachment; filename=\"Unclaimed Court Accounts"+sdf.format(date)+".csv\"");

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
            	 Sentry.capture(e.getStackTrace().toString());

                System.out.println(e.toString());

            }

            

        }

        catch (Exception ex) {



            //request.setAttribute("results", (Object)arrResults);

           // System.out.println("Its coming here in catch exception");

            ex.printStackTrace();
            Sentry.capture(ex.getStackTrace().toString());

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
        String name=frm.getName().trim().toLowerCase();
        //String case_number=frm.getCase_number().trim();
        if (frm.getName().trim() != null && !frm.getName().trim().equals("")) {
        	
            if (Validator.IsValidName(frm.getName())) {
            	String[] searches = name.split(",", -1);
            	for(int i=0;i<searches.length;i++)
            	{
            		//searchname=searches[i];
                //this.strQry = String.valueOf(this.strQry) + " (lower(data.prime_index) like '%" +  + "%' OR lower(data.credit_detail) like '%" + frm.getName().trim().toLowerCase() + "%' )";
            			if(i==0)
            				{
            					this.strQry = String.valueOf(this.strQry) + " lower(data.prime_index) like :searchname"+i+" OR lower(data.credit_detail) like :searchname"+i+" OR data.case_number like :searchname"+i;
            				}
            			else{
            					this.strQry = String.valueOf(this.strQry) + " OR lower(data.prime_index) like :searchname"+i+" OR lower(data.credit_detail) like :searchname"+i+" OR data.case_number like :searchname"+i;
            				}
            			
            	}
            	
            	
            	this.flag = true;
                
            }
            else {
            	this.flag = false;
            }
            this.strQry = String.valueOf(this.strQry) + ")";
        }
        /*
         * commented code to remove number field 
         * if (frm.getCase_number().trim() != null && !frm.getCase_number().equals("")) {
            if (Validator.IsValidNumber(frm.getCase_number())) {
                if (this.flag) {
                    this.strQry = String.valueOf(this.strQry) + "and data.case_number like :case_number ";
                }
                else {
                    this.strQry = String.valueOf(this.strQry) + "data.case_number like :case_number";
                }
                this.flag = true;
            }
            else {
                errMsg = "invalid";
            }
        }*/
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
                        this.strQry = String.valueOf(this.strQry) + " AND (data.date_search BETWEEN :from_date AND :to_date)";
                        //System.out.println(this.strQry+">>>>>coming in here in date and quetryline 282");
                    }
                    else {
                        this.dateFlag = true;
                        this.strQry = String.valueOf(this.strQry) + " data.date_search BETWEEN :from_date AND :to_date)";
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
