//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class loginBean extends ActionForm
{
    private int user_id;
    private String login_name;
    private String surname;
    private String firstname;
    private String password;
    private FormFile theFile;

    public FormFile getTheFile() {
        return this.theFile;
    }

    public void setTheFile(final FormFile theFile) {
        this.theFile = theFile;
    }

    public String getLogin_name() {
        return this.login_name;
    }

    public void setLogin_name(final String login_name) {
        this.login_name = login_name;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(final String surname) {
        this.surname = surname;
    }

    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstname(final String firstname) {
        this.firstname = firstname;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(final String password) {
        this.password = password;
    }

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(final int user_id) {
        this.user_id = user_id;
    }
    
}
