import 'package:flutter/material.dart';
import 'package:grocery_app/ui/styles/color_style.dart';
import 'package:grocery_app/ui/widgets/bottom_navigator_bar.dart';

class AdminAddProductPage extends StatefulWidget {
  AdminAddProductPage({Key key}) : super(key: key);

  @override
  _AdminAddProductPageState createState() => _AdminAddProductPageState();
}

class _AdminAddProductPageState extends State<AdminAddProductPage> {
  //Form Validasyonu için bir global keye ihtiyacimiz var.
  GlobalKey<FormState> _formKey = GlobalKey(debugLabel: "formKey");

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerImageUrl = TextEditingController();

  //TextEdittingControllerdaki String'in boş olup olmadığını kontrol için kullandık.
  String validatorStr(val) {
    if (val.isEmpty) {
      return 'Lütfen bu alanı boş bırakmayın !';
    }
    return null;
  }

  //TextEdittingController'ın boş olup olmadığını ve sayi olup olmadığını kontrol için kullandık.
  String validatorInt(val) {
    if (val.isEmpty) {
      return "Lütfen bu alanı boş bırakmayın !";
    } else if (double.tryParse(val) == null) {
      return "Lütfen bir sayı giriniz !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text('Mağazaya Ürün Ekle'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      ),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      floatingActionButton:
          floatingActionButtonWidget(context, Icons.shopping_cart_rounded, ""),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFormWidget(
                    controller: controllerName,
                    validator: this.validatorStr,
                    inputIcon: Icons.ac_unit_sharp,
                    inputText: 'Ürün Adı',
                  ),
                  textFormWidget(
                    controller: controllerPrice,
                    validator: this.validatorInt,
                    inputIcon: Icons.ac_unit_sharp,
                    inputText: 'Ürün Fiyatı',
                  ),
                  textFormWidget(
                    controller: controllerImageUrl,
                    validator: this.validatorStr,
                    inputIcon: Icons.ac_unit_sharp,
                    inputText: 'Ürün Resmi',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//  Kalıp Text Form Field
  Widget textFormWidget({
    controller,
    validator,
    inputIcon,
    inputText,
  }) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: inputDecoration(inputIcon, inputText),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10))
      ],
    );
  }

  //Kalıp Input Decoration
  InputDecoration inputDecoration(IconData inputIcon, String inputText) {
    return InputDecoration(
      icon: Icon(inputIcon),
      border: OutlineInputBorder(),
      labelText: inputText,
      hasFloatingPlaceholder: true,
      //şeylerde sıkıntı var validate
    );
  }
}
