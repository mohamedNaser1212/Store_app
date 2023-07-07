import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static String id = 'homepage';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Icon(Icons.add_shopping_cart_outlined,color: Colors.black,size: 35,)
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              )),
        ],
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 30),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),
          builder: (context,snapshot){
    if (snapshot.hasData) {
      List<ProductModel>products=snapshot.data!;
     return GridView.builder(
       clipBehavior: Clip.none,

       itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 100,
          ),

          itemBuilder: (context, index) {
            return CustomCard(product: products[index],);
          });
    }else{
    return Center(child: CircularProgressIndicator());

    }
    }


    ),
    ),


    );
  }
}
