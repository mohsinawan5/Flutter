import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../db/firebase_auth.dart';
import 'home_Screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  bool ispassword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(     backgroundColor: Colors.grey[300 ],
    appBar: AppBar(
    backgroundColor: Colors.blueGrey[900 ],

        centerTitle: true,
        title: Text("SignUp Screen"),

        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back_sharp),),
        actions: [
          Icon(Icons.lock),
        ],
      ),
      body: ListView(
        children:[ Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.email_outlined),
              ),
                hintText: "Email",
              ),
              controller: emailController,

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
                    ispassword=!ispassword;
                    setState(() {

                    });
                  },
                  icon: ispassword? Icon(CupertinoIcons.eye_slash_fill):Icon(Icons.remove_red_eye) ,
                ),   ),
              controller: passwordController,
              obscureText: ispassword,

            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.drive_file_rename_outline_rounded),
              ),
                hintText: "Full Name",
              ),
              controller: nameController,

            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.phone),
              ),
                hintText: "Phone No#",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.numbers_outlined),
              ),
                hintText: "Age",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.house),
              ),
                hintText: "Address",
              ),
              controller: addressController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.person),
              ),
                hintText: "Gender",
              ),
              controller: genderController,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: TextButton(
                    onPressed: () async {
                      await Auth.signupUser(

                        email: emailController.text,
                        password: passwordController.text,
                        fullName: nameController.text,
                        phoneNumber: phoneController.text,
                        age:ageController.text,
                        address:addressController.text,
                        gender:genderController.text,



                      );

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>LoginScreen()));
                    },
                    child: Text("Sign Up"))),
            Text("Already  Have Account Login in Here?"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
              }, child: Text("Log In"),

            ),
          ],
        ),
        ], ),
    );
  }
}
