import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/home_screen.dart';
import 'package:quiz_app/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Welcome To The  Online Quiz',
                style: GoogleFonts.exo(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.green[500])),
              ),
              Image(
                image: AssetImage('assets/images/img.png'),
                height: MediaQuery.of(context).size.height * 0.5,
                //width: MediaQuery.of(context).size.width*0.5,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(
                    Icons.start_sharp,
                    size: 25,
                    color: Colors.green[500],
                  ),
                  label: Text(
                    'Start Quiz',
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 30,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
