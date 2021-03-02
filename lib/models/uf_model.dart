import 'dart:convert';

class UfModel {
    UfModel({
        this.id,
        this.sigla,
        this.nome,
    });

    int id;
    String sigla;
    String nome;

    UfModel copyWith({
        int id,
        String sigla,
        String nome,
    }) => 
        UfModel(
            id: id ?? this.id,
            sigla: sigla ?? this.sigla,
            nome: nome ?? this.nome,
        );

    factory UfModel.fromJson(String str) => UfModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UfModel.fromMap(Map<String, dynamic> json) => UfModel(
        id: json['id'],
        sigla: json['sigla'],
        nome: json['nome'],
    );

    Map<String, dynamic> toMap() => {
        'id': id,
        'sigla': sigla,
        'nome': nome,
    };
}
