package com.firstclass.childrenctv.childApi;

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
import com.firstclass.childrenctv.childBoard.ChildBoardService;
import com.firstclass.childrenctv.childBoard.ChildBoardVO;


import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/childapi")
public class ChildApiController {
   @Autowired
   private ChildBoardService childService;
   
   @GetMapping("/childboard")
    public ResponseEntity<String> childData() {
        // API 요청을 보낼 URL
        String url = "https://www.safe182.go.kr/api/lcm/findChildList.do";
        // API 요청 시 필요한 파라미터
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("esntlId", "10000532");
        params.add("authKey", "180928cbe4e14d7f");
        params.add("rowSize", "42");
        params.add("writngTrgetDscds", "010");
        params.add("page", "2");

        // RestTemplate을 사용하여 API 요청을 보내고 응답 데이터를 받아옴
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, params, String.class);
        String responseBody = response.getBody();

        // 받아온 응답 데이터를 파싱하여 SafeMapEntity 객체 리스트로 변환
        List<ChildBoardVO> childEntityList = parseResponseData(responseBody);

        // SafeMapService를 사용하여 DB에 저장
        childService.insert(childEntityList);

        // 성공적으로 저장되었다는 응답 메시지 반환
        return ResponseEntity.ok("Data saved successfully.");
    }

    // 응답 데이터를 파싱하여 SafeMapEntity 객체 리스트로 변환하는 메소드
    private List<ChildBoardVO> parseResponseData(String responseBody) {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = null;
        try {
            rootNode = objectMapper.readTree(responseBody);
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<ChildBoardVO> entityList =new LinkedList<>();
        //List<SafetyMapVO> entityList = new ArrayList<>();
        if (rootNode != null) {
            JsonNode listNode = rootNode.get("list");
            if (listNode != null) {
                for (JsonNode itemNode : listNode) {
                    // 필요한 데이터를 추출하여 SafeMapEntity 객체 생성
                   ChildBoardVO entity = new ChildBoardVO();
                    entity.setChild_curage(itemNode.get("ageNow").asText());
                    entity.setChild_occage(itemNode.get("age").asText());
                    entity.setChild_outfit(itemNode.get("alldressingDscd").asText());
                    entity.setChild_feature(itemNode.get("etcSpfeatr").asText());
                    entity.setChild_gender(itemNode.get("sexdstnDscd").asText());
                    //entity.setChild_img(itemNode.get("tknphotoFile").asText());
                    entity.setChild_img("https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd="+itemNode.get("msspsnIdntfccd").asText());
                    entity.setChild_location(itemNode.get("occrAdres").asText());
                    entity.setChild_name(itemNode.get("nm").asText());
                    entity.setChild_time(itemNode.get("occrde").asText());
                    
                    entityList.add(entity);
                }
            }
        }

        return entityList;
    }
}
