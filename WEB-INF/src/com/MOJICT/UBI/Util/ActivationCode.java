//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Util;

import java.util.UUID;

public class ActivationCode
{
    public static String generateUniCode() {
        final String uuid = UUID.randomUUID().toString();
        return uuid.substring(0, 5);
    }
}
