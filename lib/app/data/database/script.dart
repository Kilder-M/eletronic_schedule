const createContactTable = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
    ,address_id INTEGER
    ,notification_id INTEGER
    ,name VARCHAR(200) NOT NULL
    ,phone CHAR(16) NOT NULL
    ,email VARCHAR(150) 
    ,image_url VARCHAR(300)
    ,FOREIGN KEY (address_id) REFERENCES address (id)
    ,FOREIGN KEY (notification_id) REFERENCES notification (id)
   
  )
''';

const createAddressTable = '''
  CREATE TABLE address(
   id INTEGER NOT NULL PRIMARY KEY
  ,city CHAR(50) 
  ,state VARCHAR(100) 
  ,zip_code CHAR(3) 
  ,street_address VARCHAR(500) 
  ,street_address_number CHAR(8) 
  ,complement VARCHAR(200)
  )
 ''';

const createCustomNotificationTable = '''
  CREATE TABLE notification(
   id INTEGER NOT NULL PRIMARY KEY
  ,title CHAR(50) NOT NULL
  ,body VARCHAR(500) NOT NULL
  ,payload CHAR(30) 
  
  )
 ''';

const insertContact = '''
INSERT INTO contact (address_id,notification_id, name, phone, email)
VALUES ('1',1,'Kilder','(85) 9 9999-9999','kilder@email.com')
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

const insertNotification= '''
INSERT INTO notification (title, body, payload)
VALUES ('Title  sqlite','body sqlite','/home')
''';