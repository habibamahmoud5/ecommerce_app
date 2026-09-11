enum OrderStatus {
  inTransit,
  picked,
  packing,
  delivered,
  completed,
}

extension OrderStatusLabel on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.inTransit:
        return 'In Transit';

      case OrderStatus.picked:
        return 'Picked';

      case OrderStatus.packing:
        return 'Packing';

      case OrderStatus.delivered:
        return 'Delivered';

      case OrderStatus.completed:
        return 'Completed';
    }
  }
}

class Order {
  final String image;
  final String title;
  final String size;
  final String price;
  final OrderStatus status;
  final bool isNetworkImage;

  const Order({
    required this.image,
    required this.title,
    required this.size,
    required this.price,
    required this.status,
    this.isNetworkImage = false,
  });
}