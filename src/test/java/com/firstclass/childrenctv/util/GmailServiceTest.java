package com.firstclass.childrenctv.util;

import com.firstclass.childrenctv.util.email.GmailService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class GmailServiceTest {
    @Autowired
    private GmailService gmailService;

    @Test
    void send() {
        String email = "lunn297@gmail.com";
        String title = "제목";
        String text = "내용";

        gmailService.send(email, title, text);
    }
}