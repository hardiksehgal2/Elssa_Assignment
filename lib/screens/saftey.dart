import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SafetyMeasures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Black row
              Container(
                height: 80,
                color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Best-in Class Safety Measures',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Blue row - Usage of Masks
              Container(
                color: Colors.lightBlue[50], // Lightest blue background color
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.lightBlue[50], // Lightest blue background color
                      padding: EdgeInsets.only(right: 20),
                      child: Image.asset(
                        'assets/images/mask.png',
                        width: 90,
                        height: 65,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Usage of Masks',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500], // Light gray color
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Blue row - Low-Contact Service Experience
              Container(
                color: Colors.lightBlue[50], // Lightest blue background color
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.lightBlue[50], // Lightest blue background color
                      padding: EdgeInsets.only(right: 20),
                      child: Image.asset(
                        'assets/images/people.png',
                        width: 90,
                        height: 65,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Low-Contact Service Experience',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500], // Light gray color
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // White row with text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: 180,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '''HASSLE FREE''',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[200],
                            ),
                          ),
                          "QUALITY SERVICE".text.gray200.xl4.bold.make().px16()
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
