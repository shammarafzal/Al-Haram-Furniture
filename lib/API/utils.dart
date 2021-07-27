import 'dart:convert';
import 'dart:io';
import 'package:al_haram_furnitures/Models/GetCartProducts.dart';
import 'package:al_haram_furnitures/Models/getCategories.dart';
import 'package:al_haram_furnitures/Models/getDeals.dart';
import 'package:al_haram_furnitures/Models/getMessages.dart';
import 'package:al_haram_furnitures/Models/getProducts.dart';
import 'package:al_haram_furnitures/Models/getProductsByCategories.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  final String baseUrl = 'alharam.codingoverflow.com';
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  register(String first_name, String last_name, String email, String password,
      String confirm_password) async {
    var url = Uri.http(baseUrl, '/api/register', {"q": "dart"});
    final response = await http.post(url, body: {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  login(String email, String password) async {
    var url = Uri.http(baseUrl, '/api/login', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  forgot(String email) async {
    var url = Uri.http(baseUrl, '/api/forgot', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  checkForgotToken(String token) async {
    var url = Uri.http(baseUrl, '/api/checkToken', {"q": "dart"});
    final response = await http.post(url, body: {
      "token": token,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  resetPassword(String token, String password, String password_confirm) async {
    var url = Uri.http(baseUrl, '/api/reset', {"q": "dart"});
    final response = await http.post(url, body: {
      "token": token,
      "password": password,
      "password_confirm": password_confirm
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  contactUs(String name, String email, String message) async {
    var url = Uri.http(baseUrl, '/api/contactus', {"q": "dart"});
    final response = await http
        .post(url, body: {"name": name, "email": email, "message": message});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
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
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    return GetProducts.fromJson(jsonDecode(response.body));
  }

  Future<GetMessages> fetchMessages() async {
    var url = Uri.http(baseUrl, '/api/notifications', {"q": "dart"});
    final response = await http.get(url);
    return GetMessages.fromJson(jsonDecode(response.body));
  }

  getMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/user', {"q": "dart"});
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return (jsonDecode(responseString));
    }
  }

  updateProfile(String first_name, String last_name, String email,
      String password, String confirm_password, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/update/$id', {"q": "dart"});
    final response = await http.post(url, body: {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
      "phone": phone,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  address(String street1, String street2, String city, String state,
      String postalcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    var url = Uri.http(baseUrl, '/api/address', {"q": "dart"});
    final response = await http.post(url, body: {
      "address": street1,
      "area": street2,
      "city": city,
      "province": state,
      "postal_code": postalcode,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  addToFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl, '/api/addToFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  removeFromFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl, '/api/removeFromFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  productsByCategories(String category_name) async {
    var url = Uri.http(baseUrl, '/api/productsByCategory', {"q": "dart"});
    final response = await http.post(url, body: {
      "category_name": category_name,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<GetproductsByCategories> fetchProductsByCategory(
      String category_name) async {
    var url = Uri.http(baseUrl, '/api/productsByCategory', {"q": "dart"});
    final response = await http.post(url, body: {
      "category_name": category_name,
    });
    return GetproductsByCategories.fromJson(jsonDecode(response.body));
  }

  Future<GetProducts> fetchProductsBySearch(String searchItem) async {
    var url = Uri.http(baseUrl, '/api/filterProducts', {"q": "dart"});
    final response = await http.post(url, body: {
      "search": searchItem,
    });
    return GetProducts.fromJson(jsonDecode(response.body));
  }

  search(String searchItem) async {
    var url = Uri.http(baseUrl, '/api/filterProducts', {"q": "dart"});
    final response = await http.post(url, body: {
      "search": searchItem,
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  addToCart(String product_id, String qty, String size, String color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/addToCart', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": product_id,
      "qty": qty,
      "size": size,
      "color": color
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<GetCartProducts> fetchCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/viewCart', {"q": "dart"});
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    // print(response.body);
    return GetCartProducts.fromJson(jsonDecode(response.body));
  }

  Future<GetCartProducts> removeFromCart(String product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/removeFromCart', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": product_id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    return GetCartProducts.fromJson(jsonDecode(response.body));
  }

  rmFromCart(String product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/removeFromCart', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": product_id,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  checkout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/checkout', {"q": "dart"});
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  updateProfilewithImage(
      String first_name,
      String last_name,
      String email,
      File image,
      String password,
      String confirm_password,
      String phone) async {
    // FormData form = new FormData();
    // form.append("image", image);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var id = prefs.getInt('id');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        "POST",
        Uri.parse(
          "http://alharam.codingoverflow.com/api/update/$id",
        ));
    request.headers.addAll(headers);
    request.fields["first_name"] = first_name;
    request.fields["last_name"] = last_name;
    request.fields["email"] = email;
    request.fields["password"] = password;
    request.fields["password_confirmation"] = confirm_password;
    request.fields["phone"] = phone;
    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var decode = String.fromCharCodes(responseData);
    print(jsonDecode(decode));
    return jsonDecode(decode);
  }
}
