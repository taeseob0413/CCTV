package com.firstclass.childrenctv.util.email;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public final class MailText {
    private static final String BASIC_TEMPLATE_PATH = "src/main/webapp/resources/email/template/basicTemplate.jsp";
    private static final String REPORT_NOTIFICATION_PATH = "src/main/webapp/resources/email/notification/reportNotification.jsp";
    private static final String FIND_PASSWORD_PATH = "src/main/webapp/resources/email/user/findPassword.jsp";
    public static String getReportNotification(String userName, String childName, String url) throws IOException{
        String text = parse(REPORT_NOTIFICATION_PATH, BASIC_TEMPLATE_PATH);
        return text.replace("<%userName%>", userName)
                .replace("<%childName%>", childName)
                .replace("<%url%>", url);
    }
    public static String getFindPassword(String userName, String password) throws IOException{
        String text = parse(FIND_PASSWORD_PATH, BASIC_TEMPLATE_PATH);
        return text.replace("<%userName%>", userName)
                .replace("<%password%>", password);
    }

    private static String parse(String textPath, String templatePath) throws IOException {
        String template = Files.readString(Paths.get(templatePath));
        String text = Files.readString(Paths.get(textPath));
        return template.replace("<%text%>", text);
    }
}
