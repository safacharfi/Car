import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gridDashboard.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 50), // Reduced height to 50
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "My vehicles",
                      style: GoogleFonts.courgette(
                        // Changed font to Courgette
                        textStyle: TextStyle(
                          color: Color(0xFF15256e),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Check your vehicles infos",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  alignment: Alignment.topCenter,
                  icon: Image.asset("images/caricon.png", width: 64),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          //TODO Grid Dashboard
          GridDashboard()
        ],
      ),
    );
  }
}
