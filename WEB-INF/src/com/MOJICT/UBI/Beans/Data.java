//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Beans;

import java.util.Date;

public class Data
{
    private int ubi_id;
    private String case_number;
    private String year_carried;
    private String prime_index;
    private String chk_char;
    private String date_account;
    private String credit_detail;
    private Date date_search;

    public Date getDate_search() {
        return this.date_search;
    }

    public void setDate_search(final Date date_search) {
        this.date_search = date_search;
    }

    public String getDate_account() {
        return this.date_account;
    }

    public void setDate_account(final String date_account) {
        this.date_account = date_account;
    }

    public int getUbi_id() {
        return this.ubi_id;
    }

    public void setUbi_id(final int ubi_id) {
        this.ubi_id = ubi_id;
    }

    public String getCase_number() {
        return this.case_number;
    }

    public void setCase_number(final String case_number) {
        this.case_number = case_number;
    }

    public String getYear_carried() {
        return this.year_carried;
    }

    public void setYear_carried(final String year_carried) {
        this.year_carried = year_carried;
    }

    public String getPrime_index() {
        return this.prime_index;
    }

    public void setPrime_index(final String prime_index) {
        this.prime_index = prime_index;
    }

    public String getChk_char() {
        return this.chk_char;
    }

    public void setChk_char(final String chk_char) {
        this.chk_char = chk_char;
    }

    public String getCredit_detail() {
        return this.credit_detail;
    }

    public void setCredit_detail(final String credit_detail) {
        this.credit_detail = credit_detail;
    }
}
