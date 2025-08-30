class JourLocationModel{
  final String placeName;
  final String? image;
  final bool isSelect;
  JourLocationModel({required this.placeName, this.image, this.isSelect = false,});

  JourLocationModel copyWith({
    String? placeName,
    String? image,
    bool? isSelect,
  }) {
    return JourLocationModel(
      placeName: placeName ?? this.placeName,
      image: image ?? this.image,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}