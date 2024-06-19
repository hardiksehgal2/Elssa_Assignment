import 'package:flutter/material.dart';

class OtherServices extends StatelessWidget {
  final List<String> popularServicesImages = [
    'assets/kitchen_cleaning.jpg',
    'assets/sofa_cleaning.jpg',
    'assets/full_house_cleaning.jpg',
    // Add more image paths if needed
  ];

  final List<String> cleaningServicesImages = [
    'assets/kitchen.jpg',
    'assets/washroom_cleaning.jpg',
    'assets/paint.jpg',
    // Add more image paths if needed
  ];

  final List<String> popularServicesText = [
    'Kitchen Cleaning',
    'Sofa Cleaning',
    'Full House Cleaning',
    // Add more text if needed
  ];

  final List<String> cleaningServicesText = [
    'Kitchen Cleaning',
    'Washroom Cleaning',
    'Painting Service',
    // Add more text if needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Services',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageRow(popularServicesImages, popularServicesText),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cleaning Services',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageRow(cleaningServicesImages, cleaningServicesText),
        ],
      ),
    );
  }

  Widget _buildImageRow(List<String> images, List<String> texts) {
    return SizedBox(
      height: 200.0, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Handle onTap function here
                    print('Tapped on ${texts[index]}');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      images[index],
                      height: 150.0, // Adjust the height as needed
                      width: MediaQuery.of(context).size.width /2.5, // Dynamic width based on screen size
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(texts[index]), // Service text
              ],
            ),
          );
        },
      ),
    );
  }
}
