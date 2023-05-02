package com.firstclass.childrenctv.safetyMap;

import java.util.List;


public interface SafetyMapService {
   void insert(List<SafetyMapVO> safetyList);
   
   List<SafetyMapVO> getSafetyMapAddr(double lat , double lon);
   
   List<SafetyMapVO> getSafetyMap();
}