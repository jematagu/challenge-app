import 'package:flutter/material.dart';
import 'package:untitled/cart/cart_element.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<CartList> {
  var productList = [
    {
      "id": "1",
      "name": "Women Bag",
      "picture": "img/products/womenbag.png",
      "price": 85.99,
      "quantity" : 2
    },
    {
      "id": "2",
      "name": "Blazzer1",
      "picture": "img/products/blazer1.jpeg",
      "price": 85,
      "quantity" : 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Carrito'),
    ),
    body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return CartElement(
            productId: productList[index]['id'],
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productPrice: productList[index]['price'],
            productQuantity: productList[index]['quantity'],
          );
        }));
  }
}