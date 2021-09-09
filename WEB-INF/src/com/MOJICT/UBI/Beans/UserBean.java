//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Beans;

public class UserBean
{
    private int user_id;
    private String login_name;
    private String firstname;
    private String surname;
    private String password;

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(final int user_id) {
        this.user_id = user_id;
    }

    public String getLogin_name() {
        return this.login_name;
    }

    public void setLogin_name(final String login_name) {
        this.login_name = login_name;
    }

    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstname(final String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(final String surname) {
        this.surname = surname;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(final String password) {
        this.password = password;
    }
}
