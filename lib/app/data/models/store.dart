import 'category.dart';
import 'payment_method.dart';
import 'shipping_by_city.dart';

class StoreModel {
  int id;
  String name;
  String logo;
  bool isonline;
  List<CategoryModel> categories;
  List<ShippingByCityModel> shippingByCity;
  List<PaymentMethodModel> paymentMethods;

  StoreModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.isonline,
    required this.categories,
    required this.shippingByCity,
    required this.paymentMethods,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        isonline: json['online'] == 1,
        name: json['nome'],
        logo: json['logo'] ?? "",
        categories: json['categorias'] == null
            ? []
            : List<CategoryModel>.from(
                json['categorias']
                    .map((category) => CategoryModel.fromJson(category)),
              ),
        shippingByCity: json['cidades'] == null
            ? []
            : List<ShippingByCityModel>.from(
                json['cidades']
                    .map((city) => ShippingByCityModel.fromJson(city)),
              ),
        paymentMethods: json['meios_pagamentos'] == null
            ? []
            : List<PaymentMethodModel>.from(json['meios_pagamentos'].map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod))),
      );
}
