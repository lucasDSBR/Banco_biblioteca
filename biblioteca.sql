-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Out-2022 às 18:51
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10
-- AUTOR: LUCAS DA SILVA MACIEL


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `area`
--

CREATE TABLE `area` (
  `Id` int(11) NOT NULL,
  `Area` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `Id` int(11) NOT NULL,
  `Nome_Autor` varchar(100) DEFAULT NULL,
  `idLivro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `Id` int(11) NOT NULL,
  `Sigla` varchar(100) DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `CPF` varchar(100) NOT NULL,
  `Nome` int(11) NOT NULL,
  `Telefone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `estante_livros`
--

CREATE TABLE `estante_livros` (
  `Id` int(11) NOT NULL,
  `idLivros` int(11) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `Id` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `idArea` int(11) DEFAULT NULL,
  `idAutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `Id` int(11) NOT NULL,
  `Data_Retirada` date NOT NULL,
  `Data_Entrega` date DEFAULT NULL,
  `idLivro` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Índices para tabelas despejadas
--
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Índices para tabela `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`Id`);
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idLivro` (`idLivro`);
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `estante_livros`
--
ALTER TABLE `estante_livros`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idLivros` (`idLivros`),
  ADD KEY `idCategoria` (`idCategoria`);
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idArea` (`idArea`),
  ADD KEY `idAutor` (`idAutor`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idLivro` (`idLivro`),
  ADD KEY `idCliente` (`idCliente`);
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autor`
--
ALTER TABLE `autor`
  ADD CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`Id`);

--
-- Limitadores para a tabela `estante_livros`
--
ALTER TABLE `estante_livros`
  ADD CONSTRAINT `estante_livros_ibfk_1` FOREIGN KEY (`idLivros`) REFERENCES `livro` (`Id`),
  ADD CONSTRAINT `estante_livros_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`Id`);
-- AUTOR: LUCAS DA SILVA MACIEL
--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`Id`),
  ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`Id`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`Id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`Id`);
COMMIT;
-- AUTOR: LUCAS DA SILVA MACIEL
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
