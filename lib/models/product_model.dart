import 'dart:convert';

class ProductModel
{
 final int  id;
 final String title;
  final dynamic price;
 final String description;
 final String image;
 final String category;

 final RatingModel rating;


 ProductModel({
   required this.id,
   required this.category,
   required this.title,
   required this.price,
   required this.description,

   required this.image,

   required this.rating,

 });
 factory ProductModel.fromJson(jsonData){
   
   return ProductModel(
       id: jsonData['id'],
       title: jsonData['title'],
        price:jsonData['price'],
       description: jsonData['description'],
     image: jsonData['image'],
       category: jsonData['category'],
       rating: RatingModel.fromJson(jsonData['rating']),

   );

   
 }

}
class RatingModel{
  final dynamic rate;
  final dynamic count;
  RatingModel({required this.count,required this.rate});
 factory RatingModel.fromJson(jsonData){
 return RatingModel( rate: jsonData['rate'],count: jsonData['count']);

 }


}