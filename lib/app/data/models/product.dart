class ProductModel {
  int id;
  String name;
  num price;
  String unitOfMeasure;
  String? description;
  String image;

  bool get isKg => unitOfMeasure == 'KG';

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.unitOfMeasure,
      required this.description,
      required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['nome'],
        price: num.parse(json['preco']),
        unitOfMeasure: json['unidade'],
        image: json['imagem'],
        description: json['descricao'],
      );
}
