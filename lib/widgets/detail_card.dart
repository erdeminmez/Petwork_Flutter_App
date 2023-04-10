import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/screens/details_screen.dart';

class DetailCard extends StatelessWidget {
  final snap;
  const DetailCard({Key? key, required this.snap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text(
                      'Contact Email: ${snap['uemail']}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12.0), // Add some spacing between the texts
                    Text(
                      'Contact Number: ${snap['uphone']}',
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