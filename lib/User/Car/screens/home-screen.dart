import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import '../widget/color_changing_container.dart';
import '/User/Car/add.dart';

enum Type {
  car,
  bike,
  bus,
}

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Type? selectedType;
  String _carImage = 'images/car (1).png';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SpotiPark.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Anta-Regular.ttf',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to profile page when Skip button is clicked
                      Get.to(()); // Add your profile page route here
                    },
                    child: Container(
                      height: 32, // Adjust height as needed
                      padding: EdgeInsets.symmetric(
                          horizontal: 16), // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: Color(
                            0xFF428bc4), // Same color as "Tap to add" button
                        borderRadius: BorderRadius.circular(
                            16), // Adjust borderRadius as needed
                      ),
                      child: Center(
                        child: Text(
                          'Skip for now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, // Make the font smaller
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 27, top: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Ya mezyena',
                  style: GoogleFonts.bubblegumSans(
                    textStyle: TextStyle(
                      color: Color(0xFF428bc4), // Change text color to #428bc4
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'What are you driving today ?',
                  style: GoogleFonts.courgette(
                    textStyle: TextStyle(
                      color: Colors.black, // Change text color to black
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.car;
                          _carImage = 'images/car (1).png';
                        });
                      },
                      child: ColorChangingContainer(
                        containerColor: selectedType == Type.car
                            ? inActiveContainerColor
                            : activeContainerColor,
                        containerIcon: Icon(
                          FontAwesomeIcons.car,
                          size: 30,
                          color: selectedType == Type.car
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                        containerText: 'Car',
                        myTextColor: selectedType == Type.car
                            ? inActiveTextColor
                            : activeTextColor,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.bike;
                          _carImage = 'images/bike (2).png';
                        });
                      },
                      child: ColorChangingContainer(
                        containerColor: selectedType == Type.bike
                            ? inActiveContainerColor
                            : activeContainerColor,
                        containerIcon: Icon(
                          FontAwesomeIcons.motorcycle,
                          size: 30,
                          color: selectedType == Type.car
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                        containerText: 'Bike',
                        myTextColor: selectedType == Type.bike
                            ? inActiveTextColor
                            : activeTextColor,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.bus;
                          _carImage = 'images/bus.png';
                        });
                      },
                      child: ColorChangingContainer(
                        containerColor: selectedType == Type.bus
                            ? inActiveContainerColor
                            : activeContainerColor,
                        containerIcon: Icon(
                          FontAwesomeIcons.bus,
                          size: 30,
                          color: selectedType == Type.bus
                              ? inActiveTextColor
                              : activeTextColor,
                        ),
                        containerText: 'Bus',
                        myTextColor: selectedType == Type.bus
                            ? inActiveTextColor
                            : activeTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/line1.png'),
                          const SizedBox(width: 80),
                          Image.asset(
                            _carImage,
                            height: 330.h,
                          ),
                          const SizedBox(width: 75),
                          Image.asset('images/line2.png')
                        ],
                      ),
                      Positioned(
                        left: 127,
                        top: 280,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(
                                AddVehicule(),
                              );
                            },
                            child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFF428bc4), // Same color as "Tap to add" button
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text(
                                  'Tap to\n  add',
                                  style: TextStyle(
                                    fontFamily: 'Anta-Regular.ttf',
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to close the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    return exitApp;
  }
}
