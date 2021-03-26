import 'package:flutter/material.dart';
import 'package:grocery_app/ui/helpers/media_query_helper.dart';

Widget homeAppBarWidget(context) {
  return Padding(
    padding: EdgeInsets.only(top: 25, left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
        Container(
          width: displayWidth(context) * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 28,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}
