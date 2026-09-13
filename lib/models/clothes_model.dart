class ClothesModel {
  String? image;
  String? name;
  String? size;
  int? price;
  int count = 1;
  bool? isSaved = false;
  ClothesModel({
    required this.image,
    required this.name,
    this.size,
    required this.price,
    this.isSaved
  });
}
