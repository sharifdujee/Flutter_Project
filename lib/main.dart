import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: IdProject(),
));
class IdProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Id Card Project',
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
            child: Column(
              children: <Widget> [
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.only(left: 60, top: 10),
                  height: 250,
                  width: 500,
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      // Main content
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 20, // Adjust this value based on your design
                        child: Text(
                          'Circle Technology',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      // Red color bar at the bottom
                      Positioned(
                        left: 0.0,
                        right: 0,
                        bottom: 0,
                        height: 30, // Adjust this value based on your design
                        child: Container(
                          color: Colors.red,
                          width: double.infinity, // Set width to match the container's width
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/img.png'),
                  radius: 80.0,

                ),
                Divider(
                  height: 90.0,
                  color: Colors.grey[800],
                ),
                Text('Name',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,

                ),
                ),
                SizedBox(height: 10,),
                Text('Robayet Bin Rahat',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 30,),
                Text('Current Level',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,

                  ),
                ),
                SizedBox(height: 10,),
                Text('8',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: <Widget> [
                    Icon(
                        Icons.email,
                    color: Colors.grey[400],),
                    SizedBox(width: 10,),
                    Text('rahad99@gmail.com',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.00,
                      ),
                    )

                  ],

                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}


