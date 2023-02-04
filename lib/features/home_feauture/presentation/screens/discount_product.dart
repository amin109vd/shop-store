import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';
import 'package:shoppstore/features/home_feauture/presentation/widget/product_card.dart';

import '../../../../config/color.dart';

class DiscountProduct extends StatefulWidget {
  const DiscountProduct({Key? key}) : super(key: key);

  @override
  State<DiscountProduct> createState() => _DiscountProductState();
}

class _DiscountProductState extends State<DiscountProduct> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getServer(),
      builder: (context, snapshot) {

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff00ADB5),
            title: const Text("Discount Product"),
          ),
          backgroundColor: Colors.white,
            body: snapshot.hasData
                ? GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
              childAspectRatio: (150 / 220),
                    children: List.generate(snapshot.data!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index].id,),));
                          },
                          child:Container(
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
                                  height: 150,
                                  width: 130,
                                  child: Image(
                                      image: NetworkImage(snapshot.data![index].image.toString())),
                                ),
                                10.toHeight,
                                Text(
                                  snapshot.data![index].title.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,fontWeight: FontWeight.w500),
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
                                              "\$${snapshot.data![index].price}"
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
                                  "\$${snapshot.data![index].price!/2}"
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ),
                      );
                    }),
                  )
                : Center(
                    child:  LoadingAnimationWidget.threeRotatingDots(
                        color: primaryColor, size: 50),
                  ));
      },
    );
  }
}
