import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myreviewapp/model/reviews.dart';
import 'package:provider/provider.dart';

class CustomeAlertDialogue extends StatefulWidget {
  @override
  _CustomeAlertDialogueState createState() => _CustomeAlertDialogueState();
}

class _CustomeAlertDialogueState extends State<CustomeAlertDialogue> {
  feedbackbutton(String fd) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2,
        right: 2,
      ),
      child: OutlinedButton(
        onPressed: () {
          print(fd);
          feedback = fd;
        },
        child: Text(fd),
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  var stars = 1.0;

  var feedback;

  var review;

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      // title: Text('Rate this product',
      // style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      // shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.all(
      // Radius.circular(20.0),
      // ),
      // ),
      // actionsOverflowDirection: VerticalDirection.down,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // titleSpacing: 2,
        title: Center(
          child: Text(
            'Review & Ratings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Wrap(
                  // scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    feedbackbutton('Good'),
                    feedbackbutton('Awesome'),
                    feedbackbutton('Worth the money'),
                    feedbackbutton('Buy it Blindly'),
                    feedbackbutton('Not So Good'),
                  ],
                ),
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    stars = rating;
                    print(rating);
                  },
                ),
              ),
              // SingleChildScrollView(

              // Spacer(),
              TextField(
                controller: myController,
                // onEditingComplete: () => review = 'asd' + myController.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Give Review (Optional)',
                  hintText: 'Write Review',
                ),
                minLines: 4,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
              // Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: OutlinedButton(
                    onPressed: () {
                      Map<String, String> m = {
                        'stars': stars.toString(),
                        'feedback': feedback == null
                            ? stars < 3
                                ? stars < 2
                                    ? 'Bad'
                                    : 'Average'
                                : 'Good'
                            : feedback,
                        'review': myController.text,
                        'Thumbs_up': '0',
                        'Thumbs_down': '0'
                      };
                      Provider.of<Reviews>(context, listen: false).additem(m);
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
