import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddOrUpdatePage extends StatefulWidget {
  const AddOrUpdatePage({super.key});

  @override
  State<AddOrUpdatePage> createState() => _AddOrUpdatePageState();
}

class _AddOrUpdatePageState extends State<AddOrUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _catagoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product")),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: _imageFile == null
                      ? Center(
                          child: Container(
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
                        )
                      : Center(
                          child: Image.file(
                            File(_imageFile!.path),
                            height: 190,
                          ),
                        ),
                ),

                // image accepter form
                SizedBox(height: 10),

                Text(
                  "name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _nameController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "invalid";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                Text(
                  "Catagory",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _catagoryController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "invalid";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Text(
                  "Price",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _priceController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter price";
                    }

                    if (int.tryParse(value) == null) {
                      return "Please enter only integers";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                Text(
                  "description",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _descriptionController,
                  minLines: 5,
                  maxLines: 15,
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
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                onPressed: () {
                  if (_formKey.currentState!.validate() && _imageFile != null) {
                    final product = Product(
                      name: _nameController.text,
                      catagory: _catagoryController.text,
                      price: double.parse(_priceController.text),
                      description: _descriptionController.text,
                      imagefile: _imageFile!.path,
                    );
                    Navigator.pop(context, product);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please complete all fields and pick an image",
                        ),
                      ),
                    );
                  }
                },
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
                onPressed: () {
                  _formKey.currentState!.reset();
                  setState(() {
                    _imageFile = null;
                  });
                },
                child: Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String catagory;
  final double price;
  final String description;
  final String imagefile;

  Product({
    required this.name,
    required this.catagory,
    required this.price,
    required this.description,
    required this.imagefile,
  });
}
