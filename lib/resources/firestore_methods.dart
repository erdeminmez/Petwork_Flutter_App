import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petwork/resources/storage_methods.dart';
import 'dart:typed_data';
import 'package:petwork/models/post.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
      String petType,
      String petKind,
      String areaFound,
      String dateFound,
      Uint8List file,
      String uid,
      String uemail,
      String uphone,
      ) async {
    String res = "some error occurred";
    try {
      String photoURL = await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();

      Post post = Post(
        petType: petType,
        petKind: petKind,
        areaFound: areaFound,
        dateFound: dateFound,
        uid: uid,
        uemail: uemail,
        uphone: uphone,
        postId: postId,
        datePublished: DateTime.now(),
        postURL: photoURL,
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    }
    catch(err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

}