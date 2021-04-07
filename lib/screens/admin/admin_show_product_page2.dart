import 'package:flutter/material.dart';
import 'package:grocery_app/core/models/products_model.dart';
import 'package:grocery_app/core/services/api_service.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';

class AdminShowProduct2 extends StatefulWidget {
  AdminShowProduct2({Key key}) : super(key: key);

  @override
  _AdminShowProduct2State createState() => _AdminShowProduct2State();
}

class _AdminShowProduct2State extends State<AdminShowProduct2> {
  ApiService service = ApiService.getInstance();

  //Servisten gelen dataları bu listte tutacağız.
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Mağazandaki Ürünler'),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //App Bar altındaki ürün filtreleme listesi.
              filterProductWidget(),

              Divider(
                thickness: 1.25,
              ),

              //Ürünleri Göster
              showDataBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  //App Bar
  Widget appBarWidget(String appBarTitle) {
    return AppBar(
      title: Text('$appBarTitle'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {});
          },
        )
      ],
    );
  }

  //App Bar altındaki ürün filtreleme buttonları listesi.
  //TODO- Burda chip kullanımı yapmak daha uygun olacak - Değiştir.
  Widget filterProductWidget() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorPrimary,
                  //onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text("Button $index"),
              ),
            );
          },
        ),
      ),
    );
  }

  //Db'deki ürünleri getir. (Tekrara Düştük)
  Widget showDataBuilder() {
    return FutureBuilder<List<Product>>(
      future: service.getProducts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          //Diğer case durumları da eklenecek !
          case ConnectionState.done:
            if (snapshot.hasData) {
              productList = snapshot.data;
              return _listProduct();
            }
            return Center(child: Text("Bir Hata Meydana Geldi !"));
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  //Servisten gelen ürünleri list view ile yazdır.
  Widget _listProduct() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return dismissCardWidget(
                child: _buildCard(
                    productImg: productList[index].imageUrl,
                    productName: productList[index].name,
                    productPrice: productList[index].money.toDouble(),
                    productDetail: 'Muz Cart Curt Lorem İpsum'),
                key: productList[index].key);
          }),
    );
  }

  //List view bu cardı kullanıp ürünleri bu tarzda gösterecek.
  //TODO-Görsel düzeltmeye ihtiyaç var !!!!!!!!!
  Widget _buildCard(
      {String productImg,
      String productName,
      double productPrice,
      String productDetail}) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Container(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: colorPrimary, width: 1.1),
              borderRadius: BorderRadius.circular(10),
            ),
            //color: myColor, random renk verebiliriz.
            elevation: 5,
            child: ListTile(
              title: Text(
                productName,
              ),
              subtitle: Text(productDetail),
              leading: Image.network(productImg),
              trailing: Text('$productPrice'),
            ),
          ),
        ));
  }

  //Kaydırıabilir Widget Tasarımı
  //TODO - Needs Cleaning
  Widget dismissCardWidget({Widget child, String key}) {
    return Dismissible(
      child: child,
      key: UniqueKey(),
      background: slideRightDismissibleWidget(),
      secondaryBackground: slideLeftDismissibleWidget(),
      onDismissed: (direction) async {
        await service.removeProducts(key);
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  //Ürün adını da sor.
                  content: Text("Ürünü silmek istiyor musunuz ? "),
                  actions: [
                    TextButton(
                      child: Text(
                        "İPTAL",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "SİL",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        // TODO: Eğer kullanıcı onay verirse, ürünü db den sil
                        setState(() {
                          //Burada çağır.
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          return res;
        } else {
          print('ÜRÜN DÜZENLEME SAYFASI YÜKLENİYOR...');
          //TODO - Ürünü düzenleme sayfasına göndert burda bizi Navigate...
        }
        return null;
      },
    );
  }

  //Widget Sağa kaydırılırsa
  Widget slideRightDismissibleWidget() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Düzenle",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  //Dismissable Widget sola kaydırılsa..
  Widget slideLeftDismissibleWidget() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Ürünü Sil",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
