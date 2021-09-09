//
// Decompiled by Procyon v0.5.30
//

package com.library.plugin;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.ByteArrayOutputStream;
import org.apache.struts.upload.FormFile;

public class FileUtility
{
    public static void SaveFile(final String path, final FormFile file) throws IOException {
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        OutputStream bos = new FileOutputStream(path);
        final InputStream stream = file.getInputStream();
        bos = new FileOutputStream(path);
        int bytesRead = 0;
        final byte[] buffer = new byte[8192];
        while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
            bos.write(buffer, 0, bytesRead);
        }
        bos.close();
        stream.close();
    }
}
