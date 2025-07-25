import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int _index = -1;

  List<GestureDetector> _listNumber(int size) {
    return List.generate(size, (index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _index = index;
          });
        },
        child: Card(
          color: _index == index
              ? Color.fromRGBO(63, 81, 243, 1)
              : Colors.white,
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "${39 + index}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    color: index == _index ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                "images/shoes2.png",
                height: 286,
                width: 430,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 8, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Men’s shoe",
                    style: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1), // Fixed alpha
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
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
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Derby Leather Shoes",
                    style: TextStyle(
                      color: Color.fromRGBO(62, 62, 62, 1), // Fixed alpha
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    "\$120",
                    style: TextStyle(
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
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                "Size:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: _listNumber(6)),
            ),

            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",

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
  }
}
