import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';
import 'package:petwork/resources/storage_methods.dart';
import 'package:petwork/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
    await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //Sign Up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String phone,
  }) async {
    String res = "Some error occurred";
    try {
      if(email.isNotEmpty || password.isNotEmpty || bio.isNotEmpty || phone.isNotEmpty) {
        //Register User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);

        //Add User to the Database
        model.User user = model.User(
          email : email,
          bio : bio,
          phone : phone,
          uid : cred.user!.uid,
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        res = "success";
      }
    }
    catch(err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }


}