class DineModel{
  final String name;
  final String? image;
  final bool isSelect;
  DineModel({required this.name, this.image, this.isSelect = false,});

  DineModel copyWith({
    String? name,
    String? image,
    bool? isSelect,
  }) {
    return DineModel(
      name: name ?? this.name,
      image: image ?? this.image,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}