//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

public final class PasswordService
{
    private static PasswordService instance;

    public synchronized String encrypt(final String plaintext) throws Exception {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA");
        }
        catch (NoSuchAlgorithmException e) {
            throw new Exception(e.getMessage());
        }
        try {
            md.update(plaintext.getBytes("UTF-8"));
        }
        catch (UnsupportedEncodingException e2) {
            throw new Exception(e2.getMessage());
        }
        final byte[] raw = md.digest();
        final String hash = new BASE64Encoder().encode(raw);
        return hash;
    }

    public static synchronized PasswordService getInstance() throws Exception {
        if (PasswordService.instance == null) {
            PasswordService.instance = new PasswordService();
            System.out.println(PasswordService.instance.encrypt("xxxx"));
        }
        return PasswordService.instance;
    }
    public static void main(String args[]) throws Exception
    {
    	PasswordService.getInstance();
    }
}
