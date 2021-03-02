// To parse this JSON data, do
//
//     final municipioModel = municipioModelFromMap(jsonString);

import 'dart:convert';

class MunicipioModel {
    MunicipioModel({
        this.id,
        this.nome,
        this.ufid,
    });

    int id;
    String nome;
    int ufid;

    MunicipioModel copyWith({
        int id,
        String nome,
        int ufid,
    }) => 
        MunicipioModel(
            id: id ?? this.id,
            nome: nome ?? this.nome,
            ufid: ufid ?? this.ufid,
        );

    factory MunicipioModel.fromJson(String str) => MunicipioModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MunicipioModel.fromMap(Map<String, dynamic> json) => MunicipioModel(
        id: json["id"],
        nome: json["nome"],
        ufid: json["ufid"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "ufid": ufid,
    };
}
