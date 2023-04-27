import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mdesign_project/Pantallas/tema1.dart';


class PantallaUno extends StatelessWidget {
  const PantallaUno({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.limeAccent,
            Colors.green,
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top:150),
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantallaTema1()),
                      );
                    },
                    icon: Icon(
                        Icons.chevron_right
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                            140, 0, 0, 0))
                    ),
                    label: Text("Date Pickers",
                      style: TextStyle(
                        fontSize: 30,
                      ),)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top:70),
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PantallaTema1()),
                        );
                      },
                      icon: Icon(
                          Icons.chevron_right
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                              140, 0, 0, 0))
                      ),
                      label: Text("Dialogs",
                        style: TextStyle(
                          fontSize: 30,
                        ),)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top:70),
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PantallaTema1()),
                        );
                      },
                      icon: Icon(
                          Icons.chevron_right
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                              140, 0, 0, 0))
                      ),
                      label: Text("Segmented Buttons",
                        style: TextStyle(
                          fontSize: 30,
                        ),)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,top:70,bottom: 100),
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PantallaTema1()),
                        );
                      },
                      icon: Icon(
                          Icons.chevron_right
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                              140, 0, 0, 0))
                      ),
                      label: Text("Navigation Drawer",
                        style: TextStyle(
                          fontSize: 30,
                        ),)
                  ),
                ),
          ]
        )
      ),
    )
    );
  }
}





