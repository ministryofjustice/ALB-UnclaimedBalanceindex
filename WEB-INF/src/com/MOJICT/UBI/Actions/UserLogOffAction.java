//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Actions;

import javax.servlet.ServletException;
import java.io.IOException;
import org.apache.struts.action.ActionForward;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;

public class UserLogOffAction extends Action
{
    public ActionForward execute(final ActionMapping mapping, final ActionForm form, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException, Exception {
        request.getSession().removeAttribute("user_id");
        request.getSession().invalidate();
        return mapping.findForward("success");
    }
}
