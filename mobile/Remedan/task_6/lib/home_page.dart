import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_6/add_or_update_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Yohannes";
  String formattedDate = DateFormat('MMMM, dd yyyy').format(DateTime.now());

  List<Product> products = [];

  GestureDetector _createCardWidget(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/detail", arguments: product);
      },
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12), // 👈 Curve only top corners
              ),
              child: Image.file(
                File(product.imagefile),
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.catagory,
                    style: TextStyle(color: Color.fromRGBO(170, 170, 170, 10)),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "(4.0)",
                        style: TextStyle(
                          color: Color.fromRGBO(170, 170, 170, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoAddProduct() async {
    final result = await Navigator.pushNamed(context, "/addOrUpdate");

    if (result is Product) {
      setState(() {
        products.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage("images/ein.jpg"),
                        ),
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: Color.fromARGB(1000, 170, 170, 170),
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Hello, ",
                              style: TextStyle(
                                color: Color.fromARGB(1000, 170, 170, 170),
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available Product",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(62, 62, 62, 50),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/search");
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _createCardWidget(product);
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _gotoAddProduct,
        backgroundColor: Color.fromRGBO(63, 81, 243, 1),
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 36.0, color: Colors.white),
      ),
    );
  }
}
