import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Post> ejeraRequest({
  userName,
  email,
  phoneNumber,
  countryCode,
}) async {
  String _userName = userName;
  String _email = email;
  String _phoneNumber = phoneNumber;
  String _isoCode = countryCode;
  // String _isoCode = isoCode;
  final String url =
      "https://sandbox.nellys-coin.ejaraapis.xyz/api/v1/auth/sign-up/check-signup-details";
  http.Response response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": _userName,
        "email_address": email,
        "phone_number": phoneNumber,
        "country_code": _isoCode,
      }));
  print(response.reasonPhrase);
  print("header");
  print(response.body);
  if (response.statusCode == 200) {
    print("success");
    print("$_userName,$_email,$_phoneNumber,$_isoCode");
    return Post.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 404) {
    print("faild");
  } else if (response.statusCode == 409) {
    print("email already in use");
  } else if (response.statusCode == 400) {
    print(Post.fromJson(jsonDecode(response.body)));
    print("invalid state");
  } else if (response.statusCode == 500) {
    print("server error");
  } else {
    print(" exception");
  }
  return Post();
}

class Post {
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? countryCode;
  Post({this.userName, this.email, this.countryCode, this.phoneNumber});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userName: json["username"],
      email: json["email_address"],
      phoneNumber: json["phone_number"],
      countryCode: json["country_code"],
    );
  }
}
