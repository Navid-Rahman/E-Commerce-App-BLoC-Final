class ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  final String description;
  final String id;
  final String imageUrl;
  final String name;
  final double price;
}
