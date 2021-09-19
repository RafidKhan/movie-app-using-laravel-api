import 'package:flutter/material.dart';
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.title),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.rating.toString()),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Description: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: Get.width / 1.3,
                            child: Text(widget.desciption)),
                      ],
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
