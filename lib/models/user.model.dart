class User {
  final String name;
  final String email;
  final String avatar;
  final String language;
  String? phone;
  String? address;
  final String role;

  User({
    required this.name,
    required this.email,
    required this.avatar,
    required this.language,
    this.phone,
    this.address,
    required this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        language: json["language"],
        role: json["role"],
        phone: json["phone"],
        address: json["address"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "avatar": avatar,
        "language": language,
        "role": role,
        "phone": phone,
        "address": address,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
    };
}
