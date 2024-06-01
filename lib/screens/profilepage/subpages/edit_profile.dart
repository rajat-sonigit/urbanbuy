import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
              elevation: 2.0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(8.0),
                child: Center(
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(
            'Edit Profile',
            style: GoogleFonts.notoSerif(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      // Light grey background for better visibility
                      backgroundImage: AssetImage('lib/assets/profile.jpg'),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 16,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.white,
                              size: 18),
                          onPressed: () {
                            // Handle profile picture change
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField(labelText: 'Full Name'),
                  buildTextField(labelText: 'Email Address'),
                  buildTextField(labelText: 'Gender'),
                  buildTextField(labelText: 'Birthday'),
                  buildTextField(labelText: 'Phone Number'),
                  SizedBox(height: 32),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle button tap
                    print('Button tapped');
                  },
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({required String labelText}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: labelText.toLowerCase().contains(
            'password'), // Check if it's a password field
      ),
    );
  }
}

  void main() {
  runApp(MaterialApp(
    home: EditProfilePage(),
  ));
}
