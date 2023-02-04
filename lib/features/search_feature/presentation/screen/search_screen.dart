import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/color.dart';
import '../../../../core/utils/extention.dart';
import '../../../home_feauture/data/data_source/remote/api_provider.dart';
import '../../../home_feauture/data/model/ProductModel.dart';
import '../../../home_feauture/presentation/screens/product_detail.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String baseUrl = "https://your-api-url.com/api";
  TextEditingController _searchController = TextEditingController();
  late Future<List<ProductModel>> _future;
  List<ProductModel> _products = [];

  @override
  void initState() {
    super.initState();
    _future = getServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              _future = getServer();
              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _filterProducts(value);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  return ListView.separated(
                    itemCount: _products.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: _products[index].id,),));
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                            width: width(context) / 4,
                                            height: 150 / 1.2,
                                            child: Image.network(
                                              _products[index].image
                                                  .toString(),
                                            ))),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: SizedBox(
                                          width: width(context) / 1.5,
                                          child: Text(
                                            _products[index].title
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "\$${_products[index].price}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        5.toWidth,
                                        Text(_products[index].rating!.rate.toString(), style: TextStyle(fontSize: 16)),


                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child:  LoadingAnimationWidget.threeRotatingDots(
                        color: primaryColor, size: 50),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _filterProducts(String searchTerm) {
    _products.clear();
    if (searchTerm.isEmpty) {
      setState(() {});
      return;
    }
    _future.then((list) {
      for (var product in list) {
        if (product.title!.toLowerCase().contains(searchTerm.toLowerCase())) {
          _products.add(product);
        }
      }
      setState(() {});
    });
  }}