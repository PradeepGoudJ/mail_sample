import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mail_sample/Start.dart';
import 'package:authentification/Start.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseUser user;
  bool isloggedin= false;


  checkAuthentificaion() async{

    _auth.onAuthStateChanged.listen((user) {
      if(user == null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
        }
    });
  }

  getUser() async{

      FirebaseUser firebaseUser = await _auth.currentUser();
      await firebaseUser.reload();
      firebaseUser = await _auth.currentUser();

      if(firebaseUser !=null)
        {
          setState(() {
            this.user =firebaseUser;
            this.isloggedin=true;
          });
        }
    }

    signOut()async{
    _auth.signOut();
    }
    @override
    void initState (){

    this.checkAuthentificaion();
    this.getUser();
    }
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        child: !isloggedin? CircularProgressIndicator():

            Column(
              children: [
                SizedBox(height: 40.0),
                Container(

                  height: 300,
                  child: Image(image: AssetImage("images/welcome.jpg"),
                  fit: BoxFit.contain,
                  ),
                ),
                   Container(child: Text("Hello ${user.displayName} you are Logged in as ${user.email}",
                   style: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold
                   ),),
                   ),

                ElevatedButton(
                  //padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: signOut,
                  child: Text('signOut',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold

                  ),
                  ),

                  color: Colors.blue,
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            )
      ),


    );
  }
}