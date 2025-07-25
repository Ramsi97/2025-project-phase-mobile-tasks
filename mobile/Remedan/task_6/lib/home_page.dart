import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_6/add_or_update_page.dart';
import 'package:task_6/search.dart';

import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Yohannes";
  String formattedDate = DateFormat('MMMM, dd yyyy').format(DateTime.now());

  List<GestureDetector> _buildCardWidget(int count) {
    return List.generate(count, (int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detail()),
          );
        },
        child: Card(
          child: Column(
            children: [
              Image.asset("images/shoes.png"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Derby Leather Shoes",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(62, 62, 62, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$120",
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
                      "Men’s shoe",
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 10),
                      ),
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
    });
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Search()),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),

            SizedBox(height: 10),

            Expanded(child: ListView(children: _buildCardWidget(3))),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrUpdatePage()),
          );
        },
        backgroundColor: Color.fromRGBO(63, 81, 243, 1), //rgba(63, 81, 243, 1)
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 36.0, color: Colors.white),
      ),
    );
  }
}
