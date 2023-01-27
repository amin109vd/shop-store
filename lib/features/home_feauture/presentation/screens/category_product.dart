import 'package:flutter/material.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key, required this.category,required this.id}) : super(key: key);
  final category;
  final id;

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: getServerProductCategory(widget.category),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: snapshot.hasData ? AppBar(
            backgroundColor: Color(0xff00ADB5),
            title: Text(snapshot.data![0].category.toString()),
          ):null,
            body: snapshot.hasData
                ? ListView.separated(
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
                                            width: width / 4,
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
                                          width: width / 1.5,
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
                  )
                : Center(child: CircularProgressIndicator()));
      },
    );
  }
}
