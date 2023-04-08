class User {
  final String email;
  final String bio;
  final String phone;
  final String uid;

  const User({
    required this.email,
    required this.bio,
    required this.phone,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "bio": bio,
    "phone": phone,
    "uid": uid
  };
}