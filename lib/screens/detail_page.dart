import 'package:flutter/material.dart';
import 'package:grocery_app/ui/helpers/media_query_helper.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';

class DetailPage extends StatefulWidget {
  final productImg;
  final productName;
  final productPrice;
  final productDetail;

  DetailPage(
      {Key key,
      this.productImg,
      this.productName,
      this.productPrice,
      this.productDetail})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Tekrara düştürk.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: colorPrimary,
      appBar: appBarWidget(),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: displayHeight(context) * 9,
                width: displayWidth(context),
                color: Colors.transparent,
              ),
              Positioned(
                top: 75,
                child: Container(
                  height: displayHeight(context) * .8,
                  width: displayWidth(context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      )),
                ),
              ),
              Positioned(
                top: 30,
                left: (displayWidth(context) / 2) - 105,
                child: Hero(
                    tag: widget.productImg,
                    child: CircleAvatar(
                      radius: displayHeight(context) * 0.153,
                      backgroundColor: colorPrimary,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: displayHeight(context) * 0.15,
                        backgroundImage: AssetImage(widget.productImg),
                      ),
                    )),
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.productName,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: textColor),
                    ),
                    SizedBox(height: 20),

                    //Fiyat ve Adet
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Ürün Fiyatı
                        Text(
                          "${widget.productPrice}0 ₺",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: colorPrimary),
                        ),

                        //Fiyat ve Adet Arasındaki Divider
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Container(
                              height: 30, color: Colors.grey, width: 1.0),
                        ),

                        //Ürün Adeti
                        Container(
                          width: 125,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: colorPrimary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: colorPrimary,
                                      size: 20,
                                    ),
                                  ),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                '5',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: colorPrimary,
                                      size: 20,
                                    ),
                                  ),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Ürün Açıklaması',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget.productDetail}'),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      // leading: IconButton(
      //   icon: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     color: Colors.white,
      //     onPressed: () {},
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      title: Text(
        'Ürün Detayı',
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
      ],
    );
  }
}
