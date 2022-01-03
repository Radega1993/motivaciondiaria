// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class Total {
  final int total;

  Total({
    required this.total,
  });

  factory Total.fromJson(Map<String, dynamic> json) {
    return Total(total: json["total"]);
  }
}
