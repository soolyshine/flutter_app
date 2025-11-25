class User {
  String name;
  String title;
  String bio;
  String email;
  String phone;
  String avatarUrl;

  User({
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.phone,
    required this.avatarUrl,
  });

  User copyWith({
    String? name,
    String? title,
    String? bio,
    String? email,
    String? phone,
    String? avatarUrl,
  }) {
    return User(
      name: name ?? this.name,
      title: title ?? this.title,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}

