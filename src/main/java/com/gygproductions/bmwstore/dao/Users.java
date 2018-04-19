package com.gygproductions.bmwstore.dao;

import com.gygproductions.bmwstore.models.User;

public interface Users {
    User findByUsername(String username);
    User findByEmail(String email);
    Long insert(User user);
    String hashPassword(String password);
    void modifyEmail(String email, String user);
    void modifyPassword(String password, String user);
    String resetPassword(String password, String email);
}
