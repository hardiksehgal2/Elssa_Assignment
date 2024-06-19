import 'package:flutter/material.dart';

class Trust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted from spaceEvenly to spaceBetween
        children: [
          _buildFeatureColumn(
              'assets/images/schedule.png', 'On Demand /\nScheduled'),
          _buildFeatureColumn(
              'assets/images/verified.png', 'Verified\nPartners'),
          _buildFeatureColumn(
              'assets/images/guarantee.png', 'Satisfaction\nGuarantee'),
          _buildFeatureColumn(
              'assets/images/pricing.jpg', 'Upfront\nPricing'),
          _buildFeatureColumn('assets/images/workers.jpg',
              'Highly Trained\nProfessionals'),
        ],
      ),
    );
  }

  Widget _buildFeatureColumn(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32.0,
          backgroundColor: Colors.green[50], // Lightest green background
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(imagePath),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black, // Changed text color to black
          ),
        ),
      ],
    );
  }
}
