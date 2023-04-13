import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/widgets/entry_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petwork/resources/auth_methods.dart';
import 'package:petwork/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset('assets/petwork.png', color: primaryColor, height: 32,),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async{
              await AuthMethods().signOut();
              Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => EntryCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
