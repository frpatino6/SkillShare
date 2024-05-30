import '../../domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.contactName,
    required super.email,
    required super.phone,
    required super.address,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      contactName: json['contactName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'contactName': contactName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
