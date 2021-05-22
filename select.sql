# GITHUB : https://github.com/dotpinheiro/BD01

USE marketplace;

SELECT * FROM tb_usuarios_compradores;
SELECT * FROM tb_pedidos;
SELECT * FROM tb_pedidos_itens;
SELECT * FROM tb_produtos;

# -- Seleciona todos os usuários que compraram pão na chapa. -- #
SELECT nome, cpf FROM tb_usuarios_compradores WHERE usuario_id_fk IN (
SELECT comprador_id_fk FROM tb_pedidos as p, tb_pedidos_itens as pitens WHERE p.numero = pitens.pedido_id_fk
AND pitens.produto_id_fk = 2 );

# -- Seleciona todos os usuários que compraram algum tipo de pão. -- #
SELECT nome, cpf FROM tb_usuarios_compradores WHERE usuario_id_fk IN (
SELECT comprador_id_fk FROM tb_pedidos as p, tb_pedidos_itens as pitens, tb_produtos as prod
WHERE p.numero = pitens.pedido_id_fk AND pitens.produto_id_fk = prod.id
AND prod.titulo LIKE '%pão%'
);

# -- Seleciona todas as campanhas de empresas que já fizeram alguma venda -- # 
SELECT titulo,descricao,imagem FROM tb_campanhas as c WHERE c.usuario_id_fk
IN ( SELECT vendedor_id_fk FROM tb_pedidos );

# -- Seleciona todos os produtos com a cor Azul -- #
SELECT titulo,imagem, c.nome as cor from tb_produtos_variacoes as pv, tb_produtos as p, tb_produtos_cores as c WHERE pv.cor_id_fk 
IN ( SELECT id FROM tb_produtos_cores as pc WHERE pc.nome = 'Azul' ) 
AND pv.produto_id_fk = p.id
AND pv.cor_id_fk = c.id;

# -- Seleciona todos os produtos com o tamanho P -- #
SELECT titulo,imagem, t.nome as tamanho from tb_produtos_variacoes as pv, tb_produtos as p,
tb_produtos_tamanhos as t 
WHERE pv.cor_id_fk IN ( SELECT id FROM tb_produtos_tamanhos as pt WHERE pt.nome = 'P' ) 
AND pv.produto_id_fk = p.id
AND pv.tamanho_id_fk = t.id;

# -- Busca a movimentação de estoque de moletons -- # 
SELECT qtde,tipo_movimentacao FROM tb_estoque_movimentacao as em,tb_produtos_estoque as e
WHERE e.id = em.estoque_id_fk AND e.id IN (
SELECT pv.estoque_id_fk FROM tb_produtos_variacoes as pv, tb_produtos as p WHERE
p.titulo LIKE '%moletom%' AND p.id = pv.produto_id_fk );

# -- Busca todos os usuários que compraram algum produto azul ou vermelho -- # 
SELECT nome from tb_usuarios_compradores WHERE usuario_id_fk IN (
	SELECT comprador_id_fk FROM tb_pedidos as p, tb_pedidos_itens as pitens, tb_produtos_variacoes as pv,
    tb_produtos_cores as pc
    WHERE p.numero = pitens.pedido_id_fk AND pitens.variacao_id_fk = pv.id and pv.cor_id_fk = pc.id
    AND pc.nome = 'Azul'
)
UNION
SELECT nome from tb_usuarios_compradores WHERE usuario_id_fk IN (
	SELECT comprador_id_fk FROM tb_pedidos as p, tb_pedidos_itens as pitens, tb_produtos_variacoes as pv,
    tb_produtos_cores as pc
    WHERE p.numero = pitens.pedido_id_fk AND pitens.variacao_id_fk = pv.id and pv.cor_id_fk = pc.id
    AND pc.nome = 'Vermelho'
);

# -- Busca todos os usuários (compradores ou vendedores) que possuem endereço em São Paulo -- #
SELECT nome FROM tb_usuarios_compradores WHERE usuario_id_fk IN (
	SELECT uc.usuario_id_fk FROM tb_usuarios_compradores as uc, tb_enderecos as e WHERE
    uc.usuario_id_fk = e.usuario_id_fk AND e.cidade_id_fk = 1
)
UNION
SELECT razao_social FROM tb_usuarios_vendedores WHERE usuario_id_fk IN (
	SELECT uv.usuario_id_fk FROM tb_usuarios_vendedores as uv, tb_enderecos as e WHERE
    uv.usuario_id_fk = e.usuario_id_fk AND e.cidade_id_fk = 1
);

# -- Busca vendedores que tiveram mais de cinco pedidos e mostra a quantidade de pedidos -- #
SELECT razao_social, count(DISTINCT p.numero) as qtd FROM tb_usuarios_vendedores AS uv, tb_pedidos as p 
WHERE uv.usuario_id_fk = p.vendedor_id_fk 
GROUP BY uv.usuario_id_fk
HAVING qtd > 5;

# -- Busca compradores que fizeram mais de um pedido e mostra a quantidade de pedidos -- #
SELECT nome, count(DISTINCT p.numero) as qtd FROM tb_usuarios_compradores AS uc, tb_pedidos as p 
WHERE uc.usuario_id_fk = p.comprador_id_fk 
GROUP BY uc.usuario_id_fk
HAVING qtd > 1;
