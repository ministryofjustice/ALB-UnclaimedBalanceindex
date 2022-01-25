//
// Decompiled by Procyon v0.5.30
//

package com.MOJICT.UBI.Util;



import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

public final class PasswordService
{
    private static PasswordService instance;

    public synchronized String encrypt(final String plaintext) throws Exception {
    	String  originalPassword = plaintext;
		String generatedSecuredPasswordHash = BCrypt.hashpw(originalPassword, BCrypt.gensalt(12));
		//System.out.println(generatedSecuredPasswordHash);
		
		//boolean matched = BCrypt.checkpw(originalPassword, generatedSecuredPasswordHash);
		//System.out.println(matched);
		return generatedSecuredPasswordHash;
    }

    public static synchronized PasswordService getInstance() throws Exception {
        if (PasswordService.instance == null) {
            PasswordService.instance = new PasswordService();
                
        }
        return PasswordService.instance;
    }
    public static void main(String args[]) throws Exception
    {
    	PasswordService.getInstance();
    }
}
