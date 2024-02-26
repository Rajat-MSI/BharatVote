/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.util.List;

/**
 *
 * @author rajat
 */
public class DistrictManagement 
{
    public List<District> getDistrictList()
    {
        DistrictDAO districtDAO = new DistrictDAO();
        List<District> list = districtDAO.getAllDistrict();
        return list;
    }
    
    public District getDistrictDetails(String districtID)
    {
        District district = new District();
        DistrictDAO districtDAO = new DistrictDAO();
        
        district.setDistrictID(districtDAO.getDistrict("districtID", districtID));
        district.setDistrictName(districtDAO.getDistrict("districtName", districtID));
        return district;
    }
}
