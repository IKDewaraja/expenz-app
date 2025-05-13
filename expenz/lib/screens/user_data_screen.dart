import 'package:expenz/constants/constants.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter your \nPersonal Details",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
        
            ),
            ),
        
            SizedBox(height: 30,),
        
            //form
        
            Form(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                
                //form field for the user email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                     
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),


                //form field for the user password
                TextFormField(
                  obscureText: true,  
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                     
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),


              //user confirm password
                 TextFormField(
                  obscureText: true,  
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                     
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
            )

      ]
        ),
      )),
    ),
    );
  }
}
