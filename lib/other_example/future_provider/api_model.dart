class ApiModel {
  final String name;
  final int age;
  final String avatar;
  ApiModel({
    required this.name,
    required this.age,
    required this.avatar,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        name: json['name'],
        age: json['age'],
        avatar: json['avatar']);
  }
}
