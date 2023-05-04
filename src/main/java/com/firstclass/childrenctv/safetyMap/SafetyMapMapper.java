package com.firstclass.childrenctv.safetyMap;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface SafetyMapMapper {
   public void insert(SafetyMapVO safetymap);
   
   public List<SafetyMapVO> getSafetyMapAddr(double lat , double lon);
   
   public List<SafetyMapVO> getSafetyMap();
}