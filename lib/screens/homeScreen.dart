import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:githubapi_fetcher/models/user_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const String baseUrl = 'api.github.com';
const String apiToken = "8fdec02cb6e95edb1d0f4a080739f3e7fd182329";

class _HomePageState extends State<HomePage> {
  TextEditingController userName = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  Future<User> fetchedUser;

  Future<User> fetchUserData(String user) async {
    http.Response response =
        await http.get(Uri.https(baseUrl, 'users/$user'), headers: {
      'Authorization': 'token $apiToken',
    });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      return User(
        name: " ",
        location: " ",
        avatarUrl: " ",
        bio: " ",
        createdAt: "2050-05-30T10:50:13Z",
        followers: 0,
        following: 0,
        loginName: " ",
        publicRepos: 0,
        htmlUrl: "abcxyz123.com",
      );
    }
  }

  bool loading = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Github",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Fetcher",
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/github--v1.png'),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 50.0,
                      bottom: 20.0,
                    ),
                    child: Theme(
                      data: ThemeData(
                        errorColor: Colors.redAccent,
                      ),
                      child: TextFormField(
                        focusNode: focusNode,
                        controller: userName,
                        cursorColor: Colors.black,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "plz, Enter data";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter your github username",
                          hintStyle: TextStyle(fontFamily: "Mali"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        if (formKey.currentState.validate()) {
                          var connectivityResult =
                              await (Connectivity().checkConnectivity());
                          if (connectivityResult == ConnectivityResult.mobile ||
                              connectivityResult == ConnectivityResult.wifi) {
                            setState(() {
                              loading = true;
                            });
                            print(connectivityResult);
                            userName.text = userName.text.trim();
                            userName.text = userName.text.replaceAll(' ', '');
                            setState(() {
                              fetchedUser = fetchUserData(userName.text);
                              fetchedUser
                                  .then((value) => Navigator.of(context)
                                      .pushNamed('/userDetail_page',
                                          arguments: value))
                                  .then((value) {
                                setState(() {
                                  loading = false;
                                  userName.clear();
                                  // FocusScope.of(context).requestFocus(focusNode);
                                });
                              });
                            });
                          } else {
                            Navigator.of(context)
                                .pushNamed('/connectionPage')
                                .then((value) {
                              //  FocusScope.of(context).requestFocus(focusNode);
                              userName.clear();
                            });
                          }
                        }
                      },
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        height: 50.0,
                        alignment: Alignment.center,
                        child: Text(
                          "Check",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  loading
                      ? FutureBuilder(
                          future: fetchedUser,
                          builder: (BuildContext context, ss) {
                            if (ss.hasError) {
                              print(ss.error);
                            }
                            return SpinKitFadingCircle(
                              size: 60.0,
                              color: Colors.white,
                            );
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
