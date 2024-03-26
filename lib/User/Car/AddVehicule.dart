import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Vehicle.dart';
import 'VehiculeLinking.dart';
import 'screens/home-screen.dart';

class VehiclesEditScreen extends StatefulWidget {
  Vehicle? vehicle;
  VehiclesEditScreen({this.vehicle, super.key});

  @override
  State<VehiclesEditScreen> createState() => _VehiclesEditScreenState();
}

class _VehiclesEditScreenState extends State<VehiclesEditScreen> {
  late TextEditingController _brandController;
  late TextEditingController _lisencePlateController;
  late TextEditingController _modelController;
  late VehicleController vehiclesController;

  @override
  void initState() {
    super.initState();
    _brandController = TextEditingController(
        text: widget.vehicle != null ? widget.vehicle?.brand : '');
    _lisencePlateController = TextEditingController(
        text: widget.vehicle != null ? widget.vehicle?.lisencePlate : '');
    _modelController = TextEditingController(
        text: widget.vehicle != null ? widget.vehicle?.model : '');
  }

  handleCreateNote() async {
    Vehicle vehicle = Vehicle(
      '0',
      brand: _brandController.text,
      lisencePlate: _lisencePlateController.text,
      model: _modelController.text,
    );
    await vehiclesController.addVehicle(vehicle);
  }

  handleEditNote() async {
    Vehicle vehicle = Vehicle(
      widget.vehicle!.id,
      brand: _brandController.text,
      lisencePlate: _lisencePlateController.text,
      model: _modelController.text,
    );
    await vehiclesController.editVehicle(vehicle);
  }

  @override
  Widget build(BuildContext context) {
    vehiclesController = Provider.of<VehicleController>(context);
    return Scaffold(
      backgroundColor: Color(0xFFDCE9EF), // Set background color here
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: vehiclesController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (widget.vehicle == null) {
                                  handleCreateNote();
                                } else {
                                  handleEditNote();
                                }
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()),
                                    (route) => false);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  widget.vehicle == null ? "Add" : "Update",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _brandController,
                          style: GoogleFonts.montserrat(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: " Brand",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _lisencePlateController,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: " Lisence Plate",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _modelController,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: " Model",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
