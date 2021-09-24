import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email ,_password , _name;

  chechAuthentication()async {

    _auth.onAuthStateChanged.listen((user) {

      if(user != null)
      {
        Navigator.push(context, MaterialPageRoute(

            builder: (context)=> HomePage()));
      }
    }
    );
  }
  @override
  void initState(){
    super.initState();
    this.chechAuthentication();
  }

  signUp()async{

    if(_formKey.currentState.validate())
      {
        _formKey.currentState.save();

        try{
          FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
          if(user!= null)
            {
              UserUpdateInfo updateuser = UserUpdateInfo();
              updateuser.displayName = _name;
              user.updateProfile(updateuser);
            }
        }
        catch(e){

          showError(e.errormessage);
        }
      }
  }
  showError(String errormessage){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('OK'),)
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    var input;
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(

          child: Column(

            children: [

              Container(

                height: 400,
                child: Image(image: AssetImage("images/Login.jpg"),
                  fit: BoxFit.contain,
                ),
              ),

              Container(

                child: Form(
                  key: _formKey,
                  child: Column(

                    children: [

                      Container(

                        child: TextFormField(


                            Container(

                              child: TextFormField(

                                  validator: (input)
                                  {
                                    if(input!.isEmpty)

                                      return 'Enter Name';
                                  },
                                  decoration: const InputDecoration(

                                      labelText: 'Name',
                                      prefixIcon:Icon(Icons.person)
                                  ),

                                  onSaved: (input) => _name = input!


                              ),
                            ),

                            validator: (input)
                            {
                              if(input!.isEmpty)

                                return 'Enter Mail';
                            },
                            decoration: const InputDecoration(

                                labelText: 'Email',
                                prefixIcon:Icon(Icons.email)
                            ),

                            onSaved: (input) => _email = input!


                        ),
                      ),
                      Container(

                        child: TextFormField(

                            validator: (input)
                            {
                              if(input!.length < 6)

                                return 'Provide Minimum 6 Character';
                            },

                            decoration: const InputDecoration(

                              labelText: 'Password',
                              prefixIcon:Icon(Icons.lock),
                            ),
                            obscureText: true,

                            onSaved: (input) => _password = input!


                        ),
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: signUp,
                        child: Text('SignUp',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold

                        )),

                        color: Colors.blue,
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

