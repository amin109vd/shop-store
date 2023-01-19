import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> index = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                  Text(
                    'My cart',
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 5),
              child: Row(
                children: [
                  Container(
                      child: Column(
                    children:
                      getFilterchips(),

                  )),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/image5.jpg'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text(
                          'AIR JORDAN XXXV1 ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          ' "psichic Energy"',
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            '\$140,000',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getFilterchips() {
    List<Widget> chips = [];
    for (int i = 1; i <= 1; i++) {
      int randomlable = Random().nextInt(19000);
      Widget item = FilterChip(
        pressElevation: 5,
        showCheckmark: false,
        avatar: index.contains(i)
            ? Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green)
            : null,
        label: Container(),
        onSelected: (value) {
          setState(() {
            if (index.contains(i)) {
              index.remove(i);
            } else {
              index.add(i);
            }
          });
        },
        selected: index.contains(i),
      );
      chips.add(item);
    }
    return chips;
  }
}
