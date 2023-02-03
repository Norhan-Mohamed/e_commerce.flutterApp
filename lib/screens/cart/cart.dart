import 'package:e_commerce/api/products.dart';
import 'package:e_commerce/screens/constant.dart';
import 'package:flutter/material.dart';

import '../../network/cartDatabase.dart';
import '../details/details.dart';

class CartScreen extends StatefulWidget {
  //late var category;
  CartScreen(
      //   this.category,
      );
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: FutureBuilder<List<Product>>(
          future: CartDataProvider.instance.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print("http://" + snapshot.data![index].imageUrl);
                    return Flexible(
                      child: Container(
                          color: Constants.thirdColor,
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Row(
                              children: [
                                IconButton(
                                  iconSize: 100,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  snapshot.data![index].id,
                                                  snapshot
                                                      .data![index].imageUrl,
                                                  snapshot.data![index].name,
                                                  snapshot.data![index].price
                                                      .current.text,
                                                  snapshot
                                                      .data![index].productType,
                                                  snapshot
                                                      .data![index].brandName,
                                                  snapshot
                                                      .data![index].colourWayId,
                                                  snapshot.data![index].url,
                                                  snapshot.data![index].colour,
                                                  snapshot
                                                      .data![index].productCode,
                                                  snapshot.data![index]
                                                      .isSellingFast,
                                                  snapshot.data![index]
                                                      .hasVariantColours,
                                                  snapshot.data![index]
                                                      .hasMultiplePrices,
                                                  //  widget.category
                                                )));
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    child: Image.network(
                                      snapshot.data![index].imageUrl.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(children: [
                                  Text(
                                    snapshot.data![index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    snapshot.data![index].brandName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    snapshot.data![index].productType,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    snapshot.data![index].price.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  )
                                ]),
                                SizedBox(
                                  width: 100,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await CartDataProvider.instance
                                          .delete(snapshot.data![index].id);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color(0xff0c9173),
                                      size: 20,
                                    )),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return Center(
              child: Container(
                child: CircularProgressIndicator(
                  color: Constants.primaryColor,
                ),
                height: 100,
                width: 100,
              ),
            );
          }),
    );
  }
}
