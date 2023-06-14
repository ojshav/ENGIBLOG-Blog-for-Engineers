-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 01:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `engineersblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contaactpage`
--

CREATE TABLE `contaactpage` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` int(20) NOT NULL,
  `message` text NOT NULL,
  `date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contaactpage`
--

INSERT INTO `contaactpage` (`sno`, `name`, `email`, `phoneno`, `message`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', 1421412512, 'first post is this', '2023-06-05'),
(2, 'Ojshav', 'ojshavsaxenaa@gmail.com', 2147483647, 'hii', NULL),
(3, 'arun prajapati', 'ishasaxena254@gmail.com', 2147483647, 'sdgwerhyqweg', '2023-06-05'),
(4, 'arun prajapati', 'yashkhandelwal619@gmail.com', 2147483647, 'wegsdasdd', '2023-06-08'),
(5, 'arun prajapati', 'yashkhandelwal619@gmail.com', 2147483647, 'wegsdasdd', '2023-06-08'),
(6, 'arun prajapati', 'ojshavsaxena@gmail.com', 2147483647, 'wqrasfcafsd', '2023-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_heading` varchar(100) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `img_file` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `sub_heading`, `slug`, `content`, `img_file`, `author`, `date`) VALUES
(1, 'Introduction to Mechanical Engineering', 'Exploring the World of Machines', 'first-post', 'Mechanical engineering is a diverse field that encompasses the design, analysis, and manufacturing of mechanical systems. From automobiles to aircraft, from power plants to robotics, mechanical engineers play a crucial role in shaping the world we live in.In this blog, we will delve into the fundamental concepts of mechanical engineering, including statics, dynamics, thermodynamics, materials science, and more. We\'ll explore the fascinating world of machines, uncovering the principles behind their operation and the engineering principles used to optimize their performance.Whether you\'re a student considering a career in mechanical engineering or simply curious about how things work, this blog will provide valuable insights into the exciting field of engineering.', 'pexels-pixabay-162553', 'Ojshav', '2023-06-08'),
(2, 'Electrical Engineering: Powering the Modern World', 'Unraveling the Mysteries of Circuits and Systems', 'second-post', 'Electrical engineering is at the heart of our modern civilization. It encompasses the study of electricity, electronics, electromagnetism, and power systems. From smartphones to renewable energy sources, electrical engineers contribute to every aspect of our daily lives.In this blog, we will explore the fascinating world of electrical engineering, unraveling the mysteries of circuits and systems. We\'ll discuss topics such as circuit analysis, digital electronics, signal processing, control systems, and more. By understanding the underlying principles and applications of electrical engineering, you\'ll gain a deeper appreciation for the technology that surrounds us. Whether you\'re a student, a professional, or simply someone interested in technology, this blog will provide valuable insights into the field of electrical engineering.', 'pexels-pixabay-162553', 'Ojshav', '2023-06-08'),
(3, 'Civil Engineering: Building the Foundations of Society', 'Designing the Infrastructure for a Sustainable Future', 'third-post', 'Civil engineering is a vital discipline that focuses on the design, construction, and maintenance of infrastructure. From bridges and buildings to roads and water systems, civil engineers shape the world we live in and ensure its sustainability.In this blog, we will dive into the world of civil engineering, exploring the principles and practices that govern the construction of our built environment. We\'ll discuss topics such as structural engineering, geotechnical engineering, transportation engineering, environmental engineering, and more. Through this exploration, you\'ll gain a deeper understanding of the complex challenges faced by civil engineers and the innovative solutions they employ. Whether you\'re an aspiring engineer, a construction enthusiast, or simply curious about the built world, this blog will provide valuable insights into the field of civil engineering.', 'pexels-pixabay-162553', 'Ojshav', '2023-06-13'),
(4, 'The Role of Artificial Intelligence in Modern Engineering', 'Exploring the Intersection of AI and Engineering', 'ai-blog', 'Artificial Intelligence (AI) is revolutionizing the field of engineering by offering new tools and techniques to tackle complex problems. In this blog, we will explore the role of AI in modern engineering and its impact on various disciplines.\r\n\r\nAI is transforming the way engineers approach design, analysis, and optimization. Machine learning algorithms enable engineers to extract insights from massive amounts of data, aiding in predictive modeling, pattern recognition, and decision-making. From structural analysis to manufacturing processes, AI is enhancing efficiency, accuracy, and innovation.\r\n\r\nWe will delve into specific applications of AI in engineering, such as autonomous systems, robotics, computer vision, and natural language processing. We\'ll discuss how AI is driving advancements in fields like aerospace, civil engineering, electrical engineering, and more.\r\n\r\nMoreover, we will explore the ethical implications of AI in engineering, including considerations of bias, transpar', NULL, 'Ojshav', '2023-06-14'),
(6, 'The Future of Sustainable Energy: Exploring Renewable Technologies', 'Paving the Way for a Greener Tomorrow\"', 'rew-post', 'In recent years, the urgency to transition to sustainable energy sources has become increasingly apparent. As we face the challenges of climate change and strive for a greener future, renewable technologies have emerged as key players in the energy landscape. In this blog post, we will explore the exciting world of renewable energy and its potential to shape our future.\r\n\r\nRenewable energy sources, such as solar, wind, hydro, and geothermal power, harness the natural resources available to us without depleting them. These sources offer abundant, clean, and sustainable alternatives to traditional fossil fuels. With advancements in technology and falling costs, renewable energy is becoming more accessible and economically viable than ever before.\r\n\r\nWe will delve into each renewable technology, discussing their unique benefits, challenges, and applications. Solar power, for instance, has experienced remarkable growth with the development of photovoltaic cells and concentrated solar power', NULL, 'Ojshav', '2023-06-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contaactpage`
--
ALTER TABLE `contaactpage`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD UNIQUE KEY `message` (`message`) USING HASH;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contaactpage`
--
ALTER TABLE `contaactpage`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
