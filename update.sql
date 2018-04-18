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
