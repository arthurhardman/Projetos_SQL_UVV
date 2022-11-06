# EXPLICAÇÃO SOBRE O PROJETO:
## O objetivo principal era que os alunos tivessem a experiência de criar um banco de dados desde o ínicio e tivessem conhecimento sobre o GIT e GITHUB, para que em futuros projetos conseguissem cumprir o objetivo solicitado pelo professor. Uma etapa não foi solicitada que seria o modelo conceitual pois já partimos do modelo lógico, mas já iniciamos em sala para dar seguimento ao aprendizado completo referente a matéria banco de dados.
  
 * Sobre o "si1n_202203760_hr.architect":
 
  Este é o projeto lógico de todo o banco de dados construído, o objetivo era montar um arquivo com uma estrutura de tabelas e relacionamentos
  que demonstrem um banco de dados de RH (recursos humanos) de uma empresa.
  
  Nos foi proposto encontrar alguns erros referente ao modelo lógico e responder também questões discursivas sobre ele. Alguns erros relacionados 
  ao tipo de cardinalidade dos relacionamentos que na prática deveriam ser diferentes, visto que a maioria das tabelas tem dependencia de dados 
  entre elas, logo tem que ser um relacionamento de 1:N para que a relação entre essas tabelas fique consistente.
  
 * Sobre o "si1n_202203760_postgres_hr.sql":

  Aqui já iniciamos o modelo físico do banco de dados dentro do POSTGRES no qual tinha objetivo de criar desde o início o banco de dados solicitado 
  no modelo lógico, com isso no final deveriamos inserir os dados que já estavam em um banco de dados da Oracle e deveriamos usar o INSERT dentro de
  um SELECT para que fosse gerado um SCRIPT no qual foi inserido no final descrito aqui. 
  
 * Sobre o "si1n_202203760_mariadb_hr.sql":
 
  Neste o objetivo era realizar com o mesmo êxito o SCRIPT mas que fosse executado no SGBD (Sistema de Gerenciamento de Banco de Dados) do MARIADB.
  Como no POSTGRES já estava pronto, foi mais simples para finalizar esse SCRIPT somente alterando as opções necessárias.
  
 * Orientações: 
 
 Foi usado uma máquina virtual disponibilizada pelo professor para execução, para executar o ** Modelo Lógico ** usamos o SQL Power Architect, 
 já para a utilização dos ** SGBD ** usamos para executar o próprio terminal dentro de usuários já criados dentro da máquina virtual.
  
  


  
