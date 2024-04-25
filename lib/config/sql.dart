import 'package:mysql1/mysql1.dart';

class MySQL {
  static String host = "localhost",
      user = "root",
      password = "zxyxxxxxxxxxxx",
      db = "flutter";
  static int port = 3306;

  MySQL();

  Future<MySqlConnection> getConnection() async {
    try {
      var conn = await MySqlConnection.connect(ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db,
      ));
      return conn;
    } catch (e) {
      print("Failed to connect to the database: $e");
      throw e; // 重新抛出异常或处理错误
    }
  }
}
