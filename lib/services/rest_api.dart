import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'package:flutter_stock/utils/constants.dart';

class CallAPI {

  

  _setHeaders() => {
    "Content-type" : "application/json" , 
    "Accept" : "application/json"
  };

  
  postData(data , apiURL) async{    
    String fullURL = baseURLAPI + apiURL;
    return await http.post(
      fullURL ,
      headers: _setHeaders(), 
      body: jsonEncode(data)
    );
  }
}