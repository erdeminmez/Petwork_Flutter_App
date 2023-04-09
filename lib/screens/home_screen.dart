import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/widgets/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petwork/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset('assets/petwork.png', color: primaryColor, height: 32,),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
                snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
