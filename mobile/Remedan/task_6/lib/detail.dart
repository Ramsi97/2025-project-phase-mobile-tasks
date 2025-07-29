import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_6/add_or_update_page.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is Product) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.file(
                    File(args.imagefile),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args.catagory,
                      style: const TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1), // Fixed alpha
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(
                          "(4.0)",
                          style: TextStyle(
                            color: Color.fromRGBO(
                              170,
                              170,
                              170,
                              1,
                            ), // Fixed alpha
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sora',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1), // Fixed alpha
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      "\$${args.price}",
                      style: const TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1), // Fixed alpha
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  args.description,
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(
                width: 152,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: Colors.red,
                    side: BorderSide(
                      color: Colors.red, // 🔹 Border color
                      width: 1, // Optional: border thickness
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Delete"),
                ),
              ),

              SizedBox(width: 16),
              SizedBox(
                width: 152,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color.fromRGBO(
                      63,
                      81,
                      243,
                      1,
                    ), //rgba(63, 81, 243, 1)
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
