CREATE TABLE CW2.user_info
(
user_ID INTEGER IDENTITY(1,1) NOT NULL,
email_address VARCHAR(100) NOT NULL,
role_held VARCHAR(50) NOT NULL

CONSTRAINT PK_user_info PRIMARY KEY (user_ID)
);


CREATE TABLE CW2.trail
(
trail_ID INTEGER IDENTITY(1,1) NOT NULL,
trail_name VARCHAR(100) NOT NULL,
trail_length FLOAT,
elevation_gain INTEGER,
trail_description VARCHAR(500),
route_type VARCHAR(15)
    CHECK(route_type = 'loop' OR route_type ='out and back'),
difficulty VARCHAR(15)
    CHECK(difficulty = 'easy' OR difficulty ='moderate' OR difficulty = 'hard'),
rating DECIMAL
    CHECK(rating >= 0 AND rating <= 5),
est_time TIME,
location_name VARCHAR (500),
owner_ID INTEGER

CONSTRAINT PK_trail PRIMARY KEY (trail_ID)
FOREIGN KEY (owner_ID)
REFERENCES CW2.user_info (user_ID)
);


CREATE TABLE CW2.geo_point
(
point_ID INTEGER IDENTITY(1,1) NOT NULL,
latitude FLOAT NOT NULL
    CHECK (latitude >= -90 AND latitude <= 90),
longitude FLOAT NOT NULL
    CHECK (longitude >= -180 AND longitude <= 180),

CONSTRAINT PK_geo_point PRIMARY KEY (point_ID)
);


CREATE TABLE CW2.trail_geo_point
(
trail_ID INTEGER NOT NULL,
point_ID INTEGER NOT NULL,
order_no INTEGER

CONSTRAINT PK_trail_geo_point PRIMARY KEY (trail_ID, point_ID)
);


CREATE TABLE CW2.tag
(
tag_ID INTEGER IDENTITY(1,1) NOT NULL,
tag_name VARCHAR(30),

CONSTRAINT PK_tag PRIMARY KEY (tag_ID)
);


CREATE TABLE CW2.trail_tag_link
(
tag_ID INTEGER NOT NULL,
trail_ID INTEGER NOT NULL,

CONSTRAINT PK_trail_tag_link PRIMARY KEY (tag_ID, trail_ID)
);