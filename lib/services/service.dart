import 'package:api_uf/database/database.dart';
import 'package:api_uf/models/municipio_model.dart';
import 'package:api_uf/models/uf_model.dart';

class Service {
  DataBase db = DataBase();

  Service() {
    db.connect();
  }

  Future<void> saveUF(UfModel uf) async {
    try {
      var ret = await db.conn.query(
          'Insert uf (iduf, descricaouf, siglauf) values (\'${uf.id}\', \'${uf.nome}\', \'${uf.sigla}\')');
      print(ret);
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveMunicipio(MunicipioModel municipio) async {
    try {
      var ret = await db.conn.query(
          'Insert municipio (idmunicipio, descricaomunicipio, iduf) values (\'${municipio.id}\', \'${municipio.nome}\', \'${municipio.ufid}\')');
      print(ret);
    } catch (e) {
      print("$e - ${e.hashCode}");
    }
  }
}
