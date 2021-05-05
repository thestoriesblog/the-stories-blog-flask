-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 09:10 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storyblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'Charu Sharma', 'charusharma123@gmail.com', '+91-9456811771', '', '2021-05-02 07:41:11'),
(2, 'Aakash', 'aakash.nit605@gmail.com', '+918197678062', 'phone_num = db.Column(db.String(30), nullable=False)', '2021-05-02 08:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `postedby` varchar(30) NOT NULL,
  `dateofpost` datetime NOT NULL,
  `img_file` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `postedby`, `dateofpost`, `img_file`) VALUES
(1, 'The Foolish Donkey', 'TheFoolishDonkey1', 'A salt seller used to carry the salt bag on his donkey to the market every day.On the way they had to cross a stream. One day the donkey suddenly tumbled down the stream and the salt bag also fell into the water. The salt dissolved in the water and hence the bag became very light to carry. The donkey was happy.Then the donkey started to play the same trick every day.The salt seller came to understand the trick and decided to teach a lesson to it. The next day he loaded a cotton bag on the donkey.Again it played the same trick hoping that the cotton bag would be still become lighter.But the dampened cotton became very heavy to carry and the donkey suffered. It learnt a lesson. It didn’t play the trick anymore after that day, and the seller was happy. Moral of the story:Luck won’t favor always.', 'Charu Sharma', '2021-05-02 13:02:33', 'The-Foolish-Donkey.jpg'),
(3, 'The Four Smart Students', 'The-Four-Smart-Students', 'One night four college students were out partying late night and didn’t study for the test which was scheduled for the next day. In the morning, they thought of a plan.\r\n\r\nThey made themselves look dirty with grease and dirt.\r\n\r\nThen they went to the Dean and said they had gone out to a wedding last night and on their way back the tire of their car burst and they had to push the car all the way back. So they were in no condition to take the test.\r\n\r\nThe Dean thought for a minute and said they can have the re-test after 3 days. They thanked him and said they will be ready by that time.\r\n\r\nOn the third day, they appeared before the Dean. The Dean said that as this was a Special Condition Test, all four were required to sit in separate classrooms for the test. They all agreed as they had prepared well in the last 3 days.\r\n\r\nThe Test consisted of only 2 questions with the total of 100 Points:\r\n\r\n \r\n\r\n1) Your Name? __________ (1 Points)\r\n\r\n2) Which tire burst? __________ (99 Points)\r\nOptions – (a) Front Left (b) Front Right (c) Back Left (d) Back Right\r\n\r\n \r\nMoral of the story:\r\nTake responsibility or you will learn your lesson.', 'Nimita Pandey', '2021-05-01 20:14:23', 'The-Four-Smart-Students.jpg'),
(4, 'Life of Happiness', 'Life-Of-Happiness', 'An old man lived in the village. He was one of the most unfortunate people in the world. The whole village was tired of him; he was always gloomy, he constantly complained and was always in a bad mood.\r\n\r\nThe longer he lived, the more bile he was becoming and the more poisonous were his words. People avoided him, because his misfortune became contagious. It was even unnatural and insulting to be happy next to him.\r\n\r\nHe created the feeling of unhappiness in others.\r\n\r\nBut one day, when he turned eighty years old, an incredible thing happened. Instantly everyone started hearing the rumour:\r\n\r\n \r\n\r\n“An Old Man is happy today, he doesn’t complain about anything, smiles, and even his face is freshened up.”\r\n\r\n \r\n\r\nThe whole village gathered together. The old man was asked:\r\n\r\nVillager: What happened to you?\r\n\r\n \r\n\r\n“Nothing special. Eighty years I’ve been chasing happiness, and it was useless. And then I decided to live without happiness and just enjoy life. That’s why I’m happy now.” – An Old Man\r\n\r\n \r\n\r\nMoral of the story:\r\nDon’t chase happiness. Enjoy your life.', 'Aakash Tripathy', '2021-05-01 21:21:54', 'An-Old-Man.jpg'),
(5, 'A Best Friend', 'A-Best-Friend', 'A story tells that two friends were walking through the desert. During some point of the journey they had an argument, and one friend slapped the other one in the face.\r\n\r\nThe one who got slapped was hurt, but without saying anything, wrote in the sand;\r\n\r\n \r\n\r\n“Today my best friend slapped me in the face.”\r\n\r\n \r\n\r\nThey kept on walking until they found an oasis, where they decided to take a bath. The one who had been slapped got stuck in the mire and started drowning, but the friend saved him. After he recovered from the near drowning, he wrote on a stone;\r\n\r\n \r\n\r\n“Today my best friend saved my life.”\r\n\r\n \r\n\r\nThe friend who had slapped and saved his best friend asked him;\r\n\r\n \r\n\r\n“After I hurt you, you wrote in the sand and now, you write on a stone, why?”\r\n\r\n \r\n\r\nThe other friend replied;\r\n\r\n \r\n\r\n“When someone hurts us we should write it down in sand where winds of forgiveness can erase it away. But, when someone does something good for us, we must engrave it in stone where no wind can ever erase it.”\r\n\r\n \r\n\r\nMoral of the story: \r\nDon’t value the things you have in your life. But value who you have in your life.\r\n\r\n', 'Ramchandra Vishwakarma', '2021-05-02 21:24:31', 'A-Best-Friend.jpg'),
(7, 'Never judge others by their NOs.', 'never-judge', 'Once a bird was searching for a home to lay her eggs and get shelter in the coming rainy season.  In her Search, she saw two trees and went to ask for shelter. When she asked the first tree. He refused to give her shelter.  With disappointment, she went to the second.  And second, agreed she made her home and lay her eggs and then the rainy season arrives.  The rain was so heavy that the first tree fell and was carried away by the flood.  The bird saw this and in a taunting way said: ” See, this is your karma, you didn’t offer me shelter, now God has given you the punishment.”  The tree smiled and said: ” I knew I’m not going to survive this rainy season that’s why I refused you. I didn’t want to risk your’s and your children’s lives. “  The bird got tears in her eyes. now she knew the reason and felt respect for the tree.  Moral of the Story:  We should not always consider someone’s NO as their arrogance. You don’t know the full picture. Respect other’s decisions whether it is in your favor or not. We get so much involved in the problems that we forget to view the other person’s point. Without even trying to understand the motive, the reason, we make our own judgments. we should never judge others by their No. because we don’t know their story.  You don’t know what good is hidden for you behind it.', 'aakash', '2021-05-04 21:34:23', 'never-judge.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
