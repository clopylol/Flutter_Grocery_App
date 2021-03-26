import 'package:flutter/material.dart';
import 'package:grocery_app/screens/detail_page.dart';
import 'package:grocery_app/ui/helpers/media_query_helper.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';
import 'package:grocery_app/ui/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: colorPrimary,
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(
        children: [
          homeAppBarWidget(context),

          SizedBox(height: 10),

          bodyTitleWidget(
              mainTitle: 'Taze', subTitle: 'Meyveler'), //Yukarıya al bunları.
          SizedBox(height: 40),

          //Ürünlerin Bulduğu Kart
          Container(
            height: displayHeight(context) * 0.77,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 25, right: 20, top: 4),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: displayHeight(context) * .65,
                    child: ListView(
                      children: [
                        _buildProductItem(
                            productImg: 'assets/images/food1.jpeg',
                            productName: 'Muz',
                            productPrice: 12.00,
                            productDetail: 'Muz Cart Curt Lorem İpsum'),
                        _buildProductItem(
                            productImg: 'assets/images/food2.jpeg',
                            productName: 'Çilek',
                            productPrice: 8.50,
                            productDetail: 'Çilek Cart Curt Lorem İpsum'),
                        _buildProductItem(
                            productImg: 'assets/images/food3.jpeg',
                            productName: 'Armut',
                            productPrice: 5.50,
                            productDetail: 'Armut Cart Curt Lorem İpsum'),
                        _buildProductItem(
                            productImg: 'assets/images/food4.jpeg',
                            productName: 'Nat',
                            productPrice: 8.00,
                            productDetail: 'Nar Cart Curt Lorem İpsum'),
                        _buildProductItem(
                            productImg: 'assets/images/food5.jpeg',
                            productName: 'Limon',
                            productPrice: 7.50,
                            productDetail: 'Limon Cart Curt Lorem İpsum'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Body Başlık
  Widget bodyTitleWidget({String mainTitle, subTitle}) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: mainTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorSecondary,
                    fontSize: 28,
                  ),
                ),
                TextSpan(
                  text: " $subTitle",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: colorSecondary,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Body Ürün
  Widget _buildProductItem(
      {String productImg,
      String productName,
      double productPrice,
      String productDetail}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                    productImg: productImg,
                    productName: productName,
                    productPrice: productPrice,
                    productDetail: productDetail,
                  )));
        }, //NAVİGATE EKLENECEK
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                    tag: productImg,
                    child: Image(
                        image: AssetImage(productImg),
                        fit: BoxFit.cover,
                        height: 90,
                        width: 90),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24.0,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${productPrice}0 ₺',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: colorPrimary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                size: 32,
              ),
              color: colorPrimary,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
