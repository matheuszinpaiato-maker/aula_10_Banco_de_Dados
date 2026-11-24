DELIMITER /
CREATE TRIGGER atualizar_valor_pedido
AFTER UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    IF OLD.valor <> NEW.valor THEN
        INSERT INTO nv_valor (id_pedido, preco_antigo, preco_novo, data)
        VALUES (NEW.pedido_id, OLD.valor, NEW.valor, NOW());
    END IF;
END/
DELIMITER ;

-- Pedido 1: Claudiane Mendes Trigueiro Silva (2 Aliche + 1 Firense)
INSERT INTO Pedidos (cliente_id, data_pedido, valor)
VALUES ((SELECT cliente_id FROM Clientes WHERE nome = 'Claudiane Mendes Trigueiro Silva'), NOW(), 0.00);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Aliche'), 2);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Firense'), 1);

-- Pedido 2: Diogo Matos da Silva (2 Toscana + 1 Grega)
INSERT INTO Pedidos (cliente_id, data_pedido, valor)
VALUES ((SELECT cliente_id FROM Clientes WHERE nome = 'Diogo Matos da Silva'), NOW(), 0.00);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Toscana'), 2);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Grega'), 1);

-- Pedido 3: Eder Almeida Batista de Oliveira (1 Canadense + 2 Margherita)
INSERT INTO Pedidos (cliente_id, data_pedido, valor)
VALUES ((SELECT cliente_id FROM Clientes WHERE nome = 'Eder Almeida Batista de Oliveira'), NOW(), 0.00);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Canadense'), 1);
INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade)
VALUES (
    (SELECT pedido_id FROM Pedidos ORDER BY pedido_id DESC LIMIT 1),
    (SELECT pizza_id FROM Pizzas WHERE nome = 'Margherita'), 2);