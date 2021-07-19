import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String url = "type";
Future<http.Response> ejeraRequest(
    {userName, email, phoneNumber, countryCode}) async {
  String _userName = userName;
  String _email = email;
  String _phoneNumber = phoneNumber;
  String _countryCode = countryCode;
  final String url =
      "https://sandbox.nellys-coin.ejaraapis.xyz/api/v1/auth/sign-up/check-signup-details";
  http.Response response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "username": _userName,
        " email_address": _email,
        "phone_number": _phoneNumber,
        " country_code": _countryCode
      }));
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("success");
  } else if (response.statusCode == 404) {
    print("faild");
  } else if (response.statusCode == 409) {
    print("email already in use");
  } else if (response.statusCode == 400) {
    print("invalid phone number");
  } else if (response.statusCode == 500) {
    print("server error");
  }

  return response;
}
