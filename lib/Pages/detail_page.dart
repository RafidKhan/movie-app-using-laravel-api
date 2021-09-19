import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  var image;
  var title;
  var rating;
  var year;
  var desciption;

  DetailPage({
    this.image,
    this.title,
    this.rating,
    this.year,
    this.desciption,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 1.3,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.1,
              0.9
            ], colors: [
              Colors.blueGrey.withOpacity(.8),
              Colors.blueGrey.withOpacity(.1)
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.network(
                  widget.image,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Image.asset('assets/error.jpg'));
                  },
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Title: ",
                          style: TextStyle(fontSize:
                          Get.width / 15,fontWeight: FontWeight.bold),
                        ),
                        Text(widget.title, style: TextStyle(fontSize:
                        Get.width / 15,),),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating: ",
                          style: TextStyle(fontSize:
                          Get.width / 15,fontWeight: FontWeight.bold),
                        ),
                        Text(widget.rating.toString(),style: TextStyle(fontSize:
                        Get.width / 15,),),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Container(
                      child: Center(
                        child: RatingBar.builder(
                          unratedColor:
                          Colors.grey,
                          itemSize:
                          Get.width / 17,
                          initialRating:
                          double.parse(widget.rating),
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
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Container(
                      width: Get.width,
                      child: Text(
                        "Description: "+widget.desciption,
                        style: TextStyle(fontSize:
                        Get.width / 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
