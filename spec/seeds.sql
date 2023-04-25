DROP TABLE IF EXISTS recipes;

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);

TRUNCATE recipes RESTART IDENTITY;

INSERT INTO recipes (name, cooking_time, rating) VALUES
('Pepperoni Pizza', 10, 5),
('Fish & Chips', 25, 3),
('Choriza and Broccoli Pasta', 15, 5),
('Ham & Cheese Sandwich', 1, 4),
('Microwave Meal', 4, 2);
