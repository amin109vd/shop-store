import 'package:flutter/material.dart';
import 'package:shoppstore/core/utils/extention.dart';
class ProductCard extends StatefulWidget {
  const ProductCard({Key? key,required this.image,required this.title,required this.price}) : super(key: key);
final image;
final title;
final price;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 110,
            width: 130,
            child: Image(
                image: NetworkImage(widget.image)),
          ),
          5.toHeight,
          Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15),
          ),
          5.toHeight,
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
               width: 70,
               height: 30,
               child: Stack(
                 children: [
                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       "\$${widget.price}"
                           .toString(),
                       style: TextStyle(
                           fontWeight: FontWeight.w600,
                           color: Colors.grey,
                           fontSize: 15),
                     ),
                   ),
                   Align(alignment: Alignment.centerLeft,child: Text("--------",style: TextStyle(color: Colors.grey,fontSize: 20),)),

                 ],
               ),
             ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(child: Text("50%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),),
              )
            ],
          ),
          Text(
            "\$${widget.price/2}"
                .toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
