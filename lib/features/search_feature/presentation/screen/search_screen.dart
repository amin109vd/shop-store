import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/color.dart';
import '../../../../core/utils/extention.dart';
import '../../../home_feauture/data/data_source/remote/api_provider.dart';
import '../../../home_feauture/data/model/ProductModel.dart';
import '../../../home_feauture/presentation/screens/category_product.dart';
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
  List iconCategory = ["assets/images/electronics.png","assets/images/jewelery.png","assets/images/men's clothing.png","assets/images/women's clothing.png"];
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
        backgroundColor: primaryColor,
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
          FutureBuilder(
            future: getcategory(),
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          10.toWidth,
                          Text("categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        ],
                      ),
                      5.toHeight,
                      Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:
                                (BuildContext context,index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryProduct(
                                            id: index,
                                            category: snapshot
                                                .data![index]
                                                .toString()),
                                  ));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Card(
                                          elevation: 0.9,
                                          color: Colors.grey.shade200,
                                          child: Column(
                                            children: [
                                              5.toHeight,
                                              SizedBox(
                                                height: 80,
                                                width: 80,
                                                child: Image.asset(iconCategory[index]),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Text(snapshot.hasData ? snapshot.data![index].toString() == "men's clothing" ? "Menswear" : snapshot.data![index].toString() == "women's clothing" ? "ladieswear" : snapshot.data![index].toString():"",style: TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.w500),)

                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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