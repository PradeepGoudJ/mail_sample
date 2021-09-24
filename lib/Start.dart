import 'package:flutter/material.dart';
import 'package:mail_sample/Login.dart';
import 'package:authentification/Login.dart';
import 'package:mail_sample/SignUp.dart';


class Start  extends StatefulWidget {
  const Start ({Key? key}) : super(key: key);
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
  }

  navigateToRegister()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          const SizedBox(height: 45.0),

          const SizedBox(
            height: 400,

            child: Image(image: AssetImage("images/start.png"),
            fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

          RichText(

              text: const TextSpan(

              text: 'Welcome to ', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
                 color: Colors.black87),

              children: <TextSpan>[
                TextSpan(
                  text: 'Mail', style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
                )
               ]
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [

              ElevatedButton(
                //  padding: const EdgeInsets.only(left: 30,right: 30),

                   onPressed: navigateToLogin ,
                   child: (
                   const Text(
                     'LOGIN',
                     style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                    ),
                   ),
                   shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                    ),
                   color: Colors.blue
                   ),
               ),

              const SizedBox(width: 30.0),

              ElevatedButton(
              //padding: const EdgeInsets.only(left: 30,right: 30),


               onPressed: navigateToRegister ,
                   child: (
                   const Text(
                      'REGISTER',
                       style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                         color: Colors.white70,
                        ),
                     ),
                         shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                       ),
                      color: Colors.blue)
                  ),
                ],
               ),
            ],),
            );
          }
       }


