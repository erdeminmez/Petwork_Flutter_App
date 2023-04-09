import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Details'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.network(
              'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQEDn7p2ONXjXB3Ivn2Sg5MMkG75lP0a8bBTDFh9V1l7MsV-vpZbzAffXpped2DX1rS39q9CoEzi6wkZyw',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.location_on,
                color: primaryColor,
              ),
              label: Text(
                'View on map',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                // TODO: Add onPressed action
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
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
                      'Post ID: 1111',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Pet Type: Cat',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Pet Kind: British',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Area Found: 123 Young St, Toronto',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Date Found: Apr 4, 2023',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Contact Email: test@gmail.com',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Contact Number: 444-333-2167',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the last text and the bottom of the box
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
