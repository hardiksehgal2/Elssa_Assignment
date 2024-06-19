import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elssa/custom_carousel/otherServices.dart';
import 'package:elssa/custom_carousel/sliders.dart';
import 'package:elssa/custom_carousel/trust.dart';
import 'package:elssa/screens/choose.dart';
import 'package:elssa/screens/saftey.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<String> imageList = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/new-arrival-discount-offer-on-shoes-poster-ad-design-template-20e8be063593e460ec1eadf156df2a71_screen.jpg?ts=1607504280',
    'https://codecanyon.img.customer.envatousercontent.com/files/352931146/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=29e647d179d8704189dced38088fac34',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/shoes-craze-sale-facebook-ad-design-template-b1d1738fd5e9e0f6e3152ec502a1c2e1_screen.jpg?ts=1567579016',
    'https://codecanyon.img.customer.envatousercontent.com/files/352468295/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=cea2b1e7878f5ef6b903f9b3625460fe',
    'https://rstatic.shoecarnival.com/domain/5265_508_20231225_Winter_Season_Store_Locator_Banner2_(1).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            // Handle menu icon press
          },
        ),
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print('Tapped on image');
                    },
                    child: CarouselSlider(
                      items: imageList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 200.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          // Handle page change
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              SlidderButtons(),
              SizedBox(height: 16.0),
              OtherServices(),
              SizedBox(height: 16.0),
              Trust(),
              SizedBox(height: 16.0),
              Choose(),
              SizedBox(height: 16.0),
              Container(
                height: 500, // Set a fixed height for SafetyMeasures widget
                child: SafetyMeasures(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        tabs: const[
          GButton(icon: Icons.home_outlined,text: "Home",),
          GButton(icon: Icons.wallet_giftcard_sharp,text: "Rewards"),
          GButton(icon: Icons.payments_outlined,text: "My Orders"),
          GButton(icon: Icons.calendar_month_outlined,text: "Bookings"),
          GButton(icon: Icons.person_outline,text: "Profile"),

        ]
      ),
    );
  }
}
