const createContactTable = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY
    ,FOREING KEY (address_id) REFERENCES address(id)
    ,name VARCHAR(200) NOT NULL
    ,phone CHAR(16) NOT NULL
    ,email VARCHAR(150) NULL
    ,image_url VARCHAR(300) NULL

  )
''';

const insertANewContactWithoutNullFields = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''';

const createAddressTable = '''
  CREATE TABLE address(
  id INTEGER NOT NULL PRIMART KEY
  ,city CHAR(50) NOT NULL
  ,state VARCHAR(100) NOT NULL
  ,zip_code CHAR(3) NOT NULL
  ,street_address VARCHAR(500) NOT NULL
  ,stree_adress_number CHAR(5) NOT NULL
  ,complement VARCHAR(200) NOT NULl
  )
 ''';
