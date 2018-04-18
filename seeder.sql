USE ibeemer_db;

INSERT INTO users( username, email, password) VALUES
  ('username1','benji@gmail.com', '$2a$12$RRRPiINRrE4S1aAiKddHmelZKtI0z1GrMpqLAQbonUILoaGkmPAQO');

INSERT INTO categories (category_name) VALUES
  ('X1'),
  ('X3'),
  ('X5'),
  ('M3'),
  ('M5'),
  ('M8'),
  ('Classics'),
  ('For Sale');

INSERT INTO posts (user_id, title, description) VALUES
  (1, 'BMW M2 Competition: Interview with the BMW M Boss',
  '
   The introduction of the brand new BMW M2 Competition marked the opportunity for me to sit down with BMW Boss, Frank Van Meel, to discuss the future of the brand that has pioneered concepts that guarantee pure driving pleasure, encompasses an history of motorsport and sheer driving passion every single day – on the road or on the track.

   A few days ago at an undisclosed location near Munich, Frank ran me through the highlights of the M2 Competition during an exclusive first look at the vehicle. The M2C is the replacement to the current M2, which has been with us for the last two years. The highly successful and best-selling M-car has proved that the market was desperately looking for a M-car positioned at a lower price point.
      '
      ),
  (1, 'WORLD PREMIERE: BMW M2 Competition — Potential Future Classic?',
  '
  When the BMW M2 first debuted, it was seen as a sign of BMW returning to greatness. The M2 represented the best qualities of what BMW used to be, the BMW enthusiasts once knew and missed dearly. It was smaller than the M3 and M4, moderately powerful and focused more on handling feel, rather than performance figures or lap times. It was a car that gave enthusiasts hope, hope that BMW was again moving in the right direction. The BMW M2 was thought of as the modern-day E46 M3, which is largely considered to be the best M3 of all time. So, naturally, almost as soon as it debuted, fans were already thinking ahead. They wanted a lighter, sharper, faster version, akin to the legendary E46 BMW M3 CSL. And now they may have gotten just that, with the brand-new BMW M2 Competition.
  '
  ),
  (1, 'BMW CCA membership gets a major update',
  '
           The BMW CCA announced a major update to the Membership Reward Rebate Program this week. Individuals who purchase a club membership of three or more years will now immediately qualify for the Membership Reward Rebate Program and may be eligible to receive a rebate of up to $1,500. This means you can now skip the old waiting period of 365 days and immediately apply for a rebate with this new option.

   A three-year club membership can be purchased for only $134 at bmwcca.org or by calling the club office at 864-250-0022.
                                ');


INSERT INTO pivot_categories (posts_id, categories_id) VALUES
  (1, 5),
  (2, 5),
  (3, 5);

INSERT INTO media (location) VALUES
  ('/resources/img/automobile-bmw-z4-car-93617.jpg'),
  ('/resources/img/AdobeStock_182210728.jpeg'),
  ('/resources/img/automotive-bmw-car-113176.jpg');

INSERT INTO pivot_media (media_id, ad_id)
VALUES ('1','1'),
('2','2'),
('3','3');
