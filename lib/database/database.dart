import 'package:mysql1/mysql1.dart';

class DataBase {
  var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '123456',
        db: 'api_estados');

  MySqlConnection conn;

  DataBase();

  Future<void>connect() async{
    conn = await MySqlConnection.connect(settings);
  }

  
}
