import 'package:e_commerce/api/apiRequest.dart';
import 'package:e_commerce/api/lists.dart';
import 'package:e_commerce/api/products.dart';
import 'package:e_commerce/screens/constant.dart';
import 'package:e_commerce/screens/details/details.dart';
import 'package:flutter/material.dart';

import '../../network/cartDatabase.dart';
import '../../network/favDatabase.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int indexCategory = -1;
  List indexList = [
    4208,
    4209,
    4210,
  ];
  late int category;

  /* void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('Api', arguments: {'category': category});
  }*/

  @override
  Widget build(BuildContext context) {
    List categories = [
      "jeans",
      "shoes, Boots & Sneakers",
      "jewelery",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu_rounded,
            color: Constants.primaryColor,
            size: 20,
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Find ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                  Text(
                    "Your ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(" Desire Product",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.primaryColor,
                          fontSize: 20.0)),
                ],
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Constants.primaryColor,
              ),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Constants.thirdColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Constants.primaryColor,
                    size: 25,
                  ),
                  Text(
                    "search item...",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(2),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          indexCategory = indexList[index];
                          category = indexList[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Constants.thirdColor,
                          border: Border.all(
                              color: indexCategory == indexList[index]
                                  ? Constants.primaryColor
                                  : Colors.grey.shade300,
                              width: 2),
                        ),
                        child: Center(child: Text(categories[index])),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 10,
                    ),
                    itemCount: categories.length,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                FutureBuilder<Lists>(
                    future: Api().ApiData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Container(
                            height: 400,
                            child: GridView.builder(
                              itemCount: snapshot.data?.products.length,
                              itemBuilder: (context, index) {
                                void selectCategory(BuildContext ctx) {
                                  Navigator.of(ctx).pushNamed('details',
                                      arguments: {'category': category});
                                }

                                return InkWell(
                                    onTap: () => selectCategory(context),
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          snapshot.data!.products[index].id,
                                          snapshot
                                              .data!.products[index].imageUrl,
                                          snapshot.data!.products[index].name,
                                          snapshot.data!.products[index].price
                                              .current.text,
                                          snapshot.data!.products[index]
                                              .productType,
                                          snapshot
                                              .data!.products[index].brandName,
                                          snapshot.data!.products[index]
                                              .colourWayId,
                                          snapshot.data!.products[index].url,
                                          snapshot.data!.products[index].colour,
                                          snapshot.data!.products[index]
                                              .productCode,
                                          snapshot.data!.products[index]
                                              .isSellingFast,
                                          snapshot.data!.products[index]
                                              .hasVariantColours,
                                          snapshot.data!.products[index]
                                              .hasMultiplePrices,
                                        ),
                                      )),
                                      child: Hero(
                                        tag: 'photo$index',
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.17, //145,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "http://" +
                                                              snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .imageUrl),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.products[index].name,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .products[index]
                                                            .brandName,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .products[index]
                                                            .price
                                                            .current
                                                            .text,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    child: Center(
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          size: 15,
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () async {
                                                          await FavDataProvider.instance.insert(Product(
                                                              id: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .id,
                                                              name: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .name,
                                                              imageUrl: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .imageUrl,
                                                              colour: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .colour,
                                                              colourWayId: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .colourWayId,
                                                              brandName: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .brandName,
                                                              hasVariantColours: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .hasVariantColours,
                                                              hasMultiplePrices: snapshot
                                                                  .data!
                                                                  .products[
                                                                      index]
                                                                  .hasMultiplePrices,
                                                              productCode: snapshot
                                                                  .data!
                                                                  .products[index]
                                                                  .productCode,
                                                              productType: snapshot.data!.products[index].productType,
                                                              url: snapshot.data!.products[index].url,
                                                              isSellingFast: snapshot.data!.products[index].isSellingFast,
                                                              price: snapshot.data!.products[index].price));
                                                        },
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Constants
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    child: Center(
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 15,
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () async {
                                                          await CartDataProvider
                                                              .instance
                                                              .insert(Product(
                                                            id: snapshot
                                                                .data!
                                                                .products[index]
                                                                .id,
                                                            name: snapshot
                                                                .data!
                                                                .products[index]
                                                                .name,
                                                            imageUrl: snapshot
                                                                .data!
                                                                .products[index]
                                                                .imageUrl,
                                                            colour: snapshot
                                                                .data!
                                                                .products[index]
                                                                .colour,
                                                            colourWayId: snapshot
                                                                .data!
                                                                .products[index]
                                                                .colourWayId,
                                                            brandName: snapshot
                                                                .data!
                                                                .products[index]
                                                                .brandName,
                                                            hasVariantColours:
                                                                snapshot
                                                                    .data!
                                                                    .products[
                                                                        index]
                                                                    .hasVariantColours,
                                                            hasMultiplePrices:
                                                                snapshot
                                                                    .data!
                                                                    .products[
                                                                        index]
                                                                    .hasMultiplePrices,
                                                            productCode: snapshot
                                                                .data!
                                                                .products[index]
                                                                .productCode,
                                                            productType: snapshot
                                                                .data!
                                                                .products[index]
                                                                .productType,
                                                            url: snapshot
                                                                .data!
                                                                .products[index]
                                                                .url,
                                                            isSellingFast: snapshot
                                                                .data!
                                                                .products[index]
                                                                .isSellingFast,
                                                            price: snapshot
                                                                .data!
                                                                .products[index]
                                                                .price,
                                                          ));
                                                        },
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Constants
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Constants.thirdColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 3 / 4,
                                      mainAxisSpacing: 20),
                            ));
                      if (snapshot.hasError) {
                        print(snapshot.error!);
                        return Container(
                          child: Text(snapshot.error!.toString()),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Constants.primaryColor,
                        ),
                      );
                    }),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
