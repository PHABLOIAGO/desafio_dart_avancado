import 'package:api_uf/models/municipio_model.dart';
import 'package:api_uf/models/uf_model.dart';
import 'package:dio/dio.dart';

class Repository {
  Dio dio = Dio();

  Repository(){
    dio.options.baseUrl = 'https://servicodados.ibge.gov.br/api/v1/localidades';
  }

  Future<List<UfModel>> getUf() async {
    var response = await dio.get('/estados');
    var data = response.data;
    var ufs = (data as List).map((e) => UfModel.fromMap(e)).toList();
    return ufs;
  }

  Future<List<MunicipioModel>> getMunicipios(UfModel uf) async {
    var response = await dio.get('/estados/${uf.id}/distritos');
    var data = response.data;
    var municipios = (data as List).map((e) {
      e['iduf'] = uf.id;
      print(e);
      return MunicipioModel(
          id: e['id'],
          nome: e['nome'].toString().replaceAll("'", "\'"),
          ufid: uf.id);
    }).toList();
    return municipios;
  }
}
