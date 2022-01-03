// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class Frase {
  final String autor;
  final String categoria;
  final String frase;
  final int id;

  Frase({
    required this.autor,
    required this.categoria,
    required this.frase,
    required this.id,
  });

  factory Frase.fromJson(Map<String, dynamic> json) {
    return Frase(
        autor: json["autor"],
        categoria: json["categoria"],
        frase: json["frase"],
        id: json["id"]);
  }
}
