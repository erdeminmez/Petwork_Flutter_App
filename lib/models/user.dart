import 'package:cloud_firestore/cloud_firestore.dart';

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

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot["email"],
      bio: snapshot["bio"],
      phone: snapshot["phone"],
      uid: snapshot["uid"],
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "bio": bio,
    "phone": phone,
    "uid": uid
  };
}