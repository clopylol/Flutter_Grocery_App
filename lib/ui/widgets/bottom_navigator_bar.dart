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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.person),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

Widget floatingActionButtonWidget() {
  return FloatingActionButton(
    backgroundColor: colorPrimary,
    splashColor: Colors.green[300],
    onPressed: () {},
    child: Icon(
      Icons.shopping_cart_rounded,
      size: 25,
    ),
  );
}
