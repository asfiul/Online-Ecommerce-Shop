import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/screens/cart.dart';
import 'package:online_ecommerce_shop/screens/categories.dart';
import 'package:online_ecommerce_shop/screens/product_details.dart';
import 'package:online_ecommerce_shop/services/apiService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.list_alt),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Categories()),
                );
              }),
          IconButton(
              icon: Icon(Icons.add_shopping_cart_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartlist()),
                );
              })
        ],
      ),
      //Api Builder methods
      body: FutureBuilder(
        future: ApiServices().getAllPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['title']),
                      leading: Image.network(
                        snapshot.data[index]['image'],
                        height: 220,
                        width: 130,
                      ),
                      subtitle: Text("Price- \$" +
                          snapshot.data[index]['price'].toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                    snapshot.data[index]['id'])));
                      },
                    );
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
    );
  }
}
