import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/services/apiService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'categorieslist.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
          future: ApiServices().getAllcategories(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoriesAllList(snapshot.data[index])));
                      },
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Container(
                          padding: EdgeInsets.all(40),
                          child: Center(
                            child: Text(
                              snapshot.data[index].toString().toUpperCase(),
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            return Center(
              child: SpinKitChasingDots(
                color: Colors.white,
                size: 100.0,
              ),
            );
          }),
    );
  }
}
