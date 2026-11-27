-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 27/11/2026 às 22:48
-- Versão do servidor: 10.6.23-MariaDB-0ubuntu0.22.04.1
-- Versão do PHP: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `apd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `nome` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`nome`, `id`) VALUES
('Alimentos', 1),
('Bebidas', 2),
('Higiene Pessoal', 3),
('Limpeza', 4),
('Hortifruti', 5),
('Laticínios', 6),
('Padaria', 7),
('Carnes', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `data_compra` datetime DEFAULT current_timestamp(),
  `valor_compra` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_fornecedor`
--

CREATE TABLE `contato_fornecedor` (
  `id` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fornecedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cargo` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `marca`
--

INSERT INTO `marca` (`id`, `nome`) VALUES
(1, 'Nestlé'),
(2, 'Coca-Cola'),
(3, 'Dove'),
(4, 'Omo'),
(5, 'Del Valle'),
(6, 'Itambé'),
(7, 'Pullman'),
(8, 'Sadia'),
(9, 'Ypê'),
(10, 'Nivea'),
(11, 'Nescau'),
(12, 'Garoto'),
(13, 'láctea'),
(14, 'Pepsi'),
(15, 'Fanta'),
(16, 'Sprite'),
(17, 'Guaraná Antarctica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categorias_id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `categorias_id`, `marca_id`, `preco`) VALUES
(25, 'Cereal Nescau', 1, 11, '12.50'),
(26, 'Chocolate Garoto 90g', 1, 12, '6.99'),
(27, 'Leite Itambé 1L', 6, 6, '5.49'),
(28, 'Pão de forma Pullman', 7, 7, '8.99'),
(29, 'Frango Sadia 1kg', 8, 8, '18.90'),
(30, 'Detergente Ypê 500ml', 4, 9, '2.49'),
(31, 'Shampoo Nivea', 3, 10, '15.90'),
(32, 'Refrigerante Coca-Cola 2L', 2, 2, '10.99'),
(33, 'Suco Del Valle 1L', 2, 5, '7.50'),
(34, 'Refrigerante Pepsi 2L', 2, 14, '9.99'),
(35, 'Refrigerante Fanta 2L', 2, 15, '9.50'),
(36, 'Refrigerante Sprite 2L', 2, 16, '9.50'),
(37, 'Guaraná Antarctica 2L', 2, 17, '9.99'),
(38, 'Sabonete Dove', 3, 3, '4.99'),
(39, 'Chocolate Nestlé', 1, 1, '5.99');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_promocoes`
--

CREATE TABLE `produtos_promocoes` (
  `id` int(11) NOT NULL,
  `promocao_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `desconto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promoções`
--

CREATE TABLE `promoções` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `horario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `data_venda` datetime DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `funcionario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`),
  ADD KEY `funcionario_id` (`funcionario_id`);

--
-- Índices de tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargo` (`cargo`),
  ADD KEY `turno_id` (`turno_id`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_id` (`categorias_id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Índices de tabela `produtos_promocoes`
--
ALTER TABLE `produtos_promocoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocao_id` (`promocao_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `promoções`
--
ALTER TABLE `promoções`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_id` (`funcionario_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `produtos_promocoes`
--
ALTER TABLE `produtos_promocoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `promoções`
--
ALTER TABLE `promoções`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD CONSTRAINT `contato_fornecedor_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`);

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`);

--
-- Restrições para tabelas `produtos_promocoes`
--
ALTER TABLE `produtos_promocoes`
  ADD CONSTRAINT `produtos_promocoes_ibfk_1` FOREIGN KEY (`promocao_id`) REFERENCES `promoções` (`id`),
  ADD CONSTRAINT `produtos_promocoes_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
