import 'package:flutter/material.dart';
import 'package:task_6/add_or_update_page.dart';
import 'detail.dart';
import 'home_page.dart';

class Search extends StatefulWidget {
  const Search({super.key, Object? args});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
    final args = ModalRoute.of(context)!.settings.arguments;
    final homepage = HomePageState();
    if (args is List<Product>) {
      return Scaffold(
        appBar: AppBar(title: Text("Search Product")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ), // Default (not focused)
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),

                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(63, 81, 243, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,

                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                          builder: (context) {
                            return FractionallySizedBox(
                              heightFactor: 0.5,
                              child: FilterBottomSheet(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: args.length,
                  itemBuilder: (context, index) {
                    final product = args[index];
                    return homepage.createCardWidget(product);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Search")),
        body: Center(child: Text("No products found.")),
      );
    }
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _currentRangeValues = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Catagory",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ), // Default (not focused)
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "Price",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color.fromRGBO(63, 81, 243, 1),
                thumbColor: Color.fromRGBO(63, 81, 243, 1),
                valueIndicatorColor: Color.fromRGBO(63, 81, 243, 1),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 20,
                labels: RangeLabels(
                  '\$${_currentRangeValues.start.round()}',
                  '\$${_currentRangeValues.end.round()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 44,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(63, 81, 243, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Apply",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
