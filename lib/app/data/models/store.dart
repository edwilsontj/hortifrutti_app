import 'category.dart';

class StoreModel {
  int id;
  String name;
  String logo;
  bool isonline;
  List<CategoryModel> categories;

  StoreModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.isonline,
    required this.categories,
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
      );
}
