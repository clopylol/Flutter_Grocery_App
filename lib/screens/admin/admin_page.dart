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
      appBar: adminPageAppBarWidget(),
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

  //App Bar
  Widget adminPageAppBarWidget() {
    return AppBar(
      backgroundColor: colorPrimary,
      title: Text('Yönetici Sayfası'),
      //centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/adminShowProduct2');
          },
        ),
        IconButton(
          icon: Icon(
            Icons.add_business,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/adminShowProduct');
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colorSecondary,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/37087597?v=4'),
              //Login Eklenince burayı dinamik yaparız.
            ),
          ),
        ),
      ],
    );
  }
}
