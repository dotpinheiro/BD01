# GITHUB : https://github.com/dotpinheiro/BD01

CREATE DATABASE marketplace;
USE marketplace;

CREATE TABLE tb_usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(255) NOT NULL,
    senha CHAR(32) NOT NULL,
    imagem VARCHAR(1000)
);

CREATE TABLE tb_usuarios_vendedores(
    usuario_id_fk INT,
    cnpj BIGINT UNIQUE NOT NULL,
    nome_fantasia VARCHAR(255),
    razao_social VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id_fk) REFERENCES tb_usuarios(id),
    PRIMARY KEY(usuario_id_fk)
);

CREATE TABLE tb_usuarios_compradores(
    usuario_id_fk INT,
    cpf BIGINT UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(10) NOT NULL,
    sexo ENUM('m','f') NOT NULL,
    FOREIGN KEY (usuario_id_fk) REFERENCES tb_usuarios(id),
    PRIMARY KEY (usuario_id_fk)
);

CREATE TABLE tb_estados(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(120) NOT NULL
);

CREATE TABLE tb_cidades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado_id_fk INT,
    nome varchar(120) NOT NULL,
    FOREIGN KEY (estado_id_fk) REFERENCES tb_estados(id)
);

CREATE TABLE tb_enderecos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    cidade_id_fk INT,
    usuario_id_fk INT,
    rua VARCHAR(500),
    cep INT(8),
    numero INT,
    FOREIGN KEY (usuario_id_fk) REFERENCES tb_usuarios(id),
    FOREIGN KEY (cidade_id_fk) REFERENCES tb_cidades(id)
);

CREATE TABLE tb_campanhas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id_fk INT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    imagem VARCHAR(1000) NOT NULL,
    FOREIGN KEY (usuario_id_fk) REFERENCES tb_usuarios(id)
);

CREATE TABLE tb_pedidos(
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    observacoes TEXT,
    comprador_id_fk INT NOT NULL,
    vendedor_id_fk INT NOT NULL,
    FOREIGN KEY (vendedor_id_fk) REFERENCES tb_usuarios(id),
    FOREIGN KEY (comprador_id_fk) REFERENCES tb_usuarios(id)
);


CREATE TABLE tb_notas_fiscais(
    id INT PRIMARY KEY AUTO_INCREMENT,
    sequencia INT NOT NULL,
    numero INT NOT NULL,
    chave INT NOT NULL,
    pedido_id_fk INT,
    FOREIGN KEY (pedido_id_fk) REFERENCES tb_pedidos(numero)
);

CREATE TABLE tb_produtos_estoque(
    id INT PRIMARY KEY AUTO_INCREMENT,
    posicao VARCHAR(255)    
);

 CREATE TABLE tb_estoque_movimentacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    estoque_id_fk INT,
    qtde INT,
    tipo_movimentacao enum('entrada','saida','balanco'),
    FOREIGN KEY (estoque_id_fk) REFERENCES tb_produtos_estoque(id)
 );

CREATE TABLE tb_produtos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    descricao TEXT,
    valor DECIMAL(20,2),
    tipo ENUM('produto', 'variacao'),
    estoque_id_fk INT,
    vendedor_id_fk INT,
    FOREIGN KEY (estoque_id_fk) REFERENCES tb_produtos_estoque(id),
    FOREIGN KEY (vendedor_id_fk) REFERENCES tb_usuarios(id)
);

CREATE TABLE tb_produtos_cores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE tb_produtos_tamanhos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE tb_produtos_variacoes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    imagem VARCHAR(1000),
    obs TEXT,
    produto_id_fk INT,
    cor_id_fk INT,
    tamanho_id_fk INT,
    estoque_id_fk INT,
    FOREIGN KEY (produto_id_fk) REFERENCES tb_produtos(id),
    FOREIGN KEY (cor_id_fk) REFERENCES tb_produtos_cores(id),
    FOREIGN KEY (tamanho_id_fk) REFERENCES tb_produtos_tamanhos(id),
    FOREIGN KEY (estoque_id_fk) REFERENCES tb_produtos_estoque(id)
);

CREATE TABLE tb_pedidos_itens(
	produto_id_fk INT,
    variacao_id_fk INT,
    pedido_id_fk INT,
    PRIMARY KEY (pedido_id_fk, produto_id_fk),
	FOREIGN KEY (produto_id_fk) REFERENCES tb_produtos(id),
    FOREIGN KEY (pedido_id_fk) REFERENCES tb_pedidos(numero),
    FOREIGN KEY (variacao_id_fk) REFERENCES tb_produtos_variacoes(id)
);






