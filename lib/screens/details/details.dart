import 'package:e_commerce/api/details.dart';
import 'package:flutter/material.dart';

import '../../api/apiRequest.dart';
import '../constant.dart';

class DetailsScreen extends StatefulWidget {
  late int id;
  late String name;
  late String imageUrl;
  late String colour;
  late int colourWayId;
  late String brandName;
  late num price;

  DetailsScreen(
    this.id,
    this.name,
    this.imageUrl,
    this.brandName,
    this.colour,
    this.colourWayId,
    this.price,
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
          icon: const Icon(
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
          child: FutureBuilder<Details>(
              future: ApiInfo().ApiDetails(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Container(
                      child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Constants.secondryColor,
                          width: 3,
                        )),
                        child: Image.network(
                          "http://" + widget.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 800,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Constants.thirdColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.fourthColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 25,
                              thickness: 2,
                              color: Constants.secondryColor,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
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
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Constants.secondryColor,
                                        width: 3,
                                      )),
                                  child: Center(child: Text('1')),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
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
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 200,
                                ),
                                Text(
                                  "${widget.price}\$",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 25,
                              thickness: 1,
                              color: Constants.secondryColor,
                            ),
                            const Text("Product Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Brand Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  widget.brandName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Colour :' + widget.colour,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "gender: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.gender,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Is in Stock: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.isInStock.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.fourthColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  snapshot.data!.description,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Constants.secondryColor,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.rate_review_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                Text(
                                  "24 Product Question & Review",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                  size: 20,
                                )
                              ],
                            ),
                            Divider(
                              height: 15,
                              thickness: 1,
                              color: Constants.secondryColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    "Buy Now",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Constants.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    "Add To Cart",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                    color: Constants.secondryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
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
