import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app/Models/movieModel.dart';
import 'package:movie_app/Pages/detail_page.dart';
import 'package:movie_app/Repository/apiCall.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var getCount;

  final apiCall = Get.put(ApiCall());

  @override
  void initState() {
    getCount = apiCall.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<MovieModel>>(
            future: apiCall.getMovieData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Material(
                  elevation: 4.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.1)
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i <
                                      (getCount < snapshot.data.length
                                          ? getCount
                                          : snapshot.data.length);
                                  i++)
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // showModalBottomSheet(
                                                  //     isScrollControlled:
                                                  //     true,
                                                  //     context: context,
                                                  //     builder: (builder) {
                                                  //       return DetailPage(
                                                  //         image: snapshot.data!.items[index].image,
                                                  //         fullTitle: snapshot.data!.items[index].fullTitle,
                                                  //         rank: snapshot.data!.items[index].rank,
                                                  //         rating: snapshot.data!.items[index].imDbRating,
                                                  //         crew: snapshot.data!.items[index].crew,
                                                  //         imDbRatingCount: snapshot.data!.items[index].imDbRatingCount,
                                                  //       );
                                                  //     });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                  height: Get.height / 2,
                                                  width: Get.width / 1.2,
                                                  child: Image.network(
                                                    snapshot.data[i].image,
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10))),
                                                width: Get.width / 1.2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height / 25,
                                                      ),
                                                      Container(
                                                        width: Get.width / 1.2,
                                                        child: Text(
                                                          "Movie Name: " +
                                                              snapshot.data[i]
                                                                  .title,
                                                          style: TextStyle(
                                                            fontSize: Get.width/15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.height / 25,
                                                      ),
                                                      Container(
                                                        width: Get.width / 1.2,
                                                        child: Text(
                                                            "Year: " +
                                                                snapshot.data[i]
                                                                    .year,
                                                            style: TextStyle(
                                                                fontSize: Get.width/15,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      SizedBox(
                                                        height: Get.height / 25,
                                                      ),
                                                      Container(
                                                        width: Get.width / 1.2,
                                                        child: Text(
                                                          "Rating: " +
                                                              snapshot.data[i]
                                                                  .rating,
                                                          style: TextStyle(
                                                              fontSize: Get.width/15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.height / 25,
                                                      ),
                                                      RatingBar.builder(
                                                        unratedColor:
                                                            Colors.grey,
                                                        itemSize:
                                                            Get.width / 17,
                                                        initialRating:
                                                            double.parse(
                                                                snapshot.data[i]
                                                                    .rating),
                                                        minRating: 1,
                                                        allowHalfRating: true,
                                                        direction:
                                                            Axis.horizontal,
                                                        itemCount: 10,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: Get.height / 25,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              getCount < snapshot.data.length
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: Get.height / 2,
                                      width: Get.width / 10,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            getCount += 10;
                                          });
                                        },
                                        icon: Icon(Icons.refresh),
                                      ),
                                    )
                                  : Container(
                                      width: Get.width / 2,
                                      height: Get.width / 2,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              stops: [
                                                0.1,
                                                0.9
                                              ],
                                              colors: [
                                                Colors.blueGrey.withOpacity(.1),
                                                Colors.blueGrey.withOpacity(.8)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Coming Soon!",
                                          style: TextStyle(
                                              fontSize: Get.width / 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                print("NO DATA FOUND");
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
