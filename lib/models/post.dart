import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String petType;
  final String petKind;
  final String areaFound;
  final String dateFound;
  final String uid;
  final String uemail;
  final String uphone;
  final String postId;
  final datePublished;
  final String postURL;

  const Post({
    required this.petType,
    required this.petKind,
    required this.areaFound,
    required this.dateFound,
    required this.uid,
    required this.uemail,
    required this.uphone,
    required this.postId,
    required this.datePublished,
    required this.postURL,

  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      petType: snapshot["petType"],
      petKind: snapshot["petKind"],
      areaFound: snapshot["areaFound"],
      dateFound: snapshot["dateFound"],
      uid: snapshot["uid"],
      uemail: snapshot["uemail"],
      uphone: snapshot["uphone"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
      postURL: snapshot["postURL"],
    );
  }

  Map<String, dynamic> toJson() => {
    "petType": petType,
    "petKind": petKind,
    "areaFound": areaFound,
    "dateFound": dateFound,
    "uid": uid,
    "uemail": uemail,
    "uphone": uphone,
    "postId": postId,
    "datePublished": datePublished,
    "postURL": postURL,
  };
}