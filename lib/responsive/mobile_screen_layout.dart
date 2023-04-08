import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petwork/models/user.dart' as model;
import 'package:petwork/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String bio = "";

  @override
  void initState() {
    super.initState();
    getBio();
  }
  
  void getBio() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

    setState(() {
      bio = (snap.data() as Map<String, dynamic>)['bio'];
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(user.bio),
      ),
    );
  }
}
