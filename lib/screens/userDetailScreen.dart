import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubapi_fetcher/models/user_model.dart';
import 'package:githubapi_fetcher/screens/not_foundScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  String year;
  String month;
  String date;
  TextEditingController notesController = TextEditingController();
  bool notesEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User a1 = ModalRoute.of(context).settings.arguments;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var arr = a1.createdAt.split('-');
    year = arr[0];
    switch (int.parse(arr[1])) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "february";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
    date = arr[2].split('T')[0];
    return a1.htmlUrl == "abcxyz123.com" &&
            a1.createdAt == "2050-05-30T10:50:13Z"
        ? NotFoundScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/back.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  a1.loginName ?? "not available",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.open_in_new_sharp,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await canLaunch(a1.htmlUrl)
                                    ? await launch(a1.htmlUrl)
                                    : print("Can't launch");
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Container(
                                    height: 90.0,
                                    width: 90.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(a1.avatarUrl),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              a1.followers.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Followers",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              a1.following.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Following",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              a1.publicRepos.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Repos",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25.0,
                            ),
                            a1.name != null
                                ? Text(
                                    a1.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 3.0,
                            ),
                            a1.location != null
                                ? Text(
                                    a1.location,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 5.0,
                            ),
                            a1.bio != null
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 5.0),
                                    child: Text(
                                      a1.bio,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 20.0,
                            ),
                            Divider(),
                            SizedBox(
                              height: 20.0,
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 20.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         "Notes:",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       IconButton(
                            //         icon: notesEnabled == true
                            //             ? Icon(Icons.edit)
                            //             : Icon(Icons.edit_off),
                            //         onPressed: () {
                            //           setState(() {
                            //             notesEnabled = !notesEnabled;
                            //           });
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 12.0,
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 20.0),
                            //   child: TextField(
                            //     controller: notesController,
                            //     minLines: 5,
                            //     maxLines: 10,
                            //     autofocus: true,
                            //     cursorColor: Color(0xff800080),
                            //     enabled: notesEnabled,
                            //     decoration: InputDecoration(
                            //       suffix: IconButton(
                            //         padding: EdgeInsets.all(0.0),
                            //         icon: Icon(
                            //           Icons.clear,
                            //           color: MediaQuery.of(context)
                            //                       .viewInsets
                            //                       .bottom ==
                            //                   0.0
                            //               ? Colors.grey
                            //               : Colors.black,
                            //         ),
                            //         onPressed: () {
                            //           setState(() {
                            //             notesController.text = "";
                            //           });
                            //         },
                            //       ),
                            //       disabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.grey,
                            //           width: 2.0,
                            //         ),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Color(0xff800080),
                            //           width: 2.0,
                            //         ),
                            //       ),
                            //       hintText: "Enter your notes here...",
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Color(0xff800080),
                            //           width: 2.0,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 12.0,
                            // ),
                            // ElevatedButton(
                            //   onPressed: notesEnabled ? () {} : null,
                            //   child: Text(
                            //     "Save",
                            //     style: TextStyle(
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            //   style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(
                            //       Colors.white,
                            //     ),
                            //     shadowColor: MaterialStateProperty.all(
                            //       Color(0xff800080),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 25.0,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Joined at $month $date, $year",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
