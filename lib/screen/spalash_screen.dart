import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowledge/screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Home Scrren'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome To The Online Quiz',
              style: GoogleFonts.exo(
                textStyle: TextStyle(
                  wordSpacing: 2,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.green[500],
                ),
              ),
            ),
            Image(
              image: AssetImage('assets/images/img.png'),
              filterQuality: FilterQuality.medium,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: Icon(
                Icons.start_sharp,
                size: 25,
                color: Colors.green[500],
              ),
              label: Text(
                'Login First',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    letterSpacing: 2,
                    wordSpacing: 3,
                    color: Colors.grey[500],
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
