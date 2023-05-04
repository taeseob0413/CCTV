package com.firstclass.childrenctv.safetyMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SafetyMapServiceImpl implements SafetyMapService {
	@Autowired
	private SafetyMapMapper mapper;
		
	@Override
	public void insert(List<SafetyMapVO> safetyList) {
		for(SafetyMapVO entity:safetyList) {
			mapper.insert(entity);
		}
		

	}

	@Override
	public List<SafetyMapVO> getSafetyMapAddr(double lat, double lon) {
		return mapper.getSafetyMapAddr(lat, lon);
	}

	@Override
	public List<SafetyMapVO> getSafetyMap() {
		return mapper.getSafetyMap();
	}

}
