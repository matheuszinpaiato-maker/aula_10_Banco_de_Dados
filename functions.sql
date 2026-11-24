-- Criando Funções (Exemplo de uma função que formata valores como moeda)
-- Vamos utilizar o banco de dados Pizzaria da aula anterior
use pizzaria;
-- Verificar quais functions um Banco de Dados possui
show function status;
-- Versão 1
drop function if exists moeda;

create function moeda(v float) returns text
return concat("R$ ",v);
-- testando
select moeda(4.9);
-- Versão 2
drop function if exists moeda;
delimiter //
create function moeda(v float) returns text
Begin
    return concat("R$ ",v);
end//
delimiter ;
-- testando
select moeda(5.99);

create view vw_itens as
select pedido_id, pizza_id, quantidade, moeda(valor) as `valor R$`, moeda(quantidade * valor) as `subtotal R$` from itens_pedido;

-- Para excluir uma função
drop function if exists moeda;
-- Criar a função novamente modificada com declaração de variáveis
delimiter //
create function moeda(v float) returns text
begin
    declare x varchar(20);
    set x = format(v,2,'de_DE');
    return concat("R$ ",x);
end//
delimiter ;
-- testando em uma consulta da tabela de pizzas
select pizza_id, nome, moeda(valor) as 'preço' from pizzas;

-- DESAFIO 01

delimiter //

CREATE PROCEDURE pedidoDeUmItem(cli_id int, piz_id int, quantidade int)
BEGIN
    INSERT INTO pedidos VALUES (cli_id);
    INSERT INTO itens_pedido VALUES (LAST_INSERT_ID(), piz_id, quantidade);
END
//

delimiter ;

SELECT cliente_id FROM clientes WHERE nome="Thamires de Campos Luz";
SELECT pizza_id FROM pizzas WHERE nome="Vienense";
CALL pedidoDeUmItem (96, 41, 1);

SELECT cliente_id FROM clientes WHERE nome="Everton Jose de Souza";
SELECT pizza_id FROM pizzas WHERE nome="Toscana";
CALL pedidoDeUmItem (105, 39, 2);

SELECT cliente_id FROM clientes WHERE nome="Silvia Roberta de Jesus Garcia";
SELECT pizza_id FROM pizzas WHERE nome="Canadense";
SELECT pizza_id FROM pizzas WHERE nome="Cubana";
CALL pedidoDeUmItem (93, 11, 1);
INSERT INTO pedido_id WHERE id = LAST_INSERT_ID VALUES (11, 2);

SELECT cliente_id FROM clientes WHERE nome="#";
SELECT pizza_id FROM pizzas WHERE nome="#";