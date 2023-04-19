package com.firstclass.childrenctv.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailTemplateTest {
    @Autowired
    private GmailService gmailService;

    private String email = "eowns1209@gmail.com";
    @Test
    void reportNotification() {
        try {
            gmailService.send(email, "CCTV 제보", MailTemplate.reportNotification("장대준", "응애", "www.naver.com"));
        }
        catch (Exception e){
            fail();
        }
    }

    @Test
    void findPassword() {
        try {
            gmailService.send(email, "CCTV 제보", MailTemplate.findPassword("장대준", "테스트12"));
        }
        catch (Exception e){
            fail();
        }
    }
}