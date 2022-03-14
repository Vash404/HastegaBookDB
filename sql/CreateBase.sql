
CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `authors` (`id`, `name`, `surname`, `createdAt`, `updatedAt`) VALUES
(1, 'George', 'Orwell', '2022-03-11 17:14:44', '2022-03-11 17:14:44'),
(2, 'Philip', 'Dick', '2022-03-11 17:14:44', '2022-03-11 17:14:44'),
(3, 'Walt', 'Disney', '2022-03-11 17:14:44', '2022-03-11 17:14:44');


CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `trama` varchar(255) DEFAULT NULL,
  `numeroLetture` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `books` (`id`, `title`, `isbn`, `trama`, `numeroLetture`, `createdAt`, `updatedAt`, `authorId`) VALUES
(1, '1984', '3457345875347', 'Grande Fratello', 1, '2022-03-11 17:15:10', '2022-03-13 01:03:25', 1),
(2, 'La svastica sul sole', '432435624564256', 'Nazisti vincono la guerra', 2, '2022-03-11 17:15:10', '2022-03-13 16:50:52', 2),
(3, 'UBIK', '5435345', 'Ottimo libro', 3, '2022-03-11 17:15:44', '2022-03-12 01:09:52', 2);


CREATE TABLE `owneds` (
  `id` int(11) NOT NULL,
  `owned` tinyint(1) DEFAULT 1,
  `nreads` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `users` (`id`, `name`, `surname`, `email`, `createdAt`, `updatedAt`) VALUES
(1, 'uno', 'one', '32323@33.it', '2022-03-11 17:16:21', '2022-03-11 17:16:21'),
(2, 'due', 'two', 'fsdffds@fddf.it', '2022-03-11 17:16:21', '2022-03-11 17:16:21'),
(3, 'quattro', 'four', 'asffas@ddk.it', '2022-03-11 17:16:44', '2022-03-11 17:16:44');


ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorId` (`authorId`);


ALTER TABLE `owneds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owneds_bookId_userId_unique` (`userId`,`bookId`),
  ADD KEY `bookId` (`bookId`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `owneds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;


ALTER TABLE `owneds`
  ADD CONSTRAINT `owneds_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owneds_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
