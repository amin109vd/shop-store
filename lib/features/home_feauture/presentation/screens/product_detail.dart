import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppstore/core/resources/data_state.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController pageController = PageController();
  bool text = false;
  bool cart = false;
  bool isLiked = false;
  int count = 0;
  String _selectedSize = 'S';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final withd = MediaQuery.of(context).size.width;
    return FutureBuilder(future: getSingleServer(widget.id),builder: (context, snapshot) {
      return Scaffold(
        bottomNavigationBar: snapshot.hasData ?
        Container(
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
                      child: Text("\$${snapshot.data!.price.toString()}",
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                    ),

                  ],
                ),

                count == 0
                    ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                        minimumSize: Size(200, 40),
                        backgroundColor: const Color(0xff00ADB5)),
                    child: const Text("Add To Cart"),
                    onPressed: () {
                      setState(() {
                        cartList.add({
                          "productId" : snapshot.data!.id,
                          "quantity" : 1,
                           "image" : snapshot.data!.image,
                          "title" : snapshot.data!.title,
                            "category": snapshot.data!.category,
                          "price" : snapshot.data!.price,

                        });
                        Get.snackbar("add cart", "This product has been added to the shopping cart");
                        count = 1;
                      });
                    })
                    : Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        count == 1
                            ? InkWell(
                            onTap: () {
                              setState(() {
                                  for(var item in cartList){
                                    if(item["productId"]==snapshot.data!.id){
                                      cartList.remove(item);
                                    }
                                  }

                                Get.snackbar("remove product", "This product removed from the shopping cart");

                                count = 0;
                              });
                            },
                            child: Icon(
                              Icons.remove_shopping_cart_sharp,
                              color: Colors.red,
                            ))
                            : InkWell(
                            onTap: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                  for(var item in cartList){
                                    if(item["productId"]==snapshot.data!.id){
                                      item["quantity"] = count;
                                    }
                                  }
                                }
                              });
                            },
                            child: Icon(
                              Icons.minimize,
                              color: Colors.red,
                            )),
                        Text(
                          "$count",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                count++;
                                for(var item in cartList){
                                  if(item["productId"]==snapshot.data!.id){
                                    item["quantity"] = count;
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

              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator(),),
        body: snapshot.hasData
            ? SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),
                            )),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              //like
                            },
                            child:  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isLiked=!isLiked;
                                  });
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                     isLiked? Icons.favorite:Icons.favorite_border,
                                      color: Colors.red,
                                    )),
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 350,
                            child: PageView(
                              controller: pageController,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      snapshot.data!.image.toString()),
                                ),
                                Image(
                                  image: NetworkImage(
                                      snapshot.data!.image.toString()),
                                ),
                                Image(
                                  image: NetworkImage(
                                      snapshot.data!.image.toString()),
                                ),
                                Image(
                                  image: NetworkImage(
                                      snapshot.data!.image.toString()),
                                ),
                              ],
                            )),
                      ),
                      10.toHeight,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            // PageController
                            count: 4,
                            effect: const ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: 10,
                                spacing: 5,
                                activeDotColor: Color(0xff00ADB5),
                                dotColor: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                5.toHeight,
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                      snapshot.data!.category.toString(),
                      style: TextStyle(
                        color: Color(0xff00ADB5),
                          fontSize: 15,
                          ),
                ),
                   ),
                 ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: withd/1.1,
                        child: Text(
                          snapshot.data!.title.toString(),
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                10.toHeight,
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(snapshot.data!.rating!.rate.toString(), style: TextStyle(fontSize: 18)),
                          5.toWidth,
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(Icons.star_border,
                              color: Colors.yellow),
                        ],
                      ),
                      Text("(${snapshot.data!.rating!.count.toString()} review)",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                    ],
                  ),
                ),
                10.toHeight,
              snapshot.data!.category.toString() =="men's clothing" || snapshot.data!.category.toString() == "women's clothing" ?Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child: Text(
                           "Size : $_selectedSize",
                           maxLines: 2,
                           style: TextStyle(
                             fontSize: 18,
                           )
                       ),
                     ),
                   ),
                   5.toHeight,
                   Row(
                     children: [
                       10.toWidth,
                       ChoiceChip(
                         label: Text('  S  '),
                         shape: _selectedSize == 'S' ? StadiumBorder(side: BorderSide(color: Color(0xff00ADB5))):null,
                         selected: _selectedSize == 'S',
                         onSelected: (bool selected) {
                           setState(() {
                             _selectedSize = 'S';
                           });
                         },
                       ),
                       10.toWidth,
                       ChoiceChip(
                         label: Text('  M  '),
                         shape: _selectedSize == 'M' ? StadiumBorder(side: BorderSide(color: Color(0xff00ADB5))):null,

                         selected: _selectedSize == 'M',
                         onSelected: (bool selected) {
                           setState(() {
                             _selectedSize = 'M';
                           });
                         },
                       ),
                       10.toWidth,
                       ChoiceChip(
                         label: Text('  L  '),
                         shape: _selectedSize == 'L' ? StadiumBorder(side: BorderSide(color: Color(0xff00ADB5))):null,
                         selected: _selectedSize == 'L',
                         onSelected: (bool selected) {
                           setState(() {
                             _selectedSize = 'L';
                           });
                         },
                       ),
                       10.toWidth,
                       ChoiceChip(
                         label: Text(' XL '),
                         shape: _selectedSize == 'XL' ? StadiumBorder(side: BorderSide(color: Color(0xff00ADB5))):null,
                         selected: _selectedSize == 'XL',
                         onSelected: (bool selected) {
                           setState(() {
                             _selectedSize = 'XL';
                           });
                         },
                       ),
                       10.toWidth,
                       ChoiceChip(
                         label: Text('2XL'),
                         shape: _selectedSize == '2XL' ? StadiumBorder(side: BorderSide(color: Color(0xff00ADB5))):null,
                         selected: _selectedSize == '2XL',
                         onSelected: (bool selected) {
                           setState(() {
                             _selectedSize = '2XL';
                           });
                         },
                       ),
                     ],
                   ),
                 ],
               ):Container(),

                15.toHeight,

                /* ListTile(
              title: Text(
                "name product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              subtitle: Text("\$2160",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              trailing: Text("(120 review)",
                  style: TextStyle(fontSize: 17,)),
            ),*/
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(alignment: Alignment.centerLeft,child: Text("Product Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      maxLines: text ? 10 : 2,
                      softWrap: true,
                      text: TextSpan(
                          text:snapshot.data!.description.toString(),
                          style: GoogleFonts.getFont('Lato',color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,height: 1.3))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            text = !text;
                          });
                        },
                        child: Text(
                          text ? "Show less" : "Show more",
                          style: TextStyle(
                              color: Color(0xff00ADB5),
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                10.toHeight,
              ],
            ),
          ),
        )
            : Center(child: CircularProgressIndicator()),
      );
    },);
  }
}
