package com.gygproductions.bmwstore.dao;

import com.gygproductions.bmwstore.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> searchedAds(String s, String c);

    List<Ad> profileAds(String s);

    List<Ad> individualAd(String adID);

    List<Ad> searchPosts(String search);

    void titleChange(String title, String adId);

    void descriptionChange(String description, String adId);

    void deleteAd(String adId);
}
