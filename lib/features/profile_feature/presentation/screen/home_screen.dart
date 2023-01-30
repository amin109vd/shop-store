import 'package:flutter/material.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/Support.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/favorite.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/order.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/profile.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/setting.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/wallet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children:[ Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: const Color(0xff00ADB5), // foreground
                        ),
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(Icons.notifications_active_outlined),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 20),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: const Color(0xff00ADB5), // foreground
                        ),
                        onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SettingPage()));},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(Icons.settings),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10)),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/image6.jpg'))),
                    ),

                  ],
                ),
              ),SizedBox(height: 50,),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                  width: double.infinity,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profile()),
                );},
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text(
                          ' Profile',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Wallet()),
                );},
                child: Row(
                  children: [
                    Icon(
                      Icons.wallet_rounded,
                      color: Colors.black,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text(
                          'My Wallet',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Order(

                  )),
                );},
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text(
                          'Order',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                );},
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text(
                          'Favorites',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Support()),
                );},
                child: Row(
                  children: [
                    Icon(
                      Icons.support_agent,
                      color: Colors.black,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text(
                          'Support',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amazing discount',
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
                        onPressed: () {},
                        child: Text('See more'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 220,
                child: Center(
                  child: ListView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext contxt, int pos) {
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
                                onPrimary:
                                const Color(0xff00ADB5), // foreground
                              ),
                              onPressed: () {},

                              child: Image(image: AssetImage(
                                  'assets/images/image2.jpg')),


                            ));
                      }),
                ),
              )
            ],
          ),]
        ),
      ),
    );
  }
}
