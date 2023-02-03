import 'package:flutter/material.dart';
import 'package:shoppstore/config/color.dart';
import 'package:shoppstore/core/resources/data_state.dart';
import 'package:shoppstore/core/utils/extention.dart';

import 'buy_screen.dart';

class SetTimeAddressScreen extends StatefulWidget {
  const SetTimeAddressScreen({Key? key}) : super(key: key);

  @override
  State<SetTimeAddressScreen> createState() => _SetTimeAddressScreenState();
}

class _SetTimeAddressScreenState extends State<SetTimeAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    num calculateSubtotal(List cartList) {
      return cartList
          .map((item) => item['price'] * item['quantity'])
          .reduce((a, b) => a + b);
    }
    calculateSubItems(List cartList) {
      return cartList.map((e) => e['quantity']).reduce((value, element) => value+element);

    }
    return Scaffold(
      bottomNavigationBar: Container(
        height: height/12,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("pr"),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("\$${(15+calculateSubtotal(cartList)).toString()}",
                        style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                  ),

                ],
              ),


                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18),
                      minimumSize: Size(200, 40),
                      backgroundColor: const Color(0xff00ADB5)),
                  child: const Text("Keep Going"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(),));

                  })

            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          "Set address and time",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height / 6,
            width: width,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 6 / 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        10.toWidth,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send to",
                              style: TextStyle(color: Colors.black26),
                            ),
                            SizedBox(
                                width: width / 1.3,
                                child: const Text(
                                  "London,Westminster,5 King St",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "change or update address >",
                          style: TextStyle(color: primaryColor, fontSize: 14),
                        ),
                      ))
                ],
              ),
            ),
          ),
          5.toHeight,
          SizedBox(
            height: height/2.7,
            width: width,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Text("delivery time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                     ),
                   ],
                 ),

                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: cartList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: width / 3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(image: NetworkImage(cartList[index]["image"]))
                          ),
                          child: Stack(
                            children: [
                              Positioned(right: 0,bottom: 0,child: CircleAvatar(radius: 13,backgroundColor: Colors.blueGrey,child: Text(cartList[index]["quantity"].toString()),))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(flex: 2,child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("delivery time : not set",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            5.toHeight,
                            Text("delivery price : \$15",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                          ],
                        ),
                        Text(
                          "set delivery time >",
                          style: TextStyle(color: primaryColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          5.toHeight,
          SizedBox(
            height: height / 4,
            width: width,
            child: Card(
              color: Colors.white,
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,

                  ),
                  height: height/4,

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

                                    fontSize: 18),
                              ),
                              Divider(
                                height: 2,

                              ),
                              10.toHeight,
                              Text(
                                "discounts :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,

                                    fontSize: 18),
                              ),
                              10.toHeight,
                              Text(
                                "price :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,

                                    fontSize: 18),
                              ),
                              10.toHeight,
                              Text(
                                "delivery price :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,

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

                                      fontSize: 18)),
                              10.toHeight,
                              Text("0",
                                  style: TextStyle(

                                      fontSize: 18)),
                              10.toHeight,
                              Text("\$${calculateSubtotal(cartList).toStringAsFixed(2)}",
                                  style: TextStyle(

                                      fontSize: 18)),
                              10.toHeight,
                              Text("\$15",
                                  style: TextStyle(

                                      fontSize: 18)),
                              10.toHeight,
                            ],
                          ),
                        ],
                      ),
                      5.toHeight,
                      Divider(
                        height: 1,

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

                                fontSize: 18),
                          ),
                          Text(
                              "\$${(15 + calculateSubtotal(cartList)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,

                                  fontSize: 18)),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),
          5.toHeight
        ],
      ),
    );
  }
}
