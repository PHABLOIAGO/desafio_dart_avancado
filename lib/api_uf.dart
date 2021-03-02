import 'package:api_uf/models/uf_model.dart';
import 'package:api_uf/repositories/repository.dart';
import 'package:api_uf/services/service.dart';

Future<void> run() async {
  var repository = Repository();
  var service = Service();

  List<UfModel> ufs = await repository.getUf();

  for (var uf in ufs) {
    try {
      await service.saveUF(uf);
      var municipios = await repository.getMunicipios(uf);
      for (var municipio in municipios) {
        await service.saveMunicipio(municipio);
      }
    } catch (e) {
      print(e);
    }
  }
}
