// Enum

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reviews extends ChangeNotifier {
  // final int starts;
  // final String overallreview;
  // final String message;
  // final int thummbsup;
  // final int thumbsdown;

  // Reviews({required this.starts, required this.message});

  List<Map<String, String>> mylist = [
    {
      'stars': '3',
      'feedback': 'Great Experience',
      'review':
          'This is such a nice product. I have been using this since 2 years and the quality is so good. Just go for it blindly you will definately love it.Its almost imposible that this product exist.I am loving the feel of this product',
      'Thumbs_up': '2',
      'Thumbs_down': '3'
    },
  ];

  additem(Map<String, String> m) {
    mylist.add(m);
    notifyListeners();
  }

  increment_thumbs(index, flag) {
    if (flag == 1) {
      var t = int.parse(mylist[index]['Thumbs_up'].toString()) + 1;
      mylist[index]['Thumbs_up'] = t.toString();
    } else {
      var t = int.parse(mylist[index]['Thumbs_down'].toString()) + 1;
      mylist[index]['Thumbs_down'] = t.toString();
    }
    notifyListeners();
  }
}
