import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Screens/update_product.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.product,Key? key}) : super(key: key);
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);



      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(


              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  offset: Offset(20, 20),
                ),
              ]),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0,6),
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          r'$' '${product.price.toString()}',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 10,
              // bottom: 85,
              top: -90,
              child: Image.network(product.image,height: 200,width: 90,))
        ],
      ),
    );

  }
}
