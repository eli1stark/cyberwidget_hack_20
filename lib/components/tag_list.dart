import 'package:cyberwidget_hack_20/screens/home/components/tagslist.dart';
import 'package:flutter/material.dart';

class Tags{
  List taglist=['Arts & Design','Augmented Reality','Auto & Vehicles','Beauty','Books','Business','Comics'
    ,'Communication','Dating','Daydream','Education','Entertainment','Events','Finance','Food & Drinks'
    ,'Health & Fitness','House','Libraries','Lifestyle','Maps & Navigation','Medical','Music & Audio'
    ,'News & Magaziness','parenting','Personalisation','Photography','Productivity','Shopping','Social'
    ,'Sports','Tools','Travel & Local','UI Design','UI/UX Design','Video Players','Wear Os','Weather',];
  get_the_listoftags(){
    return taglist;
  }
}

class TagSearchService {
  
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 400), null);
    List<dynamic> tagList = <dynamic>[];
    tagList.add({'name': "Arts & Design", 'value': 1});
    tagList.add({'name': "Augmented Reality", 'value': 2});
    tagList.add({'name': "Auto & Vehiclest", 'value': 3});
    tagList.add({'name': "Beauty", 'value': 4});
    tagList.add({'name': "Books", 'value': 5});
    tagList.add({'name': "Business", 'value': 6});
    tagList.add({'name': "Comics", 'value': 7});
    tagList.add({'name': "Communication", 'value': 8});
    tagList.add({'name': "Dating", 'value': 9});
    tagList.add({'name': "Daydream", 'value': 10});
    tagList.add({'name': "Education", 'value': 11});
    tagList.add({'name': "Entertainment", 'value': 12});
    List<dynamic> filteredTagList = <dynamic>[];
    if (query.isNotEmpty) {
      filteredTagList.add({'name': query, 'value': 0});
    }
    for (var tag in tagList) {
      if (tag['name'].toLowerCase().contains(query)) {
        filteredTagList.add(tag);
      }
    }
    return filteredTagList;
    
  }
  
}