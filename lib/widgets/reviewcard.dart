import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myreviewapp/model/reviews.dart';
import 'package:provider/provider.dart';

class Eachreview extends StatelessWidget {
  // const Eachreview({Key? key}) : super(key: key);

  final String stars;
  final int index;
  final String message;
  final String feedback;
  final String thumbs_up;
  final String thumbs_down;
  Eachreview(this.index, this.stars, this.message, this.feedback,
      this.thumbs_down, this.thumbs_up);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RatingBarIndicator(
                rating: double.parse(stars),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
            ]),
            Text(
              feedback,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'User Feedback:',
                  style: TextStyle(color: Colors.grey),
                )),
            ExpandableText(
              message,
              textAlign: TextAlign.justify,
              expandText: 'show more',
              collapseText: 'show less',
              maxLines: 4,
              linkColor: Colors.blue,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      Provider.of<Reviews>(context)
                          .mylist[index]['Thumbs_up']
                          .toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 2,
                      height: 4,
                    ),
                    InkWell(
                      child: Icon(Icons.thumb_up_outlined),
                      onTap: () {
                        Provider.of<Reviews>(context, listen: false)
                            .increment_thumbs(index, 1);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      Provider.of<Reviews>(context)
                          .mylist[index]['Thumbs_down']
                          .toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 2,
                      height: 4,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.thumb_down_alt_outlined,
                      ),
                      onTap: () {
                        Provider.of<Reviews>(context, listen: false)
                            .increment_thumbs(index, 2);
                      },
                    ),
                  ],
                ),
                PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  onSelected: (value) {
                    final snackBar = SnackBar(content: Text('Reported'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  itemBuilder: (context) {
                    return List.generate(1, (index) {
                      return PopupMenuItem(
                        value: 1,
                        child: Text('Report Abuse'),
                      );
                    });
                  },
                ),
              ],
            )
            // Text(
            //   message,
            //   style: TextStyle(fontSize: 15),
            // ),
          ],
        ),
      ),
    );
  }
}
