package com.gygproductions.bmwstore;

import org.apache.catalina.startup.Tomcat;

import java.util.Optional;

public class Main {
    public static final Optional<String> PORT = Optional.ofNullable(System.getenv("PORT"));

    public static void main(String[] args) throws Exception {
        String contextPath = "/" ;
        String appBase = ".";
        Tomcat tomcat = new Tomcat();
        //Use this PORT variable to set the port on Tomcat instance
        tomcat.setPort(Integer.valueOf(PORT.orElse("8080") ));
        tomcat.getHost().setAppBase(appBase);
        tomcat.addWebapp(contextPath, appBase);
        tomcat.start();
        tomcat.getServer().await();
    }
}
