
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 19/10/2016 às 00:47:58
-- Versão do Servidor: 10.0.21-MariaDB-wsrep
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `u183073675_des01`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ci_sessions`
--

DROP TABLE IF EXISTS `tb_ci_sessions`;
CREATE TABLE IF NOT EXISTS `tb_ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contas`
--

DROP TABLE IF EXISTS `tb_contas`;
CREATE TABLE IF NOT EXISTS `tb_contas` (
  `conta_id` int(11) NOT NULL AUTO_INCREMENT,
  `divisao_id` int(11) NOT NULL,
  `conta_forma_rateio_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Valor padrão',
  `conta_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`conta_id`),
  KEY `divisao_id` (`divisao_id`),
  KEY `conta_forma_rateio_id` (`conta_forma_rateio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contas_forma_rateio`
--

DROP TABLE IF EXISTS `tb_contas_forma_rateio`;
CREATE TABLE IF NOT EXISTS `tb_contas_forma_rateio` (
  `conta_forma_rateio_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `conta_forma_rateio_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `conta_forma_rateio_ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`conta_forma_rateio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_contas_forma_rateio`
--

INSERT INTO `tb_contas_forma_rateio` (`conta_forma_rateio_id`, `conta_forma_rateio_desc`, `conta_forma_rateio_ordem`) VALUES
('I', 'Igualmente', NULL),
('P', 'Percentual', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contas_rateio`
--

DROP TABLE IF EXISTS `tb_contas_rateio`;
CREATE TABLE IF NOT EXISTS `tb_contas_rateio` (
  `conta_rateio_id` int(11) NOT NULL AUTO_INCREMENT,
  `conta_id` int(11) NOT NULL,
  `integrante_id` int(11) NOT NULL,
  `conta_rateio_valor_base_padrao` double(16,6) DEFAULT NULL,
  PRIMARY KEY (`conta_rateio_id`),
  KEY `conta_id` (`conta_id`),
  KEY `integrante_id` (`integrante_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_contas_rateio`
--


--
-- Estrutura da tabela `tb_divisoes`
--

DROP TABLE IF EXISTS `tb_divisoes`;
CREATE TABLE IF NOT EXISTS `tb_divisoes` (
  `divisao_id` int(11) NOT NULL AUTO_INCREMENT,
  `divisao_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`divisao_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_integrantes`
--

DROP TABLE IF EXISTS `tb_integrantes`;
CREATE TABLE IF NOT EXISTS `tb_integrantes` (
  `integrante_id` int(11) NOT NULL AUTO_INCREMENT,
  `divisao_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `inicio_divisao` date NOT NULL,
  PRIMARY KEY (`integrante_id`),
  KEY `divisao_id` (`divisao_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_transacoes`
--

DROP TABLE IF EXISTS `tb_transacoes`;
CREATE TABLE IF NOT EXISTS `tb_transacoes` (
  `transacao_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `transacao_competencia` date NOT NULL,
  `conta_id` int(11) DEFAULT NULL,
  `conta_forma_rateio_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `transacao_data_pagamento` date NOT NULL,
  `transacao_tipo` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '[D]ebito / [C]redito',
  `transacao_valor` decimal(12,2) NOT NULL,
  `transacao_observacao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transacao_id`),
  KEY `conta_id` (`conta_id`),
  KEY `conta_id_2` (`conta_id`),
  KEY `conta_forma_rateio_id` (`conta_forma_rateio_id`),
  KEY `transacao_tipo` (`transacao_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_transacoes_detalhe`
--

DROP TABLE IF EXISTS `tb_transacoes_detalhe`;
CREATE TABLE IF NOT EXISTS `tb_transacoes_detalhe` (
  `transacao_detalhe_id` int(11) NOT NULL AUTO_INCREMENT,
  `transacao_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `integrante_id` int(11) NOT NULL,
  `transacao_detalhe_valor_pago` double(12,2) NOT NULL DEFAULT '0.00',
  `transacao_detalhe_divisao` double(16,6) DEFAULT NULL,
  PRIMARY KEY (`transacao_detalhe_id`),
  KEY `transacao_id` (`transacao_id`),
  KEY `integrante_id` (`integrante_id`),
  KEY `transacao_id_2` (`transacao_id`),
  KEY `integrante_id_2` (`integrante_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Estrutura da tabela `tb_transacoes_tipo`
--

DROP TABLE IF EXISTS `tb_transacoes_tipo`;
CREATE TABLE IF NOT EXISTS `tb_transacoes_tipo` (
  `transacao_tipo_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `transacao_tipo_nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transacao_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_transacoes_tipo`
--

INSERT INTO `tb_transacoes_tipo` (`transacao_tipo_id`, `transacao_tipo_nome`) VALUES
('C', 'Crédito'),
('D', 'Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `tb_contas`
--
ALTER TABLE `tb_contas`
  ADD CONSTRAINT `tb_contas_ibfk_1` FOREIGN KEY (`divisao_id`) REFERENCES `tb_divisoes` (`divisao_id`),
  ADD CONSTRAINT `tb_contas_ibfk_2` FOREIGN KEY (`conta_forma_rateio_id`) REFERENCES `tb_contas_forma_rateio` (`conta_forma_rateio_id`);

--
-- Restrições para a tabela `tb_contas_rateio`
--
ALTER TABLE `tb_contas_rateio`
  ADD CONSTRAINT `tb_contas_rateio_ibfk_1` FOREIGN KEY (`conta_id`) REFERENCES `tb_contas` (`conta_id`),
  ADD CONSTRAINT `tb_contas_rateio_ibfk_2` FOREIGN KEY (`integrante_id`) REFERENCES `tb_integrantes` (`integrante_id`);

--
-- Restrições para a tabela `tb_divisoes`
--
ALTER TABLE `tb_divisoes`
  ADD CONSTRAINT `tb_divisoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuarios` (`usuario_id`);

--
-- Restrições para a tabela `tb_integrantes`
--
ALTER TABLE `tb_integrantes`
  ADD CONSTRAINT `tb_integrantes_ibfk_1` FOREIGN KEY (`divisao_id`) REFERENCES `tb_divisoes` (`divisao_id`),
  ADD CONSTRAINT `tb_integrantes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuarios` (`usuario_id`);

--
-- Restrições para a tabela `tb_transacoes`
--
ALTER TABLE `tb_transacoes`
  ADD CONSTRAINT `tb_transacoes_ibfk_1` FOREIGN KEY (`conta_id`) REFERENCES `tb_contas` (`conta_id`),
  ADD CONSTRAINT `tb_transacoes_ibfk_2` FOREIGN KEY (`conta_forma_rateio_id`) REFERENCES `tb_contas_forma_rateio` (`conta_forma_rateio_id`),
  ADD CONSTRAINT `tb_transacoes_ibfk_3` FOREIGN KEY (`transacao_tipo`) REFERENCES `tb_transacoes_tipo` (`transacao_tipo_id`);

--
-- Restrições para a tabela `tb_transacoes_detalhe`
--
ALTER TABLE `tb_transacoes_detalhe`
  ADD CONSTRAINT `tb_transacoes_detalhe_ibfk_1` FOREIGN KEY (`transacao_id`) REFERENCES `tb_transacoes` (`transacao_id`),
  ADD CONSTRAINT `tb_transacoes_detalhe_ibfk_2` FOREIGN KEY (`integrante_id`) REFERENCES `tb_integrantes` (`integrante_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
