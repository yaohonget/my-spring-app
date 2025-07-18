package com.hong.myspringapp;

import org.springframework.stereotype.Service;

@Service
public class HelloService {
    public String sayHello(){
        return "Hello from Hong's Spring Boot Application!";
    }
}