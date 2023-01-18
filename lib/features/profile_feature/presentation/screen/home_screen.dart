import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Column(
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
                        onPressed: () {},
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
              Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: 160,
                  height: 170,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/image6.jpg'))),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Set new profile',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff00ADB5), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: Icon(Icons.add_a_photo_outlined),
                    ),
                  )
                ],
              ),
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
                onPressed: () {},
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
                          ' Account information',
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
                      'Latest purchases',
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
          ),
        ),
      ),
    );
  }
}
