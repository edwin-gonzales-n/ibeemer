SELECT *
  FROM posts 
  JOIN pivot_categories pc
    ON posts.id = pc.posts_id 
  JOIN categories c
    ON pc.categories_id = c.id 
  join pivot_media
    on posts.id = pivot_media.post_id 
  join media
    on pivot_media.media_id = media.id 
 order by post_id;


SELECT * 
   FROM posts 
   JOIN users 
     ON posts.user_id = users.id 
   JOIN pivot_categories pc 
     ON posts.id = pc.posts_id 
   JOIN categories c 
     ON pc.categories_id = c.id 
   join pivot_media 
     on posts.id = pivot_media.post_id 
   join media 
     on pivot_media.media_id = media.id 
  WHERE posts.title 
    LIKE "%boss%" 
     or c.category_name = "%boss%";

SELECT * 
   FROM posts                  
   JOIN users                   
     ON posts.user_id = users.id                
   JOIN pivot_categories pc                   
     ON posts.id = pc.posts_id                
   JOIN categories c                   
     ON pc.categories_id = c.id                
   join pivot_media                   
     on posts.id = pivot_media.post_id                
   join media                   
     on pivot_media.media_id = media.id                
  WHERE posts.title                    
    LIKE "%codeup%"            
     or c.category_name = "%codeup%"
     or posts.description = "%codeup%";



SELECT *,date_format(`created_on`, '%D %M, %Y') as created_on
   FROM posts
   JOIN users
     ON posts.user_id = users.id
   JOIN pivot_categories pc
     ON posts.id = pc.posts_id
   JOIN categories c
     ON pc.categories_id = c.id
   join pivot_media
     on posts.id = pivot_media.post_id
   join media
     on pivot_media.media_id = media.id
  order by post_id;

select location, posts.id,title,description,category,username



date_format(`created_on`, '%D %M, %Y') as created_on 



select posts.id, posts.user_id, posts.title, posts.description,
       category_name,
       date_format(`created_on`, '%D %M, %Y') as created_on,
       media.location, users.username
   from posts
   JOIN users
     ON posts.user_id = users.id
   JOIN pivot_categories pc
     ON posts.id = pc.posts_id
   JOIN categories c
     ON pc.categories_id = c.id
   join pivot_media
     on posts.id = pivot_media.post_id
   join media
     on pivot_media.media_id = media.id
  order by post_id;


