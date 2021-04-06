//Admninler mağazdaki ürünleri bu sayfadan görüntüleyebilir.
//Ürün silebilir ve istediği düzenlemeleri yapabilir.

import 'package:flutter/material.dart';
import 'package:grocery_app/ui/helpers/media_query_helper.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';

class AdminShowProductPage extends StatefulWidget {
  AdminShowProductPage({Key key}) : super(key: key);

  @override
  _AdminShowProductPageState createState() => _AdminShowProductPageState();
}

class _AdminShowProductPageState extends State<AdminShowProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Button $index"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height:
                        displayHeight(context) - displayHeight(context) * .3,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      children: List.generate(
                        50,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: Card(
                                color: Colors.amber,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
