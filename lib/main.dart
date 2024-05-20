import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gallery_page.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mustefa219',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color.fromARGB(255, 243, 212, 33), const Color.fromARGB(255, 77, 2, 90)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/1.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mustefa Amedi',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Programmer & Developer',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white70,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildSocialButton(
                      icon: FontAwesomeIcons.snapchat,
                      color: Colors.yellow,
                      url: 'https://snapchat.com/add/mustefa219',
                    ),
                    SizedBox(height: 20),
                    _buildSocialButton(
                      icon: FontAwesomeIcons.instagram,
                      color: Colors.pink,
                      url: 'https://instagram.com/mustefa219',
                    ),
                    SizedBox(height: 20),
                    _buildSocialButton(
                      icon: FontAwesomeIcons.youtube,
                      color: Colors.red,
                      url: 'https://youtube.com/your_channel',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: FaIcon(FontAwesomeIcons.images, color: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({required IconData icon, required Color color, required String url}) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: FaIcon(icon, color: Colors.white),
      label: Text(
        'Follow me',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
