CREATE DATABASE IF NOT EXISTS InstaClone;
USE InstaClone;


-- users info table
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `login`             VARCHAR(255)        NOT NULL,
    `pass`              VARCHAR(255)        NOT NULL,
    `email`             VARCHAR(255)        NOT NULL,
);

-- profiles table
DROP TABLE IF EXISTS `users_profiles`;
CREATE TABLE `users_profiles`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `name`              VARCHAR(255)        NOT NULL,
    `last_name`         VARCHAR(255)        NOT NULL,
    `nickname`          VARCHAR(255)        NOT NULL,
    `age`               INT(3)              NOT NULL,
    `photo`             VARCHAR(255)        NOT NULL,
    `ip`                VARCHAR(255)        NOT NULL,
    `email`             VARCHAR(255)        NOT NULL,
);

-- posts table
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `user_id`           INT(255)            NOT NULL,
    `post_image`        VARCHAR(1000)       NOT NULL,
    `content`           TEXT                NOT NULL,
    `create_at `        TIMESTAMP,              
    `delete_at `        TIMESTAMP,
    `updated_at` 		TIMESTAMP,
);

-- `likes` table
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `user_id`           INT(255)            NOT NULL,
    `post_id`           INT(255)            NOT NULL,
    `delete_at`         TIMESTAMP           NOT NULL
);

--  link table posts > tags
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `post_id`           INT(255)            NOT NULL,
    `tag_id`            INT(255)            NOT NULL,
);

--  tags table
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`
(
    `id`                INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `name`              VARCHAR(255)        NOT NULL,
)

-- link table users > roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`
(
    `id`               INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `user_id`          INT(255)            NOT NULL, 
    `role_id`          INT(255)            NOT NULL, 
);

-- roles table
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` 
(
    `id`               INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `name`             VARCHAR(255)        NOT NULL, 
);

-- access table
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` 
(
    `id`               INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `route_id`         INT(255)            NOT NULL,
    `role_id`          INT(255)            NOT NULL,
);

-- routes table
DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes`
(
    `id`               INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `route`            INT(255)            NOT NULL,
);

-- delete requests table
DROP TABLE IF EXISTS `delete`;
CREATE TABLE `delete`
(
    `id`               INT(255)            AUTO_INCREMENT		PRIMARY KEY,
    `user_id`          INT(255)            NOT NULL,
    `created_at`       TIMESTAMP           NOT NULL,
);


-- FK

-- FK user_id for `users_profiles` and PK `users`
ALTER TABLE `users_profiles`

	ADD CONSTRAINT FK_user_profiles_users FOREIGN KEY(user_id)
		REFERENCES users(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK user_id for `posts` and PK `users`
ALTER TABLE `posts`

	ADD CONSTRAINT FK_posts_users FOREIGN KEY(user_id)
		REFERENCES users(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK user_id for `delete` and PK `users`
ALTER TABLE `delete`

	ADD CONSTRAINT FK_delete_users FOREIGN KEY(user_id)
		REFERENCES users(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK user_id for `user_roles` and PK `users`
-- FK role_id for `user_roles` and PK `roles`
ALTER TABLE `user_roles`

	ADD CONSTRAINT FK_user_roles_users FOREIGN KEY(user_id)
		REFERENCES users(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

    ADD CONSTRAINT FK_user_roles_roles FOREIGN KEY(role_id)
		REFERENCES roles(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK role_id for `access` and PK `roles`
-- FK route_id for `access` and PK `routes`
ALTER TABLE `access`

ADD CONSTRAINT FK_access_roles FOREIGN KEY(role_id)
		REFERENCES roles(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;        

ADD CONSTRAINT FK_access_routes FOREIGN KEY(route_id)
		REFERENCES routes(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK user_id for `likes` and PK `users`
-- FK post_id for `likes` and PK `posts`
ALTER TABLE `likes`

ADD CONSTRAINT FK_likes_users FOREIGN KEY(user_id)
		REFERENCES users(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

ADD CONSTRAINT FK_likes_posts FOREIGN KEY(post_id)
		REFERENCES posts(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

-- FK post_id for `post_tags` and PK `posts`
-- FK tag_id for `post_tags` and PK `tags`
ALTER TABLE `post_tags`

ADD CONSTRAINT FK_post_tags_posts FOREIGN KEY(post_id)
		REFERENCES posts(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;

ADD CONSTRAINT FK_post_tags_tags FOREIGN KEY(tag_id)
		REFERENCES tags(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT;