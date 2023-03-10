import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';

import '../../../../config/color.dart';
import '../../data/model/ProductModel.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key, required this.category,required this.id}) : super(key: key);
  final category;
  final id;

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
   late Future<List<ProductModel>> _future;
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _future = getServerProductCategory(widget.category);
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _future = getServerProductCategory(widget.category);
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _future = getServerProductCategory(widget.category);
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: snapshot.hasData ? AppBar(
            backgroundColor: Color(0xff00ADB5),
            title: Text(snapshot.data![0].category.toString()),
          ):null,
            body: buildBody(snapshot, context));
      },
    );
  }
  buildBody(snapshot,context){
    if (snapshot.connectionState == ConnectionState.done) {
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
        child: ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 4),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index].id,),));
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
                                      snapshot.data![index].image
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
                                    snapshot.data![index].title
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
                                  "\$${snapshot.data![index].price}",
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
                                Text(snapshot.data![index].rating!.rate.toString(), style: TextStyle(fontSize: 16)),


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
          ),

      );
    }else {
      return Center(
        child: LoadingAnimationWidget.threeRotatingDots(
            color: primaryColor, size: 50),
      );
    }
}}
