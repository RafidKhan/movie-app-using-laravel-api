import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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

  final pageController = PageController(
    keepPage: true,
    //viewportFraction: 1,
    initialPage: 0,
  );

  double pageOffset = 0;

  final apiCall = Get.put(ApiCall());

  @override
  void initState() {
    getCount = apiCall.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<List<MovieModel>>(
              future: apiCall.getMovieData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView(
                    controller: pageController,
                    children: [
                      for (int i = 0;
                          i <
                              (getCount < snapshot.data.length
                                  ? getCount
                                  : snapshot.data.length);
                          i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        stops: [
                                          0.1,
                                          0.9
                                        ],
                                        colors: [
                                          Colors.blueGrey.withOpacity(.9),
                                          Colors.blueGrey.withOpacity(.1)
                                        ]),
                                    borderRadius: BorderRadius.circular(10)),
                                height: Get.height,
                                width: Get.width / 1.2,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),

                                        height: Get.height / 2.5,
                                        width: Get.width,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.network(
                                            snapshot.data[i].image,
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                  child: Image.asset(
                                                      'assets/error.jpg'));
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height / 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    width: Get.width / 1.4,
                                                    child: Text(
                                                      snapshot.data[i].title,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Get.width / 15,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height / 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Year: ",
                                                  style: TextStyle(
                                                      fontSize: Get.width / 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                    width: Get.width / 1.7,
                                                    child: Text(
                                                      snapshot.data[i].year,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Get.width / 20,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height / 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rating: ",
                                                  style: TextStyle(
                                                      fontSize: Get.width / 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                    width: Get.width / 1.9,
                                                    child: Text(
                                                      snapshot.data[i].rating,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Get.width / 20,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height / 20,
                                            ),
                                            RatingBar.builder(
                                              ignoreGestures: true,
                                              unratedColor: Colors.grey,
                                              itemSize: Get.width / 14,
                                              initialRating: double.parse(
                                                      snapshot.data[i].rating) /
                                                  2.0,
                                              minRating: 1,
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amberAccent,
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height / 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: FloatingActionButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (builder) {
                                                    return DetailPage(
                                                      image: snapshot
                                                          .data[i].image,
                                                      title: snapshot
                                                          .data[i].title,
                                                      year:
                                                          snapshot.data[i].year,
                                                      rating: snapshot
                                                          .data[i].rating,
                                                      desciption: snapshot
                                                          .data[i].description,
                                                    );
                                                  });
                                            },
                                            child: Icon(Icons.menu),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(width: 20,)
                          ],
                        ),
                      getCount < snapshot.data.length
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Coming Soon!",
                                  style: TextStyle(
                                      fontSize: Get.width / 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                    ],
                  );
                } else {
                  print("NO DATA FOUND");
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
