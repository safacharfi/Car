import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'VehiculeLinking.dart';
import '/User/Car/Vehicle.dart';

class GridDashboard extends StatelessWidget {
  late List<Vehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    VehicleController contactController =
        Provider.of<VehicleController>(context, listen: true);
    vehicles = contactController.vehicles;

    debugPrint("vehicles size ${vehicles.length}");

    return Flexible(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          Vehicle vehicle = vehicles[index];
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff453658),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/calendar.png",
                  width: 42,
                ),
                SizedBox(height: 14),
                Text(
                  'Brand: ${vehicle.brand}',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'License Plate: ${vehicle.lisencePlate}', // Corrected typo in 'licensePlate'
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Model: ${vehicle.model}',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
