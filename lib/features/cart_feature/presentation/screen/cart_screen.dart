import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppstore/core/resources/data_state.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/discount_product.dart';

import '../../../../config/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ScrollController scrollController = ScrollController();
@override
removeProduct(index){
  cartList.removeWhere((item) => item['productId'] == cartList[index]["productId"]);
}
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    num calculateSubtotal(List cartList) {
      return cartList
          .map((item) => item['price'] * item['quantity'])
          .reduce((a, b) => a + b);
    }
     calculateSubItems(List cartList) {
       return cartList.map((e) => e['quantity']).reduce((value, element) => value+element);

     }
    return Scaffold(
        backgroundColor: Colors.white,
        body: cartList.isNotEmpty
            ? CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: height / 3.4,
                    centerTitle: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: InkWell(
                          onTap: () {
                            if (scrollController.offset ==
                                scrollController.initialScrollOffset) {
                              //Navigator.of(context).push(MaterialPageRoute(
                                //  builder: (context) => ));
                            } else {
                              scrollController.animateTo(
                                  scrollController.initialScrollOffset,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: Text(
                            "Buy now".toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      centerTitle: true,
                      background: Container(
                        height: 400,
                        color: Color(0xff6D7993),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Items :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        10.toHeight,
                                        Text(
                                          "discounts :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        10.toHeight,
                                        Text(
                                          "price :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        10.toHeight,
                                        Text(
                                          "delivery price :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(calculateSubItems(cartList).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        10.toHeight,
                                        Text("0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        10.toHeight,
                                        Text("\$${calculateSubtotal(cartList).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        10.toHeight,
                                        Text("\$15",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        10.toHeight,
                                      ],
                                    ),
                                  ],
                                ),
                                5.toHeight,
                                Divider(
                                  height: 1,
                                  color: Colors.white,
                                ),
                                10.toHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sub total :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    Text(
                                        "\$${(15 + calculateSubtotal(cartList)).toStringAsFixed(2)}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: primaryColor,
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index].id,),));
                        },
                        child: Container(
                          height: 160,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                            width: width / 4,
                                            height: 150 / 1.2,
                                            child: Image.network(cartList[index]
                                                    ["image"]
                                                .toString()))),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: SizedBox(
                                          width: width / 1.5,
                                          child: Text(
                                            cartList[index]["title"].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 10,
                                left: width / 3.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "\$${cartList[index]["price"].toString()}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  width: width / 3,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        cartList[index]["quantity"] == 1
                                            ? InkWell(
                                                onTap: () {

                                                  setState(() {
                                                    removeProduct(index);
                                                    Get.snackbar(
                                                        "remove product",
                                                        "This product removed from the shopping cart");
                                                  });
                                                },
                                                child: Icon(
                                                  Icons
                                                      .remove_shopping_cart_sharp,
                                                  color: Colors.red,
                                                ))
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    for (var item in cartList) {
                                                      if (item["productId"] ==
                                                          cartList[index]
                                                              ["productId"]) {
                                                        if (cartList[index]
                                                                ["quantity"] >
                                                            1) {
                                                          cartList[index]
                                                              ["quantity"]--;
                                                        }
                                                      }
                                                    }
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.red,
                                                )),
                                        Text(
                                          "${cartList[index]["quantity"]}",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                for (var item in cartList) {
                                                  if (item["productId"] ==
                                                      cartList[index]
                                                          ["productId"]) {
                                                    if (cartList[index]
                                                            ["quantity"] <
                                                        5) {
                                                      cartList[index]
                                                          ["quantity"]++;
                                                    }
                                                  }
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Color(0xff00ADB5),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: cartList.length,
                  )),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height / 7,
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width/3,
                      height: height/5,
                      child: Image.asset("assets/images/trolley.png"),
                      
                    ),
                    Text("Your cart is empty"),
                  ],
                ),
              ));
  }
}
/*
Container(
child: SafeArea(
child: Column(
children: [
Align(alignment: Alignment.centerLeft,child: Padding(
padding: const EdgeInsets.only(left: 10.0),
child: Text("Shopping store",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
)),
5.toHeight,
Padding(
padding: const EdgeInsets.symmetric(horizontal: 12.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("${cartList.length} items",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
TextButton(onPressed: (){},child: Text("Continue shopping",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: primaryColor),),),
],
),
),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 10),
child: Divider(height: 2,color: Colors.black,),
),
Expanded(
child: ListView.separated(
itemCount: cartList.length,
separatorBuilder: (BuildContext context, int index) =>
Padding(
padding: const EdgeInsets.symmetric(horizontal: 10.0),
child: Divider(height: 4),
),
itemBuilder: (BuildContext context, int index) {
return  GestureDetector(
onTap: (){
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index].id,),));
},
child: Container(
height: 160,
child: Stack(
children: [
Row(
children: [
Padding(
padding: const EdgeInsets.all(10.0),
child: Align(
alignment: Alignment.centerLeft,
child: SizedBox(
width: width / 4,
height: 150 / 1.2,
child: Image.network(cartList[index]["image"].toString()
))),
),
Align(
alignment: Alignment.topCenter,
child: Padding(
padding: const EdgeInsets.only(top: 20.0),
child: SizedBox(
width: width / 1.5,
child: Text(
cartList[index]["title"].toString(),
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.w500),
)),
),
),
],
),
Positioned(
bottom: 10,
left: width/3.5,
child:   Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
"\$${cartList[index]["price"].toString()}",
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500)),
),
),
Positioned(
bottom: 10,
right: 10,
child: Container(
width: width/3,
height: 40,
decoration: BoxDecoration(
color: Colors.black12,
borderRadius: BorderRadius.circular(10)),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
cartList[index]["quantity"] == 1
? InkWell(
onTap: () {
setState(() {
for(var item in cartList){
if(item["productId"]==cartList[index]["productId"]){
cartList.remove(item);
}
}
Get.snackbar("remove product", "This product removed from the shopping cart");

cartList[index]["quantity"] = 0;
});
},
child: Icon(
Icons.remove_shopping_cart_sharp,
color: Colors.red,
))
    : InkWell(
onTap: () {

setState(() {
for(var item in cartList){
if(item["productId"]==cartList[index]["productId"]){
if (cartList[index]["quantity"] > 1) {
cartList[index]["quantity"]--;
}
}
}


});
},
child: Icon(
Icons.remove,
color: Colors.red,
)),
Text(
"${cartList[index]["quantity"]}",
style: TextStyle(
fontSize: 20,
),
),
InkWell(
onTap: () {
setState(() {
for(var item in cartList){
if(item["productId"]==cartList[index]["productId"]){
if (cartList[index]["quantity"] < 5) {
cartList[index]["quantity"]++;
}
}
}
});
},
child: Icon(
Icons.add,
color: Color(0xff00ADB5),
))
],
),
),
),
)
],
),
),
);
},
),
),

Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("Sub Total",style: TextStyle(fontSize: 17)),

Text("\$${calculateSubtotal(cartList)}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25))
],
),
),
10.toHeight,
],
),
),
)*/
