# GITHUB : https://github.com/dotpinheiro/BD01

USE marketplace;

INSERT INTO tb_usuarios(login, senha, imagem)
VALUES 
('felipe', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('toninho', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('lojabrasil', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('cleber', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('marina', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('joao', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('dionisio', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('roberto', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('samir', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('sandro', 'd41d8cd98f00b204e9800998ecf8427e', '');

INSERT INTO tb_usuarios_vendedores(usuario_id_fk, cnpj, nome_fantasia, razao_social)
VALUES 
(1,37698954000120, 'FeliPão de Queijo', 'Felipão de Queijo'),
(3,59673033000145, 'Lojas Brasil', 'Lojas do Brasil');

INSERT INTO tb_usuarios_compradores(usuario_id_fk,cpf,rg,nome,sexo)
VALUES
(2,08527707071,'332361391', 'Antonio', 'm'),
(4,61657505081, '235770784', 'Cleber', 'm'),
(5,12051534039, '372236662', 'Marina', 'f'),
(6,09478009052, '486468082', 'João', 'm'),
(7,74972450070, '248095997', 'Dionísio', 'm'),
(8,25972510049, '485467719', 'Roberto', 'm'),
(9,66849364081, '382523015', 'Samir', 'm'),
(10,38293046090, '382523015', 'Sandro', 'm');

INSERT INTO tb_estados(nome) 
VALUES
('Acre'),
('Alagoas'),
('Amazonas'),
('Amapá'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espírito Santo'),
('Goiás'),
('Maranhão'),
('Minas Gerais'),
('Mato Grosso do Sul'),
('Mato Grosso'),
('Pará'),
('Paraíba'),
('Pernambuco'),
('Piauí'),
('Paraná'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rondônia'),
('Roraima'),
('Rio Grande do Sul'),
('Santa Catarina'),
('Sergipe'),
('São Paulo'),
('Tocantins');

INSERT INTO tb_cidades(estado_id_fk, nome)
VALUES
(26,'São Paulo'),
(18, 'Maringá'),
(18, 'Campo Mourão'),
(26, 'Arujá'),
(26, 'Suzano'),
(26, 'Itaquaquecetuba'),
(26, 'Poá'),
(26, 'Santa Isabel'),
(26, 'Mogi das Cruzes'),
(26, 'Guararema');

INSERT INTO tb_enderecos(cidade_id_fk, usuario_id_fk, rua, cep, numero)
VALUES
(1,1, 'Rua da Graça', 08500333, '320'),
(2,2, 'Rua Central',  02034230, '1001'),
(3,3, 'Rua Harrison José Borges', 000760-310, '2000'),
(4,4, 'João Paulo II', 03023203, '45'),
(5,5, 'Rua três', 33032203, '90'),
(6,6, 'Rua dos olímpios', 00023302, '4054'),
(7,7, 'Rua dos Silvas', 22234203, '22'),
(8,8, 'Avenida São Paulo', 08588310, '945'),
(9,9, 'Estrada dos oliveiras', 01390230, '102'),
(10,10, 'João Batista de Godoy', 23042320, '920');


INSERT INTO tb_campanhas(usuario_id_fk, titulo, descricao, imagem)
VALUES
(1, 'Quarta do pão de queijo', 'Compre um pão de queijo com um café e ganhe um brinde', 'http://3.bp.blogspot.com/-5gO3fKLl43s/VGYmQ2ErDuI/AAAAAAAAAhc/zZGjO-BSBUo/s1600/10665392_842102412490178_9093923595126248474_n.jpg'),
(1, 'Descontasso no pão na chapa', 'Comprando dois pães o café sai de graça', 'http://3.bp.blogspot.com/-5gO3fKLl43s/VGYmQ2ErDuI/AAAAAAAAAhc/zZGjO-BSBUo/s1600/10665392_842102412490178_9093923595126248474_n.jpg'),
(1, 'Vai um café', 'Era café que você queria? então toma', 'http://3.bp.blogspot.com/-5gO3fKLl43s/VGYmQ2ErDuI/AAAAAAAAAhc/zZGjO-BSBUo/s1600/10665392_842102412490178_9093923595126248474_n.jpg'),
(1, 'Já dizia tim maia... chocolate.', 'Descontão de inverno', 'http://3.bp.blogspot.com/-5gO3fKLl43s/VGYmQ2ErDuI/AAAAAAAAAhc/zZGjO-BSBUo/s1600/10665392_842102412490178_9093923595126248474_n.jpg'),
(3, 'Promoção de Inverno', 'Os melhores agasalhos para você se aquecer', 'https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg'),
(3, '30% OFF na primeira compra', 'Válido apenas para compras abaixo de 100 reais.','https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg'),
(3, 'Dia das mães', 'Grande promoção de dia das mães', 'https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg'),
(3, 'Dia dos namorados', 'Grande promoção de dia dos namorados', 'https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg'),
(3, 'Dia do programador', 'Infelizmente todo dia é dia do programador...', 'https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg'),
(3, 'Dia da bandeira', 'Bandeiras 10% OFF', 'https://www.conceitoprisma.com.br/wp-content/uploads/2019/09/roupa-conceito-prisma.jpg');

INSERT INTO tb_pedidos(comprador_id_fk, vendedor_id_fk)
VALUES
(2,1),
(2,1),
(4,1),
(4,1),
(5,3),
(5,3),
(2,3),
(8,3),
(8,1),
(8,1);


INSERT INTO tb_notas_fiscais(sequencia, numero, chave, pedido_id_fk)
VALUES
(1, 303, 12312312,1),
(1, 404, 12312312,2),
(1, 200, 12312312,3),
(1, 190, 12312312,4),
(1, 183, 12312312,5),
(1, 200, 12312312,6),
(1, 9000,12312312,7),
(1, 934, 12312312,8),
(1, 231, 12312312,9),
(1, 764, 12312312,10);

INSERT INTO tb_produtos_estoque(posicao)
VALUES
('C4'),
('A4'),
('B4'),
('D4'),
('D5'),
('D4'),
('E4'),
('B4'),
('A0'),
('E4');

INSERT INTO tb_produtos (titulo, descricao, valor, vendedor_id_fk, tipo, estoque_id_fk)
VALUES
('Pão de Queijo', 'Pão...', 4.90, 1, 'produto', NULL),
('Pão na Chapa', 'Pão na chapa', 2.99, 1, 'produto', NULL),
('Café', 'Café preto', 1.00, 1, 'variacao', NULL),
('Chapéu', 'Chapéu estiloso', 39.90, 3, 'produto',6),
('Camiseta básica', 'Linda camiseta básica', 29.90, 3, 'variacao', NULL),
('Calça básica', 'Calça', 49.90, 3, 'produto',7),
('Moletom masculino', 'Blusa moletom', 99.90, 3, 'produto',8),
('Moletom Feminino', 'Moletom feminino', 19.90, 3, 'produto', NULL),
('óculos escuros', 'estiloso', 14.90, 3, 'produto',9),
('Camisa floral', '', 33.90, 3, 'produto', 10);


INSERT INTO tb_produtos_cores(nome)
VALUES
('Azul'),
('Vermelho'),
('Rosa'),
('Branco'),
('Amarelo'),
('Verde'),
('Roxo'),
('Preto'),
('Vinho'),
('Dourado');

INSERT INTO tb_produtos_tamanhos(nome)
VALUES
('P'),
('M'),
('G'),
('GG'),
('XGG');


INSERT INTO tb_produtos_variacoes(
imagem, produto_id_fk, cor_id_fk, tamanho_id_fk, estoque_id_fk)
VALUES
('',3, NULL, 1,1),
('',3, NULL, 2,2),
('',3, NULL, 3,3),
('',5, 1, 1,4),
('',5, 1, 1,5);


INSERT INTO tb_pedidos_itens(produto_id_fk, variacao_id_fk, pedido_id_fk)
VALUES
(1, NULL, 1),
(2, NULL, 2),
(1, NULL , 3),
(2, NULL, 4),
(3,1, 5),
(3,2, 6),
(3,3, 7),
(5,4, 8),
(5,5 , 9),
(1, NULL, 10);




