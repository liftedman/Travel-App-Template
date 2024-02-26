import 'dart:convert';

import 'package:hiking_travel/pages/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  //give a future statement because you are returning
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(
      Uri.parse(baseUrl + apiUrl),
    );
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}

//go back to AppState to create two more class.