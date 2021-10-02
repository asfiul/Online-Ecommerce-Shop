import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/screens/product_details.dart';
import 'package:online_ecommerce_shop/services/apiService.dart';

class CategoriesAllList extends StatelessWidget {
  final String categoryName;
  CategoriesAllList(this.categoryName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: ApiServices().getCategorieslist(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 220,
                      width: 130,
                    ),
                    subtitle: Text(
                        "Price- \$" + snapshot.data[index]['price'].toString()),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(snapshot.data[index]['id'])));
                    },
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
