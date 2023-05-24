class Product {
  Product(
      {this.id,
      this.imageUrl,
      this.restaurant,
      this.image,
      this.rate,
      this.reviewed,
      this.type,
      this.timeDelivery,
      this.foodName,
      this.addOn,
      this.description,
      this.price,
      this.addOnPrice,
      this.addOnImage,
      this.logo,
      this.quantity = 1});
  int quantity;

  final String? restaurant;
  final String? foodName;
  final String? image;
  final String? imageUrl;
  final String? timeDelivery;
  final String? logo;
  final String? description;
  final double? price;
  final double? rate;
  final int? id;
  final int? reviewed;
  final List<String>? type;
  final List<String>? addOn;
  final List<double>? addOnPrice;
  final List<String>? addOnImage;
}
