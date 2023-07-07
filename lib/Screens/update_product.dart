import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
static String id='updatepage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
String? ProductName,desc,image,id;

String? price;
bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(

      inAsyncCall:isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update product',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: 100,
              ),
              CustomTextField(hinttext: 'Product Name',
              onChanged: (data){
                ProductName=data;

              },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hinttext: 'description',
                onChanged: (data){
                  desc=data;

                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hinttext: 'Price',

                onChanged: (data){
                price=data;
                // price=int.parse(data);


              },
                inputType:TextInputType.number,

               ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hinttext: 'image',
              onChanged: (data){
                image=data;

              },
              ),
              SizedBox(
                height: 50,
              ),
              custombutton(text: 'Update',

                onTap: () async{
                isLoading=true;
                setState((){});
                await updateProduct(product);

               try {

                 print('success');
               }catch (e) {
                 print(e.toString());
                isLoading=false;
                setState(() {

                });
               }

               isLoading=false;
               setState(() {

               });

                },

              ),



            ],




          ),
        ),



      ),
    );
  }
Future <void> updateProduct(ProductModel product) async{
 await  UpdateProductService().updateProduct(
   id: product.id,
    title: ProductName== null ? product.title:ProductName!,
    price: price ==null ? product.price.toString():price! ,
    desc: desc==null ? product.description:desc!,
    image:image==null ? product.image:image!,
    category: product.category,

  );
}
}
