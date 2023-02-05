import 'package:e_commerce/network/cartDatabase.dart';
import 'package:e_commerce/network/favDatabase.dart';
import 'package:e_commerce/screens/Home/home.dart';
import 'package:e_commerce/screens/cart/cart.dart';
import 'package:e_commerce/screens/constant.dart';
import 'package:e_commerce/screens/favourite/favourite.dart';
import 'package:e_commerce/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FavDataProvider.instance.open();
  WidgetsFlutterBinding.ensureInitialized();
  CartDataProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //late var category;
  //late Map? price;
  MyHomePage({
    super.key, // this.price // this.category
  });

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* static Map? Pp;
  void initState() {
    Pp = widget.price;
    super.initState();
  }
*/
  List<Map<String, dynamic>> _pages = [
    {'page': Home(), 'title': 'Home'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': FavouriteScreen(), 'title': 'Favourite'},
  ];
  int _selectedPageIndex = 0;
  Index(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  widget.price = ModalRoute.of(context)!.settings.arguments as Map;
    // widget.category =
    //   ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        selectedItemColor: Constants.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        onTap: Index,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
        ],
      ),
    );
  }
}
