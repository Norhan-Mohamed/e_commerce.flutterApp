import 'package:flutter/material.dart';

import '../../api/apiRequest.dart';
import '../../api/lists.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  final String name;
  final String imageUrl;
  // final List<Price> price;
  late String colour;
  late int colourWayId;
  late String brandName;
  late bool hasVariantColours;
  late bool hasMultiplePrices;
  late int productCode;
  late String productType;
  late String url;
  late bool isSellingFast;
  //late int category;

  DetailsScreen(
    this.id,
    this.imageUrl,
    this.name,
    // this.price,
    this.productType,
    this.brandName,
    this.colourWayId,
    this.url,
    this.colour,
    this.productCode,
    this.isSellingFast,
    this.hasVariantColours,
    this.hasMultiplePrices,
    //this.category
  );

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff0c9173),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Hero(
        tag: 'photo',
        child: SingleChildScrollView(
          child: FutureBuilder<Lists>(
              future: Api().ApiData(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  print(snapShot.error.toString());
                }
                if (snapShot.hasData) {
                  return Column(children: [
                    Image.network(
                      widget.imageUrl,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0c9173),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  'easy',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.timer_sharp,
                                        size: 20,
                                      ),
                                      Text(
                                        widget.brandName,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      )
                                    ],
                                  )),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "price should be here",
                                        // widget.price.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      Text(
                                        'Ingredients',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          Divider(
                            height: 15,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.productType,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                              Container(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]);
                }
                return Center(
                    child: Container(
                  child: CircularProgressIndicator(),
                  height: 100,
                  width: 100,
                ));
              }),
        ),
      ),
    );
  }
}
