package com.fc.test;

import com.fc.entity.Student;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanTest {
    @Test
    public  void test(){
        //获取容器
       ApplicationContext ApplicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Student student = (Student) ApplicationContext.getBean("student5");
        System.out.println(student);


    }


}
