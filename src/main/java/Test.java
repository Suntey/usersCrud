package main.java; /**
 * Created by Suntey on 13.02.2017.
 */

import main.java.model.User;
import main.java.service.UserService;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import java.sql.Timestamp;
import java.util.Date;


public class Test {
    public static void main(String[] args) {


        ClassPathXmlApplicationContext getBean = new ClassPathXmlApplicationContext("webapp/WEB-INF/spring-servlet.xml");
        UserService userService = (UserService) getBean.getBean("userService");
        userService.createUser(new User("Диман", 26, true, new Timestamp(new Date().getTime())));

    }
}
