
import 'package:flutter/material.dart';

import 'package:expenz/constants/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:expenz/constants/colors.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the checkbox
  bool _rememberMe = false;

  //form key for the form validations
  final _formKey = GlobalKey<FormState>();

  //controllers for the text form fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwoedController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwoedController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 30),

                //form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form field for the name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check whether the user entered a valid name
                          if (value!.isEmpty) {
                            return "Please enter your Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 15),

                      //form field for the user email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid email address";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 15),

                      //form field for the user password
                      TextFormField(
                        controller: _passwoedController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Plese enter a valid password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 15),

                      //user confirm password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Plese enter the same password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 30),

                      //remember me for the next time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),

                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;

                                  //  print(_rememberMe);
                                },
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      //next button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //form is valid => process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwoedController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                                print("$userName =$email = $password = $confirmPassword");  
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
