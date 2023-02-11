import 'package:e_commerce/network/dataBaseModel.dart';
import 'package:e_commerce/screens/constant.dart';
import 'package:flutter/material.dart';

import '../../network/cartDatabase.dart';
import '../../network/favDatabase.dart';

class CartScreen extends StatefulWidget {
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  int counter = 0;
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
      body: FutureBuilder<List<DataBaseModel>>(
          future: CartDataProvider.instance.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print(snapshot.data![index].name);
                  return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Constants.thirdColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Constants.secondryColor,
                                    width: 3,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0))),
                              child: Image.network(
                                "http://${snapshot.data![index].imageUrl}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data![index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "Brand name: " +
                                    snapshot.data![index].brandName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                            ),
                            Text(
                              "price \$" +
                                  snapshot.data![index].price.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.minimize,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            counter--;
                                            if (counter <= 1) {
                                              counter = 1;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Constants.secondryColor,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: Text(counter.toString()),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Constants.primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        await FavDataProvider.instance
                                            .insert(DataBaseModel(
                                          id: snapshot.data![index].id,
                                          name: snapshot.data![index].name,
                                          imageUrl:
                                              snapshot.data![index].imageUrl,
                                          colour: snapshot.data![index].colour,
                                          colourWayId:
                                              snapshot.data![index].colourWayId,
                                          brandName:
                                              snapshot.data![index].brandName,
                                          price: snapshot.data![index].price,
                                        ));
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Do You Want To Delete This Item ?',
                                                  style: TextStyle(
                                                    color:
                                                        Constants.secondryColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape:
                                                            const StadiumBorder(),
                                                        foregroundColor:
                                                            Constants
                                                                .primaryColor,
                                                        backgroundColor:
                                                            Constants
                                                                .secondryColor),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape:
                                                            const StadiumBorder(),
                                                        foregroundColor:
                                                            Constants
                                                                .primaryColor,
                                                        backgroundColor:
                                                            Constants
                                                                .primaryColor),
                                                    onPressed: () async {
                                                      await CartDataProvider
                                                          .instance
                                                          .delete(snapshot.data!
                                                              .elementAt(index)
                                                              .id!
                                                              .toInt());
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: const Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Constants.secondryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 20),
              );
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
