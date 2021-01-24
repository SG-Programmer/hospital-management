import 'package:flutter/material.dart';
// import 'package:testing_app/FormPageOne.dart';
// import 'package:testing_app/LoginPage.dart';
//import 'package:testing_app/dynamic.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool rememberMe = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConformController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //!TextFields
    textfield(String hint, String label, Icon icon,
        TextEditingController controllerName) {
      return Padding(
        padding: EdgeInsets.only(left: height * 0.04, right: height * 0.04),
        child: Container(
          height: height * 0.05,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 2.0,
                color: Colors.blue,
                offset: Offset(1, 1),
                spreadRadius: 0.1)
          ], color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: TextField(
            controller: controllerName,
            decoration: InputDecoration(
              prefixIcon: icon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              hintText: hint,
              labelText: label,
              isDense: true,
              contentPadding: EdgeInsets.all(height * 0.01), // Added this
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 255, 7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: height * 0.08),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height / 14,
                  ),
                  textfield(
                      "xyz123",
                      "User Name",
                      Icon(
                        Icons.supervised_user_circle,
                        color: Colors.blue[900],
                      ),
                      userNameController),
                  SizedBox(height: height * 0.02),
                  textfield(
                      "Example@xyz.com",
                      "Email",
                      Icon(Icons.email, color: Colors.blue[900]),
                      emailController),
                  SizedBox(height: height * 0.02),
                  textfield(
                      "********",
                      "Password",
                      Icon(Icons.lock, color: Colors.blue[900]),
                      passController),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textfield(
                      "********",
                      "Conform Password",
                      Icon(Icons.lock, color: Colors.blue[900]),
                      passConformController),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: height * 0.05, right: height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value;
                                  });
                                }),
                            GestureDetector(
                              child: Text(
                                "RememberMe",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: () {
                                setState(() {
                                  rememberMe == true
                                      ? rememberMe = false
                                      : rememberMe = true;
                                });
                                print(rememberMe);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        FlatButton(
                            onPressed: null,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: height * 0.014),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.07,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: height * 0.05, right: height * 0.05),
                    child: RaisedButton(
                      onPressed: () {},
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPageOne(),
                          )), */
                      child: Text("Create Account",
                          style: TextStyle(color: Colors.white)),
                      disabledColor: Colors.blue,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You have an account?"),
                      GestureDetector(
                          onTap: () {
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                )); */
                          },
                          child: Text(
                            "Login",
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Facebook");
                          },
                          child: CircleAvatar(
                            child: Text("F"),
                            maxRadius: 28.0,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Google");
                          },
                          child: CircleAvatar(
                            child: Text("G"),
                            maxRadius: 28.0,
                            backgroundColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
