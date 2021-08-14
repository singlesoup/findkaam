import 'dart:convert';

import 'package:findkaam/Models/homePageModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomePageModel> getJobs;
  @override
  void initState() {
    super.initState();
    getJobs = getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.purple[400]!],
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu, color: Colors.white)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<HomePageModel>(
                future: getJobs,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator.adaptive();
                  }
                  return snapshot.hasData ?
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) => Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              // height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      snapshot.data!.data![index].designation ??
                                          "Desination",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      snapshot.data!.data![index]
                                              .areaOfSector ??
                                          "Organization Name",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 3,
                                    runSpacing: 2,
                                    children: [
                                      Chip(
                                        visualDensity:
                                            VisualDensity(vertical: -4),
                                        backgroundColor: Colors.grey[300],
                                        avatar: SizedBox(
                                          width: 18,
                                          child: CircleAvatar(
                                            // radius: 12,
                                            backgroundColor: themeColor,
                                            child: Icon(
                                              Icons.business_center,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                        label: SizedBox(
                                          width: 38,
                                          child: Text(
                                            snapshot.data!.data![index].exp ??
                                                "Experience",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Chip(
                                        visualDensity:
                                            VisualDensity(vertical: -4, horizontal: 0),
                                        backgroundColor: Colors.grey[300],
                                        avatar: SizedBox(
                                          width: 18,
                                          child: CircleAvatar(
                                            backgroundColor: themeColor,
                                            child: Icon(
                                              Icons.location_pin,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                        label: SizedBox(
                                          width: 44,
                                          child: Text(
                                            snapshot.data!.data![index]
                                                    .jobLocation ??
                                                "location",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline, color: Colors.grey[700],
                                        size: 16,),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                            snapshot.data!.data![index]
                                                    .technology!.replaceAll(" ", ", "),
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  )
                  :
                  Card(
                    child: Center(
                      child: Text("Something went wrong please try again!")
                    ),
                  )
                  ;
                }),
          ],
        ),
      ),
    );
  }

  Future<HomePageModel> getAllJobs() async {
    String url = "https://career-finder.aaratechnologies.in/job/api/all_job";

    print('\n\n getAllJobs url :$url \n\n');

    var response = await http.get(Uri.parse("$url"));
    print('\n\n payment response code :${response.statusCode}} \n\n');
    if (response.statusCode == 200) {
      var post = HomePageModel.fromJson(json.decode(response.body));
      // print('\n\n getAllJobs post :$post \n\n');

      return post;
    } else {
      throw Exception('Failed to load post!');
    }
  }
}
