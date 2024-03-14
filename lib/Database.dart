import 'package:sqflite/sqflite.dart' as sql;

class SQLiteDatabase{

  ////// CREATED TABLE //////

  static Future<void> createTable(sql.Database database)async{
    await database.execute(

      ''' CREATE TABLE form (
    
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    gender VARCHAR(255),
    city VARCHAR(255),
    hobbies VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
    
      ) '''
    );
  }

  ////// CREATED DATABASE //////

static Future<sql.Database>db()async{
    return sql.openDatabase('form.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
}

////// CREATED METHOD FOR STORE DATA IN DATABASE //////

static Future<int> createData(String firstName, String lastName, String gender, String city, String hobbies, String email, String password) async{

    ////// SQLiteDatabse class name where created and all data pass in created object //////

  final db = await SQLiteDatabase.db();
  final data = {
    'firstName': firstName,
    'lastName': lastName,
    'city': city,
    'gender': gender,
    'hobbies': hobbies,
    'email': email,
    'password': password,
  };

  final id = await db.insert('form', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  return id;

}

////// GET ALL DATA FROM DATABSE METHOD CREATED //////

static Future<List<Map<String, dynamic>>>getAllData()async{
    final db = await SQLiteDatabase.db();
    return db.query('form', orderBy: 'id');
}

////// GET SINGLE DATA FROM DATABASE //////

static Future<List<Map<String, dynamic>>> getSingleData(int id) async{
    final db = await SQLiteDatabase.db();
    return db.query('form', where: 'id = ?', whereArgs: [id], limit: 1);
}

////// UPDATE DATA IN DATABASE //////

static Future<int>updateData(int id, String firstName, String lastName, String gender, String city, String hobbies, String email, String password) async{
    final db = await SQLiteDatabase.db();
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'city': city,
      'hobbies': hobbies,
      'email': email,
      'password': password,
    };
    final result = await db.update('form', data, where: 'id=?' ,whereArgs: [id]);
    return result;
}

////// DELETE DATA FROM DATABASE CREATED METHOD //////

static Future<void> deleteData(int id) async{
    final db = await SQLiteDatabase.db();
    try{
      await db.delete('form', where: 'id = ?', whereArgs: [id]);
    }
    catch(e){
      print("error $e");
    }
}

}