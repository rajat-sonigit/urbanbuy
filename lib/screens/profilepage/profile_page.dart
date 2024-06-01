import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbanbuy/screens/auth_services.dart';
import 'package:urbanbuy/screens/profilepage/subpages/change_password.dart';
import 'package:urbanbuy/screens/profilepage/subpages/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  void signout(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('lib/assets/profile.jpg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 14,
                            child: IconButton(
                              icon: Icon(Icons.edit,
                                  size: 16, color: Colors.white),
                              onPressed: () {
                                // Handle edit profile
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Louis Phillip',
                      style: GoogleFonts.notoSerif(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'louisphillip@gmail.com',
                      style: GoogleFonts.notoSerif(
                        fontSize: 14,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  buildProfileOption(
                    icon: Icons.person,
                    title: 'My Profile',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                  ),
                  buildDivider(),
                  buildProfileOption(
                    icon: Icons.monetization_on,
                    title: 'Returns and Refund',
                    onTap: () {
                      // Navigate to Returns and Refund
                    },
                  ),
                  buildDivider(),
                  buildProfileOption(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                    },
                  ),
                  buildDivider(),
                  buildProfileOption(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      // Navigate to Support
                    },
                  ),
                  buildDivider(),
                  buildProfileOption(
                    icon: Icons.logout,
                    title: 'Sign Out',
                    textColor: Colors.red,
                    onTap: () {
                      signout(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String title,
    Color textColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(
          title,
          style: GoogleFonts.notoSerif(
              color: textColor, fontWeight: FontWeight.w600),
        ),
        trailing: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ),
        onTap: onTap,
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey[300],
    );
  }
}
