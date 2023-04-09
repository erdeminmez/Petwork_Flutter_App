import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'dart:typed_data';
import 'package:petwork/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petwork/models/user.dart';
import 'package:provider/provider.dart';
import 'package:petwork/providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _kindController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: const Text('Create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a photo'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera,);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from gallery'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery,);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null ?

    Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: () => _selectImage(context),
      ),
    )

    :

    Scaffold(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(_file!),
              ),
            ],
          ),
          SizedBox(height: 24),
          TextField(
            controller: _typeController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pet Type',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _kindController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pet Kind',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _areaController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Area Found',
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
          Flexible(child: Container(), flex: 2,),
        ],
      ),
    );
  }
}
