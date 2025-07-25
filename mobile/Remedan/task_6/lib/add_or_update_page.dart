import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddOrUpdatePage extends StatefulWidget {
  const AddOrUpdatePage({super.key});

  @override
  State<AddOrUpdatePage> createState() => _AddOrUpdatePageState();
}

class _AddOrUpdatePageState extends State<AddOrUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product")),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                Container(
                  width: 366,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(243, 243, 243, 1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined, size: 48),
                        SizedBox(height: 20),
                        Text(
                          "Upload Image",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(62, 62, 62, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text("name"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(243, 243, 243, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            width: 2,
                          ),
                        ), //rgba(243, 243, 243, 1)
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text("catagory"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,

                        fillColor: Color.fromRGBO(243, 243, 243, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            width: 2,
                          ),
                        ), //rgba(243, 243, 243, 1)
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text("Price"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(243, 243, 243, 1),
                        suffixIcon: Text("\$"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text("description"),
                    ),
                    TextField(
                      maxLines: 10,
                      minLines: 6,
                      decoration: InputDecoration(
                        filled: true,

                        fillColor: Color.fromRGBO(243, 243, 243, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // So it only takes as much vertical space as needed
          children: [
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Color.fromRGBO(63, 81, 243, 1),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text("Add"),
              ),
            ),

            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red, width: 1),
                ),
                onPressed: () {},
                child: Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
