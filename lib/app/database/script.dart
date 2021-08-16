final createTable = '''
CREATE TABLE contact(
  id INT PRIMARY KEY
  ,nome VARCHAR(200) NOT NULL
  ,telefone VARCHAR(16) NOT NULL
  ,email VARCHAR(150) NOT NULL
  ,url_avatar VARCHAR(200) NOT NULL
)
''';

final insert1 = ''' 
insert into contact(nome,telefone,email,url_avatar) values 
('José','(11) 9 9876-5432','jose@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png')
''';
final insert2 = ''' 
insert into contact(nome,telefone,email,url_avatar) values 
('Maria','(11) 9 9989-3456','maria@email.com','https://cdn.pixabay.com/photo/2021/03/25/08/44/child-6122411_960_720.jpg')
''';
final insert3 = ''' 
insert into contact(nome,telefone,email,url_avatar) values 
('João','(11) 9 9784-5432','joao@email.com','https://cdn.pixabay.com/photo/2021/04/19/08/04/child-6190727_960_720.jpg')
''';

final deletarTudo = '''
delete from contact
''';
