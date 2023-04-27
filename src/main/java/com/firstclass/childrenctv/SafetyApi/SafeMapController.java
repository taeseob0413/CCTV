package com.firstclass.childrenctv.SafetyApi;

import java.io.IOException;
import java.util.List;
import java.util.LinkedList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.firstclass.childrenctv.SafetyMap.SafetyMapService;
import com.firstclass.childrenctv.SafetyMap.SafetyMapVO;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/api")
public class SafeMapController {

    @Autowired
    private SafetyMapService safeMapService;

    @GetMapping("/safemap")
    public ResponseEntity<String> saveSafeMapData() {
        // API 요청을 보낼 URL
        String url = "https://www.safe182.go.kr/api/lcm/safeMap.do";
        // API 요청 시 필요한 파라미터
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("esntlId", "10000532");
        params.add("authKey", "180928cbe4e14d7f");
        params.add("pageIndex", "3");
        params.add("pageUnit", "100");
        
        // RestTemplate을 사용하여 API 요청을 보내고 응답 데이터를 받아옴
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, params, String.class);
        String responseBody = response.getBody();

        // 받아온 응답 데이터를 파싱하여 SafeMapEntity 객체 리스트로 변환
        List<SafetyMapVO> safeMapEntityList = parseResponseData(responseBody);

        // SafeMapService를 사용하여 DB에 저장
        safeMapService.insert(safeMapEntityList);

        // 성공적으로 저장되었다는 응답 메시지 반환
        return ResponseEntity.ok("Data saved successfully.");
    }

    // 응답 데이터를 파싱하여 SafeMapEntity 객체 리스트로 변환하는 메소드
    private List<SafetyMapVO> parseResponseData(String responseBody) {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = null;
        try {
            rootNode = objectMapper.readTree(responseBody);
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<SafetyMapVO> entityList =new LinkedList<>();
        //List<SafetyMapVO> entityList = new ArrayList<>();
        if (rootNode != null) {
            JsonNode listNode = rootNode.get("list");
            if (listNode != null) {
                for (JsonNode itemNode : listNode) {
                    // 필요한 데이터를 추출하여 SafeMapEntity 객체 생성
                   SafetyMapVO entity = new SafetyMapVO();
                    entity.setSafety_name(itemNode.get("bsshNm").asText());
                    entity.setSafety_address(itemNode.get("adres").asText());
                    entity.setSafety_class(itemNode.get("clNm").asText());
                    entity.setSafety_telno(itemNode.get("telno").asText());
                    entity.setSafety_latitude(itemNode.get("lcinfoLa").asDouble());
                    entity.setSafety_longitude(itemNode.get("lcinfoLo").asDouble());
                    
                    entityList.add(entity);
                }
            }
        }

        return entityList;
    }
}