//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Util;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class myDate
{
    public static Date String2Date(final String dstr) {
        try {
            final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            final java.util.Date util_date = dateFormat.parse(dstr);
            return new Date(util_date.getTime());
        }
        catch (Exception ex) {
            return null;
        }
    }

    public static String dateFormatter(final java.util.Date date) {
        if (date != null) {
            final SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            return formatter.format(date);
        }
        return null;
    }
}
