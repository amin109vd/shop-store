import 'package:flutter/material.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/home_feauture/data/data_source/remote/api_provider.dart';
import 'package:shoppstore/features/home_feauture/presentation/screens/product_detail.dart';
import 'package:shoppstore/features/home_feauture/presentation/widget/product_card.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getServer(),
      builder: (context, snapshot) {

        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff00ADB5),
              title: const Text("Most Popular"),
            ),
            backgroundColor: Colors.white,
            body: snapshot.hasData
                ? GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: (150 / 220),
              children: List.generate(snapshot.data!.length-5, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: snapshot.data![index+5].id,),));
                      },
                      child:Container(
                        padding: EdgeInsets.all(10),
                        height: 300,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.black12)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 150,
                              width: 130,
                              child: Image(
                                  image: NetworkImage(snapshot.data![index+5].image.toString())),
                            ),
                            10.toHeight,
                            Text(
                              snapshot.data![index+5].title.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.w500),
                            ),
                            5.toHeight,
                            Spacer(),
                            Text(
                              "\$${snapshot.data![index+5].price!/2}"
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      )
                  ),
                );
              }),
            )
                : Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }
}
