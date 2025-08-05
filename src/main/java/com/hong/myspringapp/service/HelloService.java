package com.hong.myspringapp.service;

import org.springframework.stereotype.Service;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Date;


@Service
public class HelloService {

    private static final String NEW_LINE = System.lineSeparator();

    public String sayHello() {
        Path path = Paths.get("/app/history.txt");
        Date date = new Date();
        System.out.println(path.toAbsolutePath().toString());
        writeFile(path, date.toString());

        return "Hello from Hong's Spring Boot Application!" + readFile(path);
    }


    private static void writeFile(Path path, String content) {

        // default utf_8
        // file does not exists, create and write it
        // if the file exists, override the content
        //Files.writeString(path, content);

        // Append mode
        try (BufferedWriter bufferedWriter = Files.newBufferedWriter(
                path, StandardOpenOption.APPEND, StandardOpenOption.CREATE);
             PrintWriter printWriter = new PrintWriter(bufferedWriter))
        {
            printWriter.println("This is a line");
            Files.writeString(path, content,
                StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    private static String readFile(Path path) {

        // default utf_8
        // file does not exists, create and write it
        // if the file exists, override the content
        //Files.writeString(path, content);

        // Append mode

        try {
            return Files.readString(path);
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return "NaN";
        }
    }

}