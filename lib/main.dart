import 'package:flutter/material.dart';
import 'package:grocery_app/screens/admin/admin_add_product_page.dart';
import 'package:grocery_app/screens/admin/admin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',

      //Routes Table
      routes: {
        '/': (context) => AdminPage(), //Geçerli Sayfa
        '/adminAddProduct': (context) => AdminAddProductPage(),
      },
      //Route Listimizde olmayan bir route geldiyse hata döndür.
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('Birşeyler ters gitti'),
          ),
        ),
      ),
    );
  }
}
