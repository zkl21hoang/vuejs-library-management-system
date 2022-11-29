CREATE TABLE IF NOT EXISTS `books` (
  `id` int auto_increment primary key,
  `author` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `avail` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO `books` (`author`, `name`, `type`, `avail`) VALUES
('Dan Brown', 'The Da Vinci Code', 'Thriller', 'Available'),
('JK Rowling', 'Harry Potter and the Deathly Hallows', 'Fantasy', 'Available'),
('Coleen Hoover', 'It Ends with Us', 'Romance', 'Unavailable'),
('Jasmine Gullory', 'The Proposal', 'Romance', 'Unavailable'),
('Bram Stoker', 'Dracula', 'Thriller', 'Available'),
('Algemon Blackwood', 'The Willows', 'Thriller', 'Unavailable'),
('George Orwell', 'Animal Farm', 'Fantasy', 'Available');