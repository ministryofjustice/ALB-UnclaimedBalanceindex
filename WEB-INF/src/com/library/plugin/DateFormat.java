//
// Decompiled by Procyon v0.5.30
//

package com.library.plugin;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat
{
    public static String applyDateFormat(final Date date) {
        String dateStr = null;
        final SimpleDateFormat dateformat = new SimpleDateFormat("MM/dd/yyyy");
        try {
            dateStr = dateformat.format(date);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return dateStr;
    }
}
