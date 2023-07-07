import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_product.dart';


void main(){
  runApp(const StoreApp());

}


class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,

      routes: {
        HomePage.id:(context)=>HomePage(),
        UpdateProductPage.id:(context)=>UpdateProductPage(),

      },


    );
  }
}
