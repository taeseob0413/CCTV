package com.firstclass.childrenctv.SafetyMap;

import java.util.List;


public interface SafetyMapService {
   void insert(List<SafetyMapVO> safetyList);
   
   List<SafetyMapVO> getSafetyMapAddr(double lat , double lon);
   
   List<SafetyMapVO> getSafetyMap();
}