import 'package:flutter_stock/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_stock/utils/constants.dart';

class CallAPI {
  _setHeaders() =>
      {"Content-type": "application/json", "Accept": "application/json"};

  postData(data, apiURL) async {
    String fullURL = baseURLAPI + apiURL;
    return await http.post(fullURL,
        headers: _setHeaders(), body: jsonEncode(data));
  }

  // getData(apiURL) async {
  //   String fullURL = baseURLAPI + apiURL;
  //   return await http.get(
  //     fullURL ,
  //     headers: _setHeaders(),
  //   );
  // }


  // list product
  Future<List<Product>> getProducts() async {
    String fullURL = baseURLAPI + 'products/';
    var response = await http.get(fullURL, headers: _setHeaders());
    print(response.statusCode);
    if(response.statusCode == 200) {
      return productFromJson(response.body);
    } else{
      return null;
    }    
  }


  Future<bool> createProduct(Product data) async {
    return false;
    print("in CreateProduct");
    print(productToJson(data)); 

    final response = await http.post(
      baseURLAPI + 'products/' ,
      headers: _setHeaders() ,
      body: productToJson(data) 
    );
    
    if(response.statusCode == 200) {
      var body = json.decode(response.body);
      if(body['success'] == true )
        return true; 
    } else{
        return false;
      
    }    
  }

  Future<bool> updateProduct(Product data) async {
    print("in UpdateProduct");
    print(data.id);
    final response = await http.put(
      baseURLAPI + 'products/${data.id}' ,
      headers: _setHeaders() ,
      body: productToJson(data) 
    );
    print(baseURLAPI + 'products/${data.id}');
    print(response.statusCode);

    if(response.statusCode == 200) {
      var body = json.decode(response.body);
      if(body['success'] == true )
        return true; 
    } else{
        return false;
      
    }    
  }

Future<bool> deleteProduct(Product data) async {
    final response = await http.delete(
      baseURLAPI + 'products/${data.id}' ,
      headers: _setHeaders() ,      
    );

    
    print("deleteProduct(), id:");
    print(data.id);
    print(response.toString());
    var body = json.decode(response.body);
    print(body['message']);
    

    print("response");
    print(response.statusCode);
    if(response.statusCode == 200) {
      return true; 
    } else{
      return null;
    }    
  }

}
