import 'package:flutter/material.dart';
import 'package:shoppstore/config/color.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/extention.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = "Credit/Debit Card";

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
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Payment"),
      ),
      body: ListView(
        children: [
          5.toHeight,
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<String>(
                        value: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                        items: <String>[
                          "Credit/Debit Card",
                          "PayPal",
                          "wallet"
                        ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  if (_selectedPaymentMethod == "Credit/Debit Card")
                    CreditCardForm(),
                  if (_selectedPaymentMethod == "PayPal")
                    PayPalForm(),
                  if (_selectedPaymentMethod == "wallet")
                    WalletForm(),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          5.toHeight,
          SizedBox(

            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  10.toHeight,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("discount code",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

                      maxLength: 6,
                      decoration: InputDecoration(
                        counterText: "",
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.add),
                        ),
                        hintText: "Add discount code",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  10.toHeight
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
                                    fontWeight: FontWeight.w500,

                                    fontSize: 18),
                              ),
                              Divider(
                                height: 2,

                              ),
                              10.toHeight,
                              Text(
                                "discounts :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                    fontSize: 18),
                              ),
                              10.toHeight,
                              Text(
                                "price :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                    fontSize: 18),
                              ),
                              10.toHeight,
                              Text(
                                "delivery price :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,

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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              10.toHeight,
                              Text("\$${calculateSubtotal(cartList).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              10.toHeight,
                              Text("\$15",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
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
                                fontWeight: FontWeight.w600,

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
          10.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: (){},child: Text("You can also pay upon delivery",style: TextStyle(color: primaryColor, fontSize: 14),)),
            ],
          )
        ],
      ),
    );
  }
}

class CreditCardForm extends StatefulWidget {
  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
          children: <Widget>[
      TextFormField(
      decoration: InputDecoration(labelText: "Card Number"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your card number";
        }
        return null;
      },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: "Expiry Date"),
    validator: (value) {
    if (value!.isEmpty) {
    return "Please enter the expiry date";
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: "CVC"),
    validator: (value) {
    if (value!.isEmpty) {
    return "Please enter the CVC";
    }
    return null ;}),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child:BuildElevatedButton(onPressed: () {
      if (_formKey.currentState!.validate()) {
// Process payment
      }
    },)
    ),
    ]),
    );
    }
  }
class PayPalForm extends StatefulWidget {
  @override
  _PayPalFormState createState() => _PayPalFormState();
}

class _PayPalFormState extends State<PayPalForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: BuildElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
// Process payment
              }
            },)
          ),
        ],
      ),
    );
  }
}
class WalletForm extends StatefulWidget {
  const WalletForm({Key? key}) : super(key: key);

  @override
  State<WalletForm> createState() => _WalletFormState();
}

class _WalletFormState extends State<WalletForm> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Wallet balance",style: TextStyle(fontSize: 20,color: Colors.black),),
            Text("\$122.34",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
          ],
        ),
        10.toHeight,
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [InkWell(onTap: (){},child: Text("Increase wallet balance>>",style: TextStyle(color: primaryColor, fontSize: 14),))],),
        40.toHeight,
        BuildElevatedButton(onPressed: (){})


      ],
    );
  }
}


class BuildElevatedButton extends StatefulWidget {
  const BuildElevatedButton({Key? key,required this.onPressed, this.title="Pay"}) : super(key: key);
final onPressed;
final title;
  @override
  State<BuildElevatedButton> createState() => _BuildElevatedButtonState();
}

class _BuildElevatedButtonState extends State<BuildElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: primaryColor,minimumSize: Size(width(context), 50),textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
      onPressed: widget.onPressed,
      child: Text(widget.title),
    );
  }
}
