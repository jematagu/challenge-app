import 'package:flutter/material.dart';
import 'package:untitled/products/products_element.dart';
import 'dart:async';

import '../FetchData.dart';
import '../models/product_entity.dart';


class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late Future<List<ProductsEntity>> futureProductList;

  @override
  void initState() {
    super.initState();
    futureProductList = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ProductsEntity>>(
        future: futureProductList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductsEntity>? data = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text("Productos"),
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xffff2d55),
                ),
                body:
              GridView.builder(
                itemCount: data?.length,
                gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (BuildContext context, int index) {
                  return ProductElement(
                    productName: data![index].name,
                    productPicture: data[index].picture,
                    productPrice: data[index].price,
                  );
                })
            );
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Icon(Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',);
        });
      }}