package com.firstclass.childrenctv.util;

public final class MailTemplate {

    public static String reportNotification(String userName, String childName, String url){
        String text = "<br><br> 안녕하세요. "+userName+"님. <br><br> "+userName+"님이 찾으시고 계신 아이 "+childName+"에 대한 제보가 들어왔습니다.<br><br>"+
                "<a href='"+url+"'>해당 제보에 대한 링크입니다.</a><br><br>" +
                "해당 제보를 통해 "+childName+"이 "+userName+"님의 품으로 돌아오길 바라며, <br><br>"+
                "저희 CCTV는 "+childName+"이 최대한 빨리 "+userName+"님의 품으로 돌아갈 수 있도록 <br><br>" +
                "경찰과 지속적으로 협력하겠습니다.<br><br>";
        return basicTemplate(text);
    }
    public static String findPassword(String userName, String password){
        String text = "<br><br> 안녕하세요. "+userName+"님. <br><br> "+userName+"님의 비밀번호는 다음과 같습니다.<br><br>"+
                password + "</a><br><br>" +
                "로그인 이후 해당 이메일을 삭제해주시기 바라며, 비밀번호 변경을 권장드립니다.<br><br>"+
                "항상 노력하는 CCTV가 되겠습니다. 감사합니다.<br><br>";
        return basicTemplate(text);
    }
    public static String basicTemplate(String text){
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<body>\n" +
                "<div id='logoBox' style='display: inline-block; width: 100%; height: 100px; text-align: center'>\n" +
                "    <div id='logo' style='display : inline-block; width : 700px; margin : 20px : auto;'><img src='/resources/image/logo.png' width='200' height='70'></div>\n" +
                "</div>\n" +
                "  \n" +
                "<div id='contentArea' style= 'text-align: center; ' >"+
                "<div id='contentBox' style= 'display: inline-block; width: 1000px; background-color : #4a89dc'>\n" +
                "    <h1 id='content' style='display : inline-block; width : 900px;'>\n" +
                text +
                "    </h1>\n" +
                "</div>\n" +
                "</div>" +
                "</body>\n" +
                "</html>";
    }
}
