const createContactTable = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
    ,address_id INTEGER
    ,name VARCHAR(200) NOT NULL
    ,phone CHAR(16) NOT NULL
    ,email VARCHAR(150) 
    ,image_url VARCHAR(300)
   
  )
''';

const createAddressTable = '''
  CREATE TABLE address(
   id INTEGER NOT NULL PRIMARY KEY
  ,city CHAR(50) NOT NULL
  ,state VARCHAR(100) NOT NULL
  ,zip_code CHAR(3) NOT NULL
  ,street_address VARCHAR(500) NOT NULL
  ,street_address_number CHAR(8) NOT NULL
  ,complement VARCHAR(200)
  )
 ''';

const insertContact= '''
INSERT INTO contact (address_id, name, phone, email)
VALUES ('1','Kilder','(85) 9 9999-9999','kilder@email.com')
''';

// const insertContact2= '''
// INSERT INTO contact (address_id, name, phone, email)
// VALUES ('2','Kilder','(85) 9 9999-9999','kilder@email.com')
// ''';



 const insertAddress = '''
INSERT INTO address (city, state, zip_code, street_address,street_address_number,complement)
VALUES ('Fortaleza','Ceará','1000000','Rua Pedro I','1746','sem complemento')
''';

// const insertAddress2 = '''
// INSERT INTO address (city, state, zip_code, street_address,street_address_number,complement)
// VALUES ('Fortaleza','Ceará','1000000','Rua Pedro I','1746','sem complemento')
// ''';
