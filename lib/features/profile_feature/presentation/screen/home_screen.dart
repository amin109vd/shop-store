import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shoppstore/config/color.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/Support.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/favorite.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/order.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/profile.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/setting.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/wallet.dart';

import '../../../home_feauture/presentation/screens/discount_product.dart';
import '../../../home_feauture/presentation/screens/product_detail.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(children: [
          10.toHeight,
          Container(
            height: height(context) / 10,
            child: Row(
              children: [
                5.toWidth,
                imagefile == null
                    ? CircleAvatar(
                  backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/image/human-face-icon-29.jpg'),
                        radius: 30,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(File(imagefile!.path)),
                        radius: 30,
                      ),
                10.toWidth,
                Text(
                  "amin2093",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_rounded,
                        size: 30,
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 10,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text("2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13)),
                        ))
                  ],
                )
              ],
            ),
          ),
          10.toHeight,
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profile()),
              ).then((value) {
                setState(() {
                  imagefile = value;
                });
              });
            },
            leading: Icon(Icons.person_outline_outlined),
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingPage()));
            },
            leading: Icon(Icons.settings),
            title: Text("Setting"),
          ),
          10.toHeight,
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Wallet()),
              );
            },
            leading: Icon(Icons.wallet_rounded),
            title: Text("My Wallet"),
          ),
          10.toHeight,
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Order()),
              );
            },
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text("Order"),
          ),
          10.toHeight,
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
            },
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
          10.toHeight,
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Support()),
              );
            },
            leading: Icon(Icons.support_agent),
            title: Text("Support"),
          ),
          10.toHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amazing discount',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff00ADB5), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DiscountProduct()));
                    },
                    child: Text('See more'),
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: getServer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.hasError){
                  return Column(
                    children: [
                      70.toHeight,
                      Text("network error"),
                    ],
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    child: Center(
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    id: snapshot.data![index].id,
                                    discount: true,
                                  ),
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 300,
                                width: 150,
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
                              ),
                            );
                          }),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    70.toHeight,
                    LoadingAnimationWidget.beat(
                        color: primaryColor, size: 20.0),
                  ],
                );
              }
            },
          ),
          20.toHeight,
        ]),
      ),
    );
  }
}

var image;
