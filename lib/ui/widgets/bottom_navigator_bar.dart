import 'package:flutter/material.dart';
import 'package:grocery_app/ui/helpers/media_query_helper.dart';
import 'package:grocery_app/ui/styles/color_style.dart';

Widget bottomNavigatorBarWidget(context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    color: colorPrimary,
    child: Container(
      height: displayHeight(context) * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.admin_panel_settings),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/adminPage');
            },
          ),
        ],
      ),
    ),
  );
}

Widget floatingActionButtonWidget(
    BuildContext context, IconData icon, String route) {
  return FloatingActionButton(
    backgroundColor: colorPrimary,
    splashColor: Colors.green[300],
    onPressed: () => Navigator.pushNamed(context, route),
    child: Icon(
      icon,
      size: 25,
    ),
  );
}
