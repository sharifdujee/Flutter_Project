import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_system/constants/constants.dart';
import 'package:solar_system/screen/home_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.colorBurn),
          image: AssetImage(kSplashImage)

        ),
      ),
        child: imageText(context),

      )
    );
  }
  Widget imageText(context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text('Explore',
          style: GoogleFonts.exo(
            fontSize: 35,
            color: kWhiteColor,
          ),),
          const SizedBox(
            height: 10,
          ),
          CupertinoButton(
            minSize: 0,
              padding: EdgeInsets.zero,

              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())
              );
              },
            child: const Icon(Icons.arrow_forward, size: 30, color: Colors.white30,),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
