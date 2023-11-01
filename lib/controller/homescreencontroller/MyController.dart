import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/mymodel.dart';
import 'package:http/http.dart' as http;

class My_Controller with ChangeNotifier{
  Newsapiresponse? responsedata;

  fetchdata () async {
    final Url = Uri.parse(
        "https://newsapi.org/v2/everything?q=trending&apiKey=4350a3a5f7504a85b1b74f33f460ff64");
    var response = await http.get(Url);
    var decodeddata = jsonDecode(response.body);
    responsedata = Newsapiresponse.fromJson(decodeddata);

    notifyListeners();
  }
}