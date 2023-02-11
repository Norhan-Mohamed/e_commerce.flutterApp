import 'package:e_commerce/network/dataBaseModel.dart';
import 'package:e_commerce/screens/constant.dart';
import 'package:flutter/material.dart';

import '../../network/favDatabase.dart';

class FavouriteScreen extends StatefulWidget {
  State<FavouriteScreen> createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Favourites",
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: FutureBuilder<List<DataBaseModel>>(
          future: FavDataProvider.instance.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 8,
                      ),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data![index].name);
                    return Container(
                        color: Constants.thirdColor,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Constants.primaryColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Image.network(
                                  "http://${snapshot.data![index].imageUrl}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Flexible(
                                child: Column(children: [
                                  Text(
                                    snapshot.data![index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
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
                                ]),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Do You Want To Delete This Item ?',
                                              style: TextStyle(
                                                color: Constants.secondryColor,
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
                                                        Constants.primaryColor,
                                                    backgroundColor: Constants
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
                                                        Constants.primaryColor,
                                                    backgroundColor:
                                                        Constants.primaryColor),
                                                onPressed: () async {
                                                  await FavDataProvider.instance
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
                                    color: Constants.primaryColor,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ));
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
