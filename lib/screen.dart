import 'package:ejeraapp/request/ejeraRequest.dart';
import 'package:ejeraapp/textformfield.dart';
import 'package:ejeraapp/waveCliper.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import "package:string_validator/string_validator.dart";

import 'customShape/customShape.dart';
import 'intl_phone_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String email = "";
  String username = "";
  String phoneNumber = "";
  String countryCode = "";

  String errorText = "";
  bool isValidEmail = false;
  bool _ejaraCheck = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Container(
                          color: Colors.transparent,
                          child: Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: WaveClipper(),
                                // WaveClipper(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  color: Colors.blue.shade900,
                                ),
                              ),

                              // ClipPath(
                              //     clipper: WaveClipper(),
                              // child: Container(
                              //     color: Colors.blue.shade900,
                              //     width: MediaQuery.of(context).size.width,
                              //     height: MediaQuery.of(context).size.height * 0.4)),

                              // CustomPaint(
                              //   size: Size(800, 260),
                              //   painter: RPSCustomPainter(
                              //       width: MediaQuery.of(context).size.width,
                              //       height: MediaQuery.of(context).size.height * 0.4),
                              // ),
                              // ),
                              Positioned(
                                  right: 1,
                                  child: Image.asset("assets/background.png",
                                      height: 190)),
                              Positioned(
                                  right: 10,
                                  left: 10,
                                  top: 10,
                                  bottom: 57,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Image.asset(
                                            "assets/ejaraLogoWhite.png"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Create an Account",
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Scaffold(
                        resizeToAvoidBottomInset: false,
                        body: SingleChildScrollView(
                          reverse: true,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 30),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "field can't be empty";
                                    } else if (_ejaraCheck == true) {
                                      return "username cant contain 'ejara' ";
                                    } else if (_ejaraCheck == false) {
                                      return (value.length < 3 ||
                                              value.length > 30)
                                          ? "user name should not be < '3' or > '30' "
                                          : null;
                                    }
                                  },
                                  // value!.isEmpty
                                  //   ? "field can't be empty"
                                  //   : (value.length < 3 || value.length > 30)
                                  //       ? "user name should not be < '3' or > '30' "
                                  //       : null,
                                  decoration: inputDecoration("Username"),
                                  onChanged: (value) {
                                    setState(() {
                                      _ejaraCheck = contains(value, "ejara");
                                    });
                                    print("ejara check");
                                    print(_ejaraCheck);

                                    print(value);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) => value!.isEmpty
                                      ? "field  can't be empty"
                                      : null,
                                  decoration: inputDecoration("email"),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                    print(email);
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Center(
                                    child: Text("$errorText",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Colors.red))),

                                SizedBox(
                                  height: 10,
                                ),
                                IntlPhoneField(
                                  dropDownIcon: Icon(Icons.keyboard_arrow_down),
                                  showCountryFlag: true,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                  ),
                                  onChanged: (phone) {
                                    setState(() {
                                      phoneNumber = phone.completeNumber;
                                      countryCode = "$phone.countryCode";
                                    });

                                    print(phone.completeNumber);
                                  },
                                  onCountryChanged: (phone) {
                                    print('Country code changed to: ' +
                                        "$phone.countryCode");
                                  },
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                // Center(
                                // child:
                                Text(
                                  "a confirmation code will be sent to you",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.grey.shade500,
                                      fontSize: 13),
                                )
                                // )
                                // MaterialButton(
                                //   child: Text('Submit'),
                                //   color: Theme.of(context).primaryColor,
                                //   textColor: Colors.white,
                                //   onPressed: () {
                                //     _formKey.currentState.validate();
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        username.contains("ejera");
                        ejeraRequest(
                            email: email,
                            userName: username,
                            phoneNumber: phoneNumber,
                            countryCode: countryCode);
                        isValidEmail = EmailValidator.validate(email);
                        if (isValidEmail == false) {
                          setState(() {
                            errorText =
                                "email 'error' check email format or enter a valid email";
                          });
                        } else {
                          setState(() {
                            errorText = "";
                          });
                        }

                        if (_formKey.currentState!.validate()) {
                          print("valid state");
                        } else {
                          print("invalid state");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 280,
                        child: Center(
                            child: Text(
                          "next",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue.shade900,
                            shape: BoxShape.rectangle),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
