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
                  onTap: () {},
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
                ),

                _imageFile != null
                    ? Image.file(File(_imageFile!.path), height: 150)
                    : Text("No image selected"),
                TextButton(onPressed: _pickImage, child: Text("Pick Image")),

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
                      return "invalid";
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

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid";
                    }
                    return null;
                  },
                ),

                // updated until this
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
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
