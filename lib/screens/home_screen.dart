import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
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
      body: const PostCard(),
    );
  }
}
