/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

/**
 *
 * @author rajat
 */
public class ProcessImage 
{
    public byte[] processImage(Part filePart) throws IOException 
    {
        InputStream inputStream = filePart.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int byteRead;
        while((byteRead = inputStream.read(buffer)) != -1)
        {
            outputStream.write(buffer,0,byteRead);
        }
        return outputStream.toByteArray();
    }
    
    public byte[] decodeImage(String base64Image) throws FileNotFoundException, IOException
    {
        byte[] imageData = Base64.getDecoder().decode(base64Image);
        FileOutputStream fos = new FileOutputStream("image.jpeg");
        fos.write(imageData);
        return imageData;
    }
}
