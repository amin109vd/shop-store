import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/category_product.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/discount_product.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/mos_poular.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getServer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              controller: pageController,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, right: 70),
                                child: Text(
                                  'Discover',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Find anythig what you want',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black38),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 50),
                            child: Container(
                              decoration: BoxDecoration(
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 30, right: 30),
                              child: Container(
                                decoration: BoxDecoration(

                                ),
                                child: Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/image5.jpg'))),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Text(
                                        'Discounts',
                                        style: TextStyle(
                                            fontSize: 23, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(
                                              0xff00ADB5), // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiscountProduct()));
                                        },
                                        child: Text('See more'),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 170, bottom: 50),
                                  child: Container(
                                    width: 55,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff00ADB5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        '-50%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: getcategory(),
                        builder: (context, snapshot) {

                       return snapshot.hasData? Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            child: Center(
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int pos) {
                                    return Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: const Color(0xff00ADB5),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white, // background
                                            onPrimary: const Color(
                                                0xff00ADB5), // foreground
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryProduct(id: pos,category: snapshot.data![pos].toString()),));

                                          },
                                          child: Container(
                                            child: Text(snapshot.data![pos].toString()),
                                          ),
                                        ));
                                  }),
                            ),
                          ),
                        ):Container();
                      },),
                      Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                'Flash Sale',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 80),
                            child: Text(
                              'Closing in:',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.all(Radius.zero)),
                              child: Text(
                                '08',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.all(Radius.zero)),
                              child: Text(
                                '25',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.all(Radius.zero)),
                              child: Text(
                                '16',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          width: double.infinity,
                          height: 220,
                          child: Center(
                            child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int pos) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![pos].id,),));
                                    },
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      child: Card(
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 130,
                                              width: 130,
                                              child: Image(
                                                  image: NetworkImage(snapshot
                                                      .data![pos].image
                                                      .toString())),
                                            ),
                                            10.toHeight,
                                            Text(
                                              snapshot.data![pos].title
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            5.toHeight,
                                            Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$${snapshot.data![pos].price}"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                      20.toHeight,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'most pupular',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color(0xff00ADB5), // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MostPopular(),));
                                },
                                child: Text('See more'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          height: 220,
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: snapshot.data!.length-5,
                           itemBuilder: (context, index) {
                           return GestureDetector(
                             onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index+5].id),));

                             },
                             child: Container(
                               height: 300,
                               width: 150,
                               child: Card(
                                 elevation: 0,
                                 color: Colors.transparent,
                                 child: Column(
                                   children: [
                                     SizedBox(
                                       height: 130,
                                       width: 130,
                                       child: Image(
                                           image: NetworkImage(snapshot
                                               .data![index+5].image
                                               .toString())),
                                     ),
                                     10.toHeight,
                                     Text(
                                       snapshot.data![index+5].title.toString(),
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                       style: TextStyle(
                                           color: Colors.black, fontSize: 15),
                                     ),
                                     5.toHeight,
                                     Spacer(),
                                     Row(
                                       children: [
                                         Text(
                                           "\$${snapshot.data![index+5].price}"
                                               .toString(),
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600,
                                               color: Colors.black,
                                               fontSize: 18),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           );
                         },),
                        ),
                      ),
                      100.toHeight,
                    ],
                  ),
                );
          } else {
            return Center(
                  child: CircularProgressIndicator(),
                );
          }
        },
      ),
    );
  }
}
