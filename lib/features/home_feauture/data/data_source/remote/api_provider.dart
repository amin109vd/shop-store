  import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppstore/core/utils/constants.dart';
import 'package:shoppstore/features/home_feauture/data/model/ProductModel.dart';
import 'package:shoppstore/features/home_feauture/data/model/Singleproduct.dart';
final String baseUrl = Constants.baseUrl;
Future<List<ProductModel>> getServer() async {
      List<ProductModel> list = [];
      try {
        var responds = await Dio().get("$baseUrl/products");
        for (var res in responds.data) {
          ProductModel model = ProductModel.fromJson(res);
          list.add(model);
        }
      } catch (e) {
        debugPrint("$e");
      }
      return list;
    }

  Future<List> getcategory() async {
    List list = [];
    try {
      var responds = await Dio().get("$baseUrl/products/categories");
      for (var res in responds.data) {
        list.add(res);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return list;
  }
  Future<Singleproduct> getSingleServer(id) async {


      var responds = await Dio().get("$baseUrl/products/$id");
      Singleproduct model = Singleproduct.fromJson(responds.data);
    return model;
  }