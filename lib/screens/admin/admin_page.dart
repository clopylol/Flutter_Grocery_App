import 'package:flutter/material.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';

//Admin Giriş Yaptıktan Sonra Buraya Pasla

class AdminPage extends StatefulWidget {
  AdminPage({Key key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text('Yönetici Sayfası'),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      floatingActionButton:
          floatingActionButtonWidget(context, Icons.add, "/adminAddProduct"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
