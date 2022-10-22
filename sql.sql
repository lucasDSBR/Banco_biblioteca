CREATE TABLE Estante_Livros 
( 
 Id INT PRIMARY KEY,  
 idLivros INT,  
 idCategoria INT 
); 

CREATE TABLE Livro 
( 
 Id INT PRIMARY KEY,  
 Titulo VARCHAR(100),  
 idArea INT,  
 idAutor INT
); 

CREATE TABLE Reserva 
( 
 Id INT PRIMARY KEY,  
 Data_Retirada DATE NOT NULL,  
 Data_Entrega DATE,  
 idLivro INT,  
 idCliente INT 
); 

CREATE TABLE Autor 
( 
 Id INT PRIMARY KEY,  
 Nome_Autor VARCHAR(100),  
 idLivro INT
); 

CREATE TABLE Cliente 
( 
 Id INT PRIMARY KEY,  
 CPF VARCHAR(100) NOT NULL,  
 Nome INT NOT NULL,  
 Telefone VARCHAR(100),  
 UNIQUE (Nome)
); 

CREATE TABLE Categoria 
( 
 Id INT PRIMARY KEY,  
 Sigla VARCHAR(100),  
 Categoria INT 
); 

CREATE TABLE Area 
( 
 Id INT PRIMARY KEY,  
 Area VARCHAR(100) 
); 

ALTER TABLE Estante_Livros ADD FOREIGN KEY(idLivros) REFERENCES Livro (Id)
ALTER TABLE Estante_Livros ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (Id)
ALTER TABLE Livro ADD FOREIGN KEY(idArea) REFERENCES Area (Id)
ALTER TABLE Livro ADD FOREIGN KEY(idAutor) REFERENCES Autor (Id)
ALTER TABLE Reserva ADD FOREIGN KEY(idLivro) REFERENCES Livro (Id)
ALTER TABLE Reserva ADD FOREIGN KEY(idCliente) REFERENCES Cliente (Id)
ALTER TABLE Autor ADD FOREIGN KEY(idLivro) REFERENCES Livro (Id)
