import 'package:flutter/material.dart';
import 'package:petwork/utils/colors.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key, required this.snap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.network(
              snap['postURL'],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 2,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap['areaFound'],
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          snap['dateFound'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
