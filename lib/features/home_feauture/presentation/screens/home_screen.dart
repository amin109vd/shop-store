import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shoppstore/config/color.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/category_product.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/discount_product.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/most_popular.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';
import 'dart:async';
import '../../data/model/ProductModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _hours = 8;
  int _minutes = 0;
  int _seconds = 0;
  late Timer _timer;
  @override
  late Future<List<ProductModel>> _future;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _future = getServer();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else if (_minutes > 0) {
          _minutes--;
          _seconds = 59;
        } else if (_hours > 0) {
          _hours--;
          _minutes = 59;
          _seconds = 59;
        } else {
          timer.cancel();
        }
      });
    });
    }


  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _future = getServer();
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _future = getServer();
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
List iconCategory = ["assets/images/electronics.png","assets/images/jewelery.png","assets/images/men's clothing.png","assets/images/women's clothing.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.data!.isEmpty||snapshot.data==null) {
              return SmartRefresher(
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                header: WaterDropMaterialHeader(
                  color: Colors.white,
                  backgroundColor: primaryColor,
                ),
                controller: _refreshController,
                child: Center(
                  child: Text("please chek your interner and try again"),
                ),
              );
            }
            return SmartRefresher(
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              header: WaterDropMaterialHeader(
                color: Colors.white,
                backgroundColor: primaryColor,
              ),
              controller: _refreshController,
              child: SingleChildScrollView(
                controller: pageController,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(),
                      height: height(context) / 4,
                      width: width(context),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/image5.jpg'))),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                              child: Container(
                            width: width(context),
                            height: 90,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black54,
                                Colors.transparent,

                              ])
                            ),
                          )),
                          Positioned(
                            right: 10,
                            bottom: 15,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: InkWell(

                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DiscountProduct()));
                                },
                                child: Text('See more>>',style: TextStyle(color: primaryColor),),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            bottom: 20,

                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 0),
                              child: Text(
                                '50% off',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10,right: 20),
                        child: Text(
                          'Flash Sale',
                          style: TextStyle(
                              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 80),
                          child: Text(
                            'Closing in:',
                            style: TextStyle(color: Colors.black38, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.all(Radius.zero)),
                            child: Text(
                              '$_hours',
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
                              '$_minutes',
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
                              '$_seconds',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
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
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                        id: snapshot.data![pos].id,
                                      ),
                                    ));
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
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff00ADB5), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MostPopular(),
                                ));
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                      id: snapshot.data![index + 5].id),
                                ));
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
                                                .data![index + 5].image
                                                .toString())),
                                      ),
                                      10.toHeight,
                                      Text(
                                        snapshot.data![index + 5].title
                                            .toString(),
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
                                            "\$${snapshot.data![index + 5].price}"
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
                          },
                        ),
                      ),
                    ),
                    100.toHeight,
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.threeRotatingDots(
                  color: primaryColor, size: 50),
            );
          }
        },
      ),
    );
  }
}
