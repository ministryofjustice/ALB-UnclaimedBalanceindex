//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class DataForm extends org.apache.struts.validator.ValidatorForm 
{
    private String case_number;
    private String name;
    private String from_day;
    private String from_month;
    private String from_year;
    private String to_day;
    private String to_month;
    private String to_year;

    public String getCase_number() {
        return this.case_number;
    }

    public void setCase_number(final String case_number) {
        this.case_number = case_number;
    }

    public String getName() {
        return this.name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getFrom_day() {
        return this.from_day;
    }

    public void setFrom_day(final String from_day) {
        this.from_day = from_day;
    }

    public String getFrom_month() {
        return this.from_month;
    }

    public void setFrom_month(final String from_month) {
        this.from_month = from_month;
    }

    public String getFrom_year() {
        return this.from_year;
    }

    public void setFrom_year(final String from_year) {
        this.from_year = from_year;
    }

    public String getTo_day() {
        return this.to_day;
    }

    public void setTo_day(final String to_day) {
        this.to_day = to_day;
    }

    public String getTo_month() {
        return this.to_month;
    }

    public void setTo_month(final String to_month) {
        this.to_month = to_month;
    }

    public String getTo_year() {
        return this.to_year;
    }

    public void setTo_year(final String to_year) {
        this.to_year = to_year;
    }
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    	ActionErrors errors = new ActionErrors();
    	
    	return errors;
    	}
}
