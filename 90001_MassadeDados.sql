INSERT INTO `tb_usuarios` (`usuario_id`, `usuario_nome`) VALUES
(1, 'Usuário 1'),
(2, 'Usuário 2'),
(3, 'Usuário 3'),
(4, 'Usuário 4');

INSERT INTO `tb_divisoes` (`divisao_id`, `divisao_nome`, `usuario_id`) VALUES
(1, 'República XPTO', 1);

INSERT INTO `tb_integrantes` (`integrante_id`, `divisao_id`, `usuario_id`, `inicio_divisao`) VALUES
(1, 1, 1, '2016-09-01'),
(2, 1, 2, '2016-09-01'),
(3, 1, 3, '2016-09-01'),
(4, 1, 4, '2016-10-01');

INSERT INTO `tb_contas` (`conta_id`, `divisao_id`, `conta_forma_rateio_id`, `conta_nome`) VALUES
(1, 1, 'I', 'Energia Elétrica'),
(2, 1, 'I', 'Gás'),
(3, 1, 'P', 'Aluguel '),
(4, 1, 'I', 'Internet'),
(5, 1, 'I', 'Compras Mercado');

INSERT INTO `tb_contas_rateio` (`conta_rateio_id`, `conta_id`, `integrante_id`, `conta_rateio_valor_base_padrao`) VALUES
(1, 3, 1, 30.000000),
(2, 3, 2, 20.000000),
(3, 3, 3, 25.000000),
(4, 3, 4, 25.000000),
(5, 1, 1, NULL),
(6, 1, 2, NULL),
(7, 1, 3, NULL),
(8, 1, 4, NULL),
(9, 2, 1, NULL),
(10, 2, 2, NULL),
(11, 2, 3, NULL),
(12, 2, 4, NULL),
(13, 4, 1, NULL),
(14, 4, 2, NULL),
(15, 4, 3, NULL),
(16, 4, 4, NULL),
(17, 5, 1, NULL),
(18, 5, 2, NULL),
(19, 5, 3, NULL),
(20, 5, 4, NULL);



INSERT INTO `tb_transacoes` (`transacao_id`, `transacao_competencia`, `conta_id`, `conta_forma_rateio_id`, `transacao_data_pagamento`, `transacao_tipo`, `transacao_valor`, `transacao_observacao`) VALUES
('{2f2ef3e5-ff74-455a-b3d0-e7fd9ee95f6e}', '2016-09-01', 2, 'I', '2016-09-14', 'D', '9.15', ''),
('{4dec2c9c-8149-4bf3-b48a-d252c855520b}', '2016-09-01', 3, 'P', '2016-09-09', 'D', '2500.45', ''),
('{680d055e-c5e2-487a-ad51-4cc4ae204ed1}', '2016-09-01', 1, 'I', '2016-09-07', 'D', '125.52', ''),
('{7cdb7f9b-1c9e-402f-80f2-ec3b891bcab2}', '2016-09-01', 5, 'I', '2016-09-26', 'D', '26.95', ''),
('{a15b5a66-536e-4176-ad99-da83338c2e18}', '2016-09-01', 4, 'I', '2016-09-26', 'D', '79.90', '');

INSERT INTO `tb_transacoes_detalhe` (`transacao_detalhe_id`, `transacao_id`, `integrante_id`, `transacao_detalhe_valor_pago`, `transacao_detalhe_divisao`) VALUES
(1, '{2f2ef3e5-ff74-455a-b3d0-e7fd9ee95f6e}', 1, 9.15, NULL),
(2, '{2f2ef3e5-ff74-455a-b3d0-e7fd9ee95f6e}', 2, 0.00, NULL),
(3, '{2f2ef3e5-ff74-455a-b3d0-e7fd9ee95f6e}', 3, 0.00, NULL),
(4, '{4dec2c9c-8149-4bf3-b48a-d252c855520b}', 1, 1000.00, 40.000000),
(5, '{4dec2c9c-8149-4bf3-b48a-d252c855520b}', 2, 500.45, 30.000000),
(6, '{4dec2c9c-8149-4bf3-b48a-d252c855520b}', 3, 1000.00, 30.000000),
(7, '{680d055e-c5e2-487a-ad51-4cc4ae204ed1}', 1, 100.00, NULL),
(8, '{680d055e-c5e2-487a-ad51-4cc4ae204ed1}', 2, 0.00, NULL),
(9, '{680d055e-c5e2-487a-ad51-4cc4ae204ed1}', 3, 25.52, NULL),
(10, '{7cdb7f9b-1c9e-402f-80f2-ec3b891bcab2}', 1, 10.00, NULL),
(11, '{7cdb7f9b-1c9e-402f-80f2-ec3b891bcab2}', 2, 16.95, NULL),
(12, '{7cdb7f9b-1c9e-402f-80f2-ec3b891bcab2}', 3, 0.00, NULL),
(13, '{a15b5a66-536e-4176-ad99-da83338c2e18}', 1, 79.90, NULL),
(14, '{a15b5a66-536e-4176-ad99-da83338c2e18}', 2, 0.00, NULL),
(15, '{a15b5a66-536e-4176-ad99-da83338c2e18}', 3, 0.00, NULL);


