//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Util;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.MOJICT.UBI.Forms.loginBean;
import com.MOJICT.UBI.Beans.Data;
import java.io.Reader;
import au.com.bytecode.opencsv.CSVReader;
import java.io.InputStreamReader;
import java.io.InputStream;

public class Validator
{
    public static boolean validFileContent(final InputStream in) {
        final boolean flag = true;
        try {
            final CSVReader reader = new CSVReader(new InputStreamReader(in));
            Data objData = null;
            int ctr = 0;
            objData = new Data();
            String[] nextLine = reader.readNext();
            if (!nextLine[0].equals("Case Number")) {
                System.out.println("Error Code: H1");
                return false;
            }
            if (!nextLine[1].equals("Year Carried")) {
                System.out.println("Error Code: H2");
                return false;
            }
            if (!nextLine[2].equals("Prime Index")) {
                System.out.println("Error Code: H3");
                return false;
            }
            if (!nextLine[3].equals("Check Character")) {
                System.out.println("Error Code: H4");
                return false;
            }
            if (!nextLine[4].equals("Date Account")) {
                System.out.println("Error Code: H5");
                return false;
            }
            if (!nextLine[5].equals("Credit Detail")) {
                System.out.println("Error Code: H6");
                return false;
            }
            while ((nextLine = reader.readNext()) != null) {
                if (nextLine[0].trim().length() > 13) {
                    System.out.println("Error Code: C0 at line " + ctr);
                    return false;
                }
                if (nextLine[1].trim().length() > 4) {
                    System.out.println("Error Code: C1 at line " + ctr);
                    return false;
                }
                if (nextLine[3].trim().length() > 1) {
                    System.out.println("Error Code: C3 at line " + ctr);
                    return false;
                }
                if (nextLine[4].trim().length() > 10) {
                    System.out.println("Error Code: at line " + ctr);
                    return false;
                }
                ++ctr;
            }
            System.out.println("Records Read...... " + ctr);
            return flag;
        }
        catch (Exception ex) {
            return false;
        }
    }

    public static String validateForm(final loginBean frm) {
        String errMsg = "";
        if (frm.getTheFile() != null) {
            if (frm.getTheFile().getFileName() == null || frm.getTheFile().getFileName().length() < 1 || frm.getTheFile().getFileName().equals("")) {
                errMsg = String.valueOf(errMsg) + "You must attach file";
            }
            else if (!frm.getTheFile().getFileName().toUpperCase().equals("UBI_DATA.CSV")) {
                errMsg = String.valueOf(errMsg) + "Invalid file. Please upload correct file";
            }
        }
        else {
            errMsg = String.valueOf(errMsg) + "You must attach file";
        }
        return errMsg;
    }

    public static boolean IsValidName(final String email) {
        final String pattern = "[\\d_a-zA-Z\\s\\-]{3,50}";
        final Pattern p = Pattern.compile(pattern);
        final Matcher m = p.matcher(email);
        return m.matches();
    }

    public static boolean IsValidNumber(final String email) {
        final String pattern = "[\\d_a-zA-Z0-9]{3,50}";
        final Pattern p = Pattern.compile(pattern);
        final Matcher m = p.matcher(email);
        return m.matches();
    }

    public static boolean isValidDate(final String date) {
        System.out.println(date);
        final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return sdf.format(testDate).equals(date);
    }
}
