import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Vehicle.dart';
import 'VehiculeLinking.dart';
import 'screens/home-screen.dart';
import '/User/Car/listVehicule.dart';

class AddVehicule extends StatefulWidget {
  final Vehicle? vehicle;

  const AddVehicule({Key? key, this.vehicle}) : super(key: key);

  @override
  State<AddVehicule> createState() => _AddVehiculeState();
}

class _AddVehiculeState extends State<AddVehicule> {
  late TextEditingController _brandController;
  late TextEditingController
      _lisencePlateController; // Correction du nom de la variable
  late TextEditingController _modelController;
  late VehicleController vehiclesController;

  @override
  void initState() {
    super.initState();
    _brandController = TextEditingController(
        text: widget.vehicle != null ? widget.vehicle?.brand : '');
    _lisencePlateController = TextEditingController(
        text: widget.vehicle != null
            ? widget.vehicle?.lisencePlate
            : ''); // Correction du nom de la variable
    _modelController = TextEditingController(
        text: widget.vehicle != null ? widget.vehicle?.model : '');
  }

  @override
  void dispose() {
    _brandController
        .dispose(); // Disposer des contrôleurs pour éviter les fuites de mémoire
    _lisencePlateController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  handleCreateNote() async {
    Vehicle vehicle = Vehicle(
      '0',
      brand: _brandController.text,
      lisencePlate: _lisencePlateController.text,
      model: _modelController.text,
    );
    await vehiclesController.addVehicle(vehicle);

    // After adding the vehicle, navigate to the list of vehicles
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePage(), // Replace ListVehicles with your actual list page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    vehiclesController = Provider.of<VehicleController>(context);
    final _width = mediaQuery.size.width;
    final _height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.start, // Adjusted mainAxisAlignment
            children: [
              SizedBox(
                height:
                    mediaQuery.size.height * .4, // Adjust the height as needed
                width: mediaQuery.size.width * .8,
                child: Image.asset(
                  "images/car.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Add your vehicle info',
                style: GoogleFonts.courgette(
                  fontWeight: FontWeight.bold,
                  fontSize: mediaQuery.size.width * .08,
                  color: Color(0xFF15256E), // Set the color to #15256e
                ),
              ),
              SizedBox(height: 20),
              Form(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width * .05),
                  height: mediaQuery.size.height * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _brandController,
                        validator: (value) {},
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          hintStyle: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Text(
                        'lisencePlate',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _lisencePlateController,
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {},
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          hintStyle: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Text(
                        'Model',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _modelController,
                        style: GoogleFonts.nunitoSans(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (value) {},
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          hintStyle: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Add a SizedBox with desired height for spacing

                      ElevatedButton(
                        onPressed: () async {
                          if (widget.vehicle == null) {
                            handleCreateNote();
                          } else {}
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQuery.size.width * .11,
                              vertical: mediaQuery.size.height * .015),
                        ),
                        child: Text(
                          widget.vehicle == null
                              ? "Add"
                              : "Edit your Car", // Modify the button text based on the operation
                          style: TextStyle(
                            color:
                                Color(0xFF15256E), // Set the color to #15256e
                            fontWeight: FontWeight.w600,
                            fontSize: mediaQuery.size.width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
