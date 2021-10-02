import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/services/apiService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  ProductDetails(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
          future: ApiServices().getSingelPosts(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        snapshot.data['image'],
                        height: 240,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "\$" + snapshot.data['price'].toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data['title'],
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Chip(
                        label: Text(
                          snapshot.data['category'].toString(),
                          style: TextStyle(
                            fontSize: 19.5,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data['description'],
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ));
            }
            return Center(
              child: SpinKitChasingDots(
                color: Colors.white,
                size: 100.0,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }
}
