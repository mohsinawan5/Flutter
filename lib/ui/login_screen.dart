import 'package:exd_social_app/ui/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'app_view.dart';
import 'home_Screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPassword=false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300 ],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900 ],
        title: Text("LOGIN SCREEN"),
        leading:Icon( Icons.account_box),
        actions: [Icon(Icons.lock_outline)],
        centerTitle: true,
      ),
      body:  Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(Icons.account_circle_rounded,size: 180,),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || !validator.email(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),suffixIcon: IconButton(
              onPressed: (){},
              icon: Icon(Icons.email_outlined),
            ),
              hintText: "Email",
            ),
            controller: emailcontroller,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(

            validator: (value) {
              if (value == null || !validator.password(value)) {
                return 'Please enter a valid Passwordl';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              hintText: "Password",
              suffixIcon: IconButton(
                onPressed: (){
                  isPassword=!isPassword;
                  setState(() {

                  });
                },
                icon: isPassword? Icon(CupertinoIcons.eye_slash_fill):Icon(Icons.remove_red_eye) ,
              ),   ),
            controller: passwordcontroller,
            obscureText: isPassword,

          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppView()));
              },
              child: Text("Submit",style: TextStyle(color: Colors.black))
          ),
          Text("Don't Have Account Sign in Here?"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen()));
            }, child: Text("Sign In"),

          ),],
      ),

    );
  }
}
