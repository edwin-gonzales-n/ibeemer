package com.gygproductions.bmwstore.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String created_on;
    private String location;
    private String category;
    private String upload;
    private String username;

    public Ad(long id, long userId, String title, String description, String category, String created_on, String location, String username) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.created_on = created_on;
        this.location = location;
        this.username = username;
    } // for extractAdsForMain object  -->  See MySQLAdsDao

    public Ad(long id, long userId, String title, String description, String created_on) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.created_on = created_on;
    }

    public Ad(long userId, String title, String description, String category, String location) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.location = location;
    }

    public Ad(long userId, String title, String description, String created_on, String category,String location) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.created_on = created_on;
        this.category = category;
        this.location = location;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Ad() {}

    public String getCategory() {
        return category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCreated_on() {
        return created_on;
    }

    public void setCreated_on(String created_on) {
        this.created_on = created_on;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUpload() {
        return upload;
    }

    public void setUpload(String upload) {
        this.upload = upload;
    }
}
