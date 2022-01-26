import 'package:flutter/material.dart';

class CartElement extends StatefulWidget {

  final productId;
  final productName;
  final productPicture;
  final productQuantity;
  final productPrice;

  CartElement({
    this.productId,
    this.productName,
    this.productPicture,
    this.productQuantity,
    this.productPrice
  });
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<CartElement> {

  @override
  Widget build(BuildContext context) {
    final image = widget.productPicture;
    final title = widget.productName;
    int quantity = widget.productQuantity;
    final price = widget.productPrice;

    final cardIcon = Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(
          vertical: 10.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: Image.asset(
        image,
        height: 70,
      ),
    );

    var cardText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              child: Text(title),
              padding: const EdgeInsets.only(bottom: 15.0),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           IconButton(
        //             icon: const Icon(Icons.remove_circle_outline, color: Colors.grey,),
        //             onPressed: () {
        //               setState(() {
        //                 quantity = --quantity == 0 ? 1 : quantity;
        //               });
        //           }),
        //           Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        //           IconButton(
        //             icon: const Icon(Icons.add_circle_outline, color: Colors.grey,),
        //             onPressed: () {
        //               setState(() {
        //                 quantity++;
        //               });
        //           }),
        //         ],
        //       ),
        //     ),
        //     Column(
        //       children: [
        //         Padding(
        //           child: Text("\$$price"),
        //           padding: const EdgeInsets.only(bottom: 15.0),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),

      ],
    );

    return Card(
      margin: const EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: <Widget>[
          cardIcon,
          // cardText
        ],
      ),
    );
  }
}