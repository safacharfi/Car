import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'User/Car/screens/home-screen.dart';
import 'User/Car/screens/parking_screen.dart';
import '/User/Car/VehiculeLinking.dart'; // Corrected the import here
import 'package:provider/provider.dart';


void main() {
  runApp(const ParkieApp());
}

class ParkieApp extends StatelessWidget {
  const ParkieApp({Key? key}); // Correction de la syntaxe ici

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Utilisation de MultiProvider pour plusieurs providers
      providers: [
        ChangeNotifierProvider(create: (_) => VehicleController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen (),
            routes: {
              ParkingScreen.id: (context) => const ParkingScreen(),
            },
          );
        },
      ),
    );
  }
}
