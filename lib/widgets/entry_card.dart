import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/screens/profile_screen.dart';
import 'package:petwork/models/user.dart' as model;
import 'package:petwork/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:petwork/resources/firestore_methods.dart';
import 'package:petwork/utils/utils.dart';

class EntryCard extends StatefulWidget {
  final snap;
  const EntryCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {

  deletePost(String postId) async {
    try {
      await FirestoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;


    return widget.snap['uid'].toString() == user.uid
        ? Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.network(
              widget.snap['postURL'],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0), // Add some spacing around the box
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: secondaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: mobileBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0), // Add some spacing between the texts
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.0), // Add some spacing between the box and the first text
                    Text(
                      'Pet Type: ${widget.snap['petType']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Pet Kind: ${widget.snap['petKind']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Area Found: ${widget.snap['areaFound']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Date Found: ${widget.snap['dateFound']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm delete"),
                                  content: Text("Are you sure you want to delete this entry?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Cancel"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        deletePost(
                                          widget.snap['postId'].toString(),
                                        );
                                        // remove the dialog box
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Delete"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    )
        : Container();
  }
}