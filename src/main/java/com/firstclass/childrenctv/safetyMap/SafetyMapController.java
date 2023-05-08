package com.firstclass.childrenctv.safetyMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class SafetyMapController {
    @Autowired
     private SafetyMapService service;

    @GetMapping("/safety/get")
    public String getLocation() {
       return "safetymap/safetyMap";
    }
    
     @RequestMapping(value = "/sendLocation", method = RequestMethod.GET)
     public String sendLocation(@RequestParam("latitude") Double latitude,
                                @RequestParam("longitude") Double longitude,
                                Model m) {
       // latitude와 longitude를 이용하여 서버에서 원하는 작업을 수행한다.
        List<SafetyMapVO> ss=service.getSafetyMap();
        List<SafetyMapVO> sss=service.getSafetyMapAddr(latitude,longitude);
        m.addAttribute("latitude",latitude);
        m.addAttribute("longitude",longitude);
        m.addAttribute("list", ss);
        m.addAttribute("listAddr", sss);
        return "/safetymap/locationReceived";
     }
}