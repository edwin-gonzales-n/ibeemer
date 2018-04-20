package com.gygproductions.bmwstore.dao;

import com.gygproductions.bmwstore.Config;
import com.gygproductions.bmwstore.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(config.getUrl(), config.getUser(), config.getPassword());
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement
                    (
                            "SELECT posts.id, posts.user_id, posts.title, posts.description,\n" + "       category_name,\n" + "       date_format(`created_on`, '%D %M, %Y') AS created_on,\n" + "       media.location, users.username\n" + "   FROM posts\n" + "   JOIN users\n" + "     ON posts.user_id = users.id\n" + "   JOIN pivot_categories pc\n" + "     ON posts.id = pc.posts_id\n" + "   JOIN categories c\n" + "     ON pc.categories_id = c.id\n" + "   JOIN pivot_media\n" + "     ON posts.id = pivot_media.post_id\n" + "   JOIN media\n" + "     ON pivot_media.media_id = media.id\n" + "  ORDER BY post_id;\n" + "\n"

                    );

            ResultSet rs = stmt.executeQuery();
            return createAdsForMain(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

//    private Ad extractAd(ResultSet rs) throws SQLException {
//        return new Ad(rs.getLong("id"), rs.getLong("user_id"), rs.getString("title"), rs.getString("description"), rs.getString("category"), rs.getString("created_on"), rs.getString("location"));
//    }

    private Ad extractAdsforMain(ResultSet rs) throws SQLException {
        return new Ad(rs.getLong("id"), rs.getLong("user_id"), rs.getString("title"), rs.getString("description"), rs.getString("category_name"), rs.getString("created_on"), rs.getString("location"), rs.getString("username"));
    }

//    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
//        List<Ad> ads = new ArrayList<>();
//        while (rs.next()) {
//            ads.add(extractAd(rs));
//        }
//        return ads;
//    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO posts(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            Long holder = Long.parseLong(ad.getCategory());
            System.out.println("This is the value of the holder " + holder);
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            System.out.println("rs.getLong(1) = " + rs.getLong(1));
            System.out.println("rs.getString(1) = " + rs.getString(1));

            insertMedia(ad.getLocation(), rs.getInt(1));
            insertCat(rs.getInt(1), holder);
            return rs.getLong(1);

        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new post.", e);
        }
    }

    private void insertCat(int rs, Long cat) {
        try {
            String insertQuery = "" + "INSERT INTO " + "pivot_categories (posts_id, categories_id) " + "VALUES (?,?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, rs);
            stmt.setLong(2, cat);
            stmt.executeUpdate();
            ResultSet pr = stmt.getGeneratedKeys();
            pr.next();
        } catch (SQLException e) {
            throw new RuntimeException("Error adding category", e);
        }
    }

    private void insertMedia(String location, int rs) {
        try {
            String insertQuery = "" + "INSERT INTO media (location) VALUES (?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, location);
            stmt.executeUpdate();
            ResultSet resultSet = stmt.getGeneratedKeys();
            resultSet.next();
            int media_id = resultSet.getInt(1);
            insertQuery = "" + "INSERT INTO pivot_media(media_id, post_id) " + "VALUES (?,?)";
            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, media_id);
            stmt.setInt(2, rs);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error adding file location", e);
        }
    }


    public List<Ad> profileAds(String s) {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("" + "SELECT * " + "FROM posts " + "JOIN users " + "ON posts.user_id = users.id " + "JOIN pivot_categories pc " + "ON posts.id = pc.posts_id " + "JOIN categories c " + "ON pc.categories_id = c.id " + "JOIN pivot_media " + "ON posts.id = pivot_media.post_id " + "JOIN media " + "ON pivot_media.media_id = media.id " + "WHERE username=?");

            stmt.setString(1, s);
            ResultSet rs = stmt.executeQuery();
            return createAdsForMain(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all user posts.", e);
        }
    }


    private List<Ad> createAdsForMain(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAdsforMain(rs));
        }
        return ads;
    }

    @Override
    public List<Ad> searchedAds(String searchInput, String searchCat) {
        System.out.println("searchInput = " + searchInput);
        System.out.println("searchCat = " + searchCat);
        PreparedStatement pst = null;
        try {

            pst = connection.prepareStatement("" + "SELECT * " + "FROM posts " + "JOIN users " + "ON posts.user_id = users.id " + "JOIN pivot_categories pc " + "ON posts.id = pc.posts_id " + "JOIN categories c " + "ON pc.categories_id = c.id " + "JOIN pivot_media " + "ON posts.id = pivot_media.post_id " + "JOIN media " + "ON pivot_media.media_id = media.id " + "WHERE posts.title " + "LIKE  ?  " + "AND c.category_name = ?");

            pst.setString(1, "%" + searchInput + "%");
            pst.setString(2, searchCat);
            ResultSet rs = pst.executeQuery();
            return createAdsForMain(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving matching posts.", e);
        }
    }


    @Override
    public List<Ad> individualAd(String adID) {
        PreparedStatement pst = null;
        try {
            pst = connection.prepareStatement
                    (
//                            "" + "SELECT * " + "FROM posts " + "JOIN pivot_categories pc " + "ON posts.id = pc.posts_id " + "JOIN categories c " + "ON pc.categories_id = c.id " + "JOIN pivot_media " + "ON posts.id = pivot_media.post_id " + "JOIN media " + "ON pivot_media.media_id = media.id "
//                                    + "WHERE posts.id=?"
                            "SELECT posts.id, posts.user_id, posts.title, posts.description,\n" + "       category_name,\n" + "       date_format(`created_on`, '%D %M, %Y') AS created_on,\n" + "       media.location, users.username\n" + "   FROM posts\n" + "   JOIN users\n" + "     ON posts.user_id = users.id\n" + "   JOIN pivot_categories pc\n" + "     ON posts.id = pc.posts_id\n" + "   JOIN categories c\n" + "     ON pc.categories_id = c.id\n" + "   JOIN pivot_media\n" + "     ON posts.id = pivot_media.post_id\n" + "   JOIN media\n" + "     ON pivot_media.media_id = media.id\n" + "  where post_id = ?;"
                    );

            pst.setString(1, adID);
            ResultSet rs = pst.executeQuery();
            return createAdsForMain(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving specific add", e);
        }
    }

    @Override
    public void titleChange(String title, String adId) {
        String query = "" + "UPDATE posts " + "SET title = ? " + "WHERE id = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setInt(2, Integer.parseInt(adId));
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error changing title.", e);
        }
    }


    @Override
    public void descriptionChange(String description, String adId) {
        String query = "" + "UPDATE posts " + "SET description = ? " + "WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, description);
            stmt.setInt(2, Integer.parseInt(adId));
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error changing email.", e);
        }
    }

    @Override
    public void deleteAd(String adId) {
        String query = "" + "DELETE FROM posts WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, adId);
            System.out.println(stmt);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("VendorError: " + e.getErrorCode());
            throw new RuntimeException("Error deleting ad");
        }
    }

    @Override
    public List<Ad> searchPosts(String searchInput) {
        PreparedStatement pst = null;
        try {
            pst = connection.prepareStatement("" + "SELECT * " + "FROM posts " + "JOIN users " + "ON posts.user_id = users.id " + "JOIN pivot_categories pc " + "ON posts.id = pc.posts_id " + "JOIN categories c " + "ON pc.categories_id = c.id " + "JOIN pivot_media " + "ON posts.id = pivot_media.post_id " + "JOIN media " + "ON pivot_media.media_id = media.id " + "WHERE posts.title " + "LIKE  ?  " + " or c.category_name like ? or posts.description like ?");

            pst.setString(1, "%" + searchInput + "%");
            pst.setString(2, "%" + searchInput + "%");
            pst.setString(3, "%" + searchInput + "%");
            ResultSet rs = pst.executeQuery();
            return createAdsForMain(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new post.", e);
        }
    }
}
