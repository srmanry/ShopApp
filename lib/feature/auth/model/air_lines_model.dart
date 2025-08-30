class AirLinesModel{
  final String name;
  final String? logo;
  final bool isSelect;
  AirLinesModel({required this.name, this.logo, this.isSelect = false,});

  AirLinesModel copyWith({
    String? name,
    String? logo,
    bool? isSelect,
  }) {
    return AirLinesModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}