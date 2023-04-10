import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/screens/profile_screen.dart';
import 'package:petwork/models/user.dart' as model;
import 'package:petwork/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EntryCard extends StatelessWidget {
  final snap;
  const EntryCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;


    return snap['uid'].toString() == user.uid
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
              snap['postURL'],
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
                      'Pet Type: ${snap['petType']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Pet Kind: ${snap['petKind']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Area Found: ${snap['areaFound']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Date Found: ${snap['dateFound']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Implement edit functionality
                          },
                          icon: Icon(Icons.edit),
                          label: Text('Edit'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Implement delete functionality
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