import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'lists.dart';

class Api {
  ApiData(String category) {
    http.get(
        Uri.https("asos2.p.rapidapi.com", "/products/v2/list", {
          "store": 'US',
          "offset": '0',
          "categoryId": '${category}',
          "limit": '48',
          "country": 'US',
          "sort": 'freshness',
          "currency": 'USD',
          "sizeSchema": 'US',
          "lang": 'en-US'
        }),
        headers: {
          'X-RapidAPI-Key':
              '91d5486736msh4da31749cd7f79ap1ec77ejsne9a732c8faea',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
        }).then((value) {
      if (value.statusCode <= 299 && value.statusCode >= 200) {
        Map<String, dynamic> body = jsonDecode(value.body);
        print(body);
        List<Lists> lists = Lists.fromMap(body) as List<Lists>;
        return lists;
      } else {
        throw ('failed' + value.body);
      }
    });
  }

  // => print(value.body.toString()));
}

ApiDetails() {
  http.get(
      Uri.https("asos2.p.rapidapi.com", "/products/v3/detail", {
        "id": '9851612',
        "lang": 'en-US',
        "store": 'US',
        "sizeSchema": 'US',
        "currency": 'USD'
      }),
      headers: {
        'X-RapidAPI-Key': '91d5486736msh4da31749cd7f79ap1ec77ejsne9a732c8faea',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
      }).then((value) {
    if (value.statusCode <= 299 && value.statusCode >= 200) {
      Map<String, dynamic> body = jsonDecode(value.body);
      print(body);
      List<Lists> lists = Lists.fromMap(body) as List<Lists>;
      return lists;
    } else {
      throw ('failed' + value.body);
    }
  });
}
