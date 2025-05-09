class CountryModel {
  final String name;
  final String code;
  final String flag;

  CountryModel({
    required this.name,
    required this.code,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'flag': flag,
    };
  }
}
