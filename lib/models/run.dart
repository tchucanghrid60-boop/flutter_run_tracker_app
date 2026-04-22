// ignore_for_file: non_constant_identifier_names

class Run {
  String? id;
  String runWhere;
  String runPerson;
  double runDistance;

  Run({
    this.id,
    required this.runWhere,
    required this.runPerson,
    required this.runDistance,
  });

  // รับข้อมูลจาก Supabase
  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      id: json['id']?.toString(),
      runWhere: json['runWhere'] ?? '',
      runPerson: json['runPerson'] ?? '',
      runDistance: json['runDistance'] != null
          ? (json['runDistance'] as num).toDouble()
          : 0.0,
    );
  }

  get runDuration => null;

  // ส่งข้อมูลไป Supabase
  Map<String, dynamic> toJson() {
    return {
      "runWhere": runWhere,
      "runPerson": runPerson,
      "runDistance": runDistance,
    };
  }
}
