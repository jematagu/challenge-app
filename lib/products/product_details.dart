import 'package:flutter/material.dart';

import '../cart/cart_list.dart';
import '../home.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsPrice;
  final productDetailsPicture;

  const ProductDetails({
      Key? key,
      this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsPrice
  }): super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int quantity = 1;

  List<bool> selectedColor = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productDetailsName),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildCard(),
            flex: 5,
          ),
          Expanded(
            child: buildDescription(),
          ),
          Expanded(
            child: buildChoice(),
          ),
          Expanded(
            child: buildAddTo(),
          ),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xfdfdfdfd),
        ),
//        width: MediaQuery.of(context).size.width -50,
//        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset(
                  widget.productDetailsPicture,
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width - 80,
                ),
                padding: const EdgeInsets.all(20),
              ),
              flex: 6,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("\$${widget.productDetailsPrice}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xff36004f),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildColor(Color color, int i) {
    return InkWell(
      onTap: () {
        setState(() {
          for ( int j=0;j<selectedColor.length;j++){
            selectedColor[j] = false;
            if ( j == i )
              selectedColor[j] = true;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: selectedColor[i] ? const Icon(Icons.check, size: 15, color: Colors.white,) : null,
        decoration: ShapeDecoration(color: color, shape: const CircleBorder()),
        height: 20,
        width: 20,
      ),
    );
  }

  Widget buildChoice() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.grey,),
                  onPressed: () {
                    setState(() {
                      quantity = --quantity == 0 ? 1 : quantity;
                    });
                  }),
              Text(quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.grey,),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAddTo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: MaterialButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute( builder: (context) => const Home())
          ),

        child: const Text('Agregar al carrito',
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'SFUIDisplay',
            fontWeight: FontWeight.bold,
          ),
        ),
        color: const Color(0xffff2d55),
        elevation: 0,
        minWidth: 400,
        height: 20,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
      ),
      );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.0,
//        title: Text("Back to Shopping"),
//      ),
//      body: ListView(
//        children: <Widget>[
//          buildProduct(),
//          buildChoicesRow(),
//          buildBuyRow(),
//          Divider(),
//          buildDescription(),
//          Divider(),
//        ],
//      ),
//    );
//  }

  // TODO: Change text UI
  Widget buildProduct() {
    return Container(
      height: 200.0,
      child: GridTile(
        child: Container(
          color: Colors.white,
          child: Image.asset(
            widget.productDetailsPicture,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: Container(
          color: Colors.white,
          child: ListTile(
            leading: Text(widget.productDetailsName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text("\$${widget.productDetailsPrice}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChoicesRow() {
    return Container(
      color: const Color(0xffe5e3e3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: buildChoiceButton("Size"),
              margin: const EdgeInsets.all(5),
            ),
            flex: 3,
          ),
          Expanded(
              child: Container(
                child: buildChoiceButton("Color"),
                margin: const EdgeInsets.all(5),
              ),
              flex: 3),
          Expanded(
            child: Container(
              child: buildChoiceButton("Quantity"),
              margin: const EdgeInsets.all(5),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget buildChoiceButton(String text) {
    return MaterialButton(
      color: Colors.white,
      textColor: Colors.grey,
      elevation: 0.2,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            flex: 2,
          ),
          const Expanded(child: Icon(Icons.arrow_drop_down))
        ],
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(text),
                content: Text("Choose the $text"),
                actions: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    child: const Text("close"),
                  )
                ],
              );
            });
      },
    );
  }

  Widget buildBuyRow() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: const Text("Buy now"))),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.pink,
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.favorite_border),
              color: Colors.pink,
              onPressed: () {})
        ],
      ),
    );
  }

  Widget buildDescription() {
    return const ListTile(
      title: Text("Details"),
      subtitle: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"),
    );
  }
}