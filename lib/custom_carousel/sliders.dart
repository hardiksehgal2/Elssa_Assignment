import 'package:flutter/material.dart';

class SlidderButtons extends StatelessWidget {
  const SlidderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceButton(Icons.home_repair_service, 'Renovation'),
            _buildServiceButton(Icons.handyman, 'Handyman'),
            _buildServiceButton(Icons.moving, 'Home shifting'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceButton(Icons.eco, 'Gardening'),
            _buildServiceButton(Icons.delete_outline, 'Declutter'),
            _buildServiceButton(Icons.brush, 'Painting'),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceButton(IconData iconData, String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          print('Tapped on $label');
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.all(16.0),
          elevation: 0, // Remove elevation to make it flat
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent), // Remove border
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.blue.shade800),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
