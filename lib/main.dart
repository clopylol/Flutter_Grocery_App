import 'package:flutter/material.dart';
import 'package:grocery_app/screens/admin/admin_add_product_page.dart';
import 'package:grocery_app/screens/admin/admin_page.dart';
import 'package:grocery_app/screens/admin/admin_show_product_page.dart';
import 'package:grocery_app/screens/admin/admin_show_product_page2.dart';
import 'package:grocery_app/ui/styles/color_style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',

      theme: ThemeData(
        primaryColor: colorPrimary,
        accentColor: colorSecondary,
      ),

      //Routes Table
      routes: {
        '/': (context) => AdminPage(), //Geçerli Sayfa
        '/adminAddProduct': (context) => AdminAddProductPage(),
        '/adminShowProduct': (context) => AdminShowProductPage(),
        '/adminShowProduct2': (context) => AdminShowProduct2(),
      },
      //Route Listimizde olmayan bir route geldiyse hata döndür.
      //Burası için bir error page tasarımı yapılabilir.
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('Birşeyler ters gitti. Böyle bir sayfa bulunmuyor.'),
          ),
        ),
      ),
    );
  }
}
