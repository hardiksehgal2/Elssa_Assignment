import 'package:flutter/material.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.security, color: Colors.black),
              SizedBox(width: 8.0),
              Text(
                'Why Choose Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          _buildFeatureContainer(
            'assets/images/star.png',
            'Quality Assurance',
            '''Your satisfaction is guaranteed
            ''',
          ),
          SizedBox(height: 16.0),
          _buildFeatureContainer(
            'assets/images/fixed.jpg',
            'Fixed Prices',
            'No hidden costs, all the prices are known and fixed before booking',
          ),
          SizedBox(height: 16.0),
          _buildFeatureContainer(
            'assets/images/finger.png',
            'Hassle free',
            '''Convenient, time saving and secure''',
          ),

        ],

      ),
    );
  }

  Widget _buildFeatureContainer(String imagePath, String title, String description) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 50.0,
            height: 60.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
