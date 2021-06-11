import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:myreviewapp/widgets/alertdialogue.dart';
import 'package:myreviewapp/widgets/reviewcard.dart';
import 'package:myreviewapp/model/reviews.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Reviews(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// show the dialog
  givesomerating(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomeAlertDialogue()),
    );
  }
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CustomeAlertDialogue();
  //     });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 2,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Review & Ratings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () async {
                final snackBar = SnackBar(content: Text('Open Play Store'));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Rate App'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: Provider.of<Reviews>(context).mylist.length,
          itemBuilder: (ctx, index) {
            if (Provider.of<Reviews>(context)
                .mylist[index]['review']!
                .isEmpty) {
              return Container();
            } else {
              return Eachreview(
                  index,
                  Provider.of<Reviews>(context)
                      .mylist[index]['stars']
                      .toString(),
                  Provider.of<Reviews>(context)
                      .mylist[index]['review']
                      .toString(),
                  Provider.of<Reviews>(context)
                      .mylist[index]['feedback']
                      .toString(),
                  Provider.of<Reviews>(context)
                      .mylist[index]['thumbs_up']
                      .toString(),
                  Provider.of<Reviews>(context)
                      .mylist[index]['thumbs_down']
                      .toString());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          givesomerating(context),
        },
        child: Icon(Icons.pending_actions),
      ),
    );
  }
}
