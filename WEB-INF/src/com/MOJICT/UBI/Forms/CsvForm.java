//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CsvForm extends org.apache.struts.validator.ValidatorForm 
{
    private FormFile thefile;

    public FormFile getThefile() {
        return this.thefile;
    }

    public void setThefile(final FormFile thefile) {
        this.thefile = thefile;
    }
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    	ActionErrors errors = new ActionErrors();
    	
    	return errors;
    	}
}
