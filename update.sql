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
    LIKE "%boss%"            
     or c.category_`name = "%boss%";
