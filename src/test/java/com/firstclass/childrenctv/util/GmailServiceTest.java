package com.firstclass.childrenctv.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class GmailServiceTest {
    @Autowired
    private GmailService gmailService;

    @Test
    void send() {
        String email = "eowns1209@gmail.com";
        String title = "제목";
        String text = "내용";

        gmailService.send(email, title, text);
    }
}