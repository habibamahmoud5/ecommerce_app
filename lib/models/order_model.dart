enum OrderStatus { ongoing, completed }

class OrderModel {
  final String name;
  final String size;
  final String price;
  final String image;
  final String status;

  final bool hasReview;
  final String? rating;

  const OrderModel({
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    required this.status,
    this.hasReview = false,
    this.rating,
  });
}
