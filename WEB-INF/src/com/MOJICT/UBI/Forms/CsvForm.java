//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Forms;

import org.apache.struts.upload.FormFile;
import org.apache.struts.action.ActionForm;

public class CsvForm extends ActionForm
{
    private FormFile thefile;

    public FormFile getThefile() {
        return this.thefile;
    }

    public void setThefile(final FormFile thefile) {
        this.thefile = thefile;
    }
}
