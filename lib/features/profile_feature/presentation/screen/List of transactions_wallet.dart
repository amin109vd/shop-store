import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class ListoftransactionsWallet extends StatefulWidget {
  const ListoftransactionsWallet({Key? key}) : super(key: key);

  @override
  State<ListoftransactionsWallet> createState() =>
      _ListoftransactionsWalletState();
}

class _ListoftransactionsWalletState extends State<ListoftransactionsWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xff00ADB5),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'There are no transactions',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
