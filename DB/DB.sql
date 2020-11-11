CREATE DATABASE InstaClone
GO

CREATE TABLE `users`
(
    `id` int(255) NOT NULL,
    `login` varchar(255) NOT NULL,
    `pass` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
)

CREATE TABLE `users_profiles`
(
    `id` int(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `nickname` varchar(255) NOT NULL,
    `age` int(5) NOT NULL,
    `photo` varchar(255) NOT NULL,
    `ip` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
)

CREATE TABLE `posts`
(
    `id` int(255) NOT NULL,
    `user_id` int(255) NOT NULL,
    `post_image`varchar(1000) NOT NULL,
    `content` varchar(1000) NOT NULL,
    create_at date GETDATE(),
    delete_at date NOT NULL,
)