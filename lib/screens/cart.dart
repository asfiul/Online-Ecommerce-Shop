import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/services/apiService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class cartlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart List"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiServices().getCart(1),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return Center(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: ApiServices()
                            .getSingelPosts(products[index]['productId']),
                        builder: (context, AsyncSnapshot asyncSnapshot) {
                          if (asyncSnapshot.hasData) {
                            return ListTile(
                              title: Text(asyncSnapshot.data['title']),
                              leading: Image.network(
                                asyncSnapshot.data['image'],
                                height: 40,
                              ),
                              subtitle: Text("Quantity - " +
                                  products[index]['quantity'].toString()),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }
                          return LinearProgressIndicator();
                        });
                  }),
            );
          }
          return Center(
            child: SpinKitChasingDots(
              color: Colors.white,
              size: 100.0,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text('Order Now'),
        ),
      ),
    );
  }
}
