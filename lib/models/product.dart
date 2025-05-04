class Product {
  final String id;
  final String name;
  final String description;

  Product({required this.id, required this.name, required this.description});

  static fromJson(json) {}

  Object? toJson() {
    return null;
  }
}
