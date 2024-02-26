/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author rajat
 */
public class GenerateID 
{
    public String generateID()
    {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
        String str = formatter.format(date);
        return str;
    }
}
