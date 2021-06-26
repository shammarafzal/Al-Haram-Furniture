import 'dart:convert';
import 'dart:io';
import 'package:al_haram_furnitures/Models/getCategories.dart';
import 'package:al_haram_furnitures/Models/getDeals.dart';
import 'package:al_haram_furnitures/Models/getProducts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  final String baseUrl = 'alharam.codingoverflow.com';
  register(String name, String email, String password,String confirm_password) async {
    var url = Uri.http(baseUrl,
        '/api/register', {"q": "dart"});
    final response = await http.post(url, body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  login(String email, String password) async {
    var url = Uri.http(baseUrl,
        '/api/login', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  forgot(String email) async {
    var url = Uri.http(baseUrl,
        '/api/forgot', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  contactUs(String name, String email, String message) async {
    var url = Uri.http(baseUrl,
        '/api/contactus', {"q": "dart"});
    final response = await http.post(url, body: {
      "name": name,
      "email": email,
      "message": message
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<GetProducts> fetchProducts() async {
    var url = Uri.http(baseUrl, '/api/products', {"q": "dart"});
    final response = await http.get(url);
    return GetProducts.fromJson(jsonDecode(response.body));
  }
  Future<GetCategories> fetchCategories() async {
    var url = Uri.http(baseUrl, '/api/categories', {"q": "dart"});
    final response = await http.get(url);
    return GetCategories.fromJson(jsonDecode(response.body));
  }
  Future<GetDeals> fetchDeals() async {
    var url = Uri.http(baseUrl, '/api/deals', {"q": "dart"});
    final response = await http.get(url);
    return GetDeals.fromJson(jsonDecode(response.body));
  }
  Future<GetProducts> fetchisFavourite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/getFavourite', {"q": "dart"});
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer $token',
    });
    return GetProducts.fromJson(jsonDecode(response.body));
  }
  getMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl,
        '/api/user', {"q": "dart"});
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return (jsonDecode(responseString));
    }
  }
  updateProfile(String first_name, String last_name, String email, String password, String confirm_password, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl,
        '/api/update/$id', {"q": "dart"});
    final response = await http.post(url, body: {
      "first_name": first_name,
      "last_name": last_name,
      "email" : email,
      "password": password,
      "password_confirmation": confirm_password,
      "phone": phone,
    },headers: {
    'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  address(String street1, String street2, String city,String state, String postalcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    var url = Uri.http(baseUrl,
        '/api/address', {"q": "dart"});
    final response = await http.post(url, body: {
      "address": street1,
      "area": street2,
      "city": city,
      "province": state,
      "postal_code": postalcode,
    },headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  addToFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl,
        '/api/addToFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    },headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
  removeFromFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl,
        '/api/removeFromFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    },headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
}