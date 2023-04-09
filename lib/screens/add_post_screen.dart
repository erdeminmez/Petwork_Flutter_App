import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Post to'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () {}, child: const Text(
            'Post',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pet Type',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pet Kind',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Area Lost',
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: MaterialButton(
              onPressed: _showDatePicker,
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('Choose Date',
                style:  TextStyle(color: Colors.black, fontSize: 16),),
              ),
              color: secondaryColor,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
