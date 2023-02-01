import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentTypeModel {
  final int id;
  final String name;
  final String acrony;
  final bool enabled;
  PaymentTypeModel({
    required this.id,
    required this.name,
    required this.acrony,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acrony': acrony,
      'enabled': enabled,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      acrony: map['acrony'] ?? "",
      enabled: map['enabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
