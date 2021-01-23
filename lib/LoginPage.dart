import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  Color sk = Colors.black;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[300], Colors.blue[900]])),
        padding: EdgeInsets.only(
            top: height * 0.11, left: width * 0.01, right: width * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(5, 3),
                                blurRadius: 9.1,
                                spreadRadius: 0.1)
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(17.0)),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {},
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Enter your Email",
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                                top: height * 0.02,
                                right: width * 0.02,
                                bottom: height * 0.02,
                                left: width * 0.02),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 9.1,
                                offset: Offset(2, 2),
                                spreadRadius: 0.1)
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(17.0)),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter your Password",
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                                top: height * 0.02,
                                right: width * 0.02,
                                bottom: height * 0.02,
                                left: width * 0.02),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(17.0))),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Row(
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
                          style: TextStyle(color: Colors.white),
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
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                  height: height * 0.06,
                  width: width * 0.9,
                  child: RaisedButton(
                    disabledColor: Colors.white,
                    onPressed: () {
                      print("Email:-" +
                          emailController.text +
                          "Password:-" +
                          passwordController.text);
                      emailController.text = "";
                      passwordController.text = "";

                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dynamic(),
                          )); */
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "-OR-",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Sing in With",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
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
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have a Account?",
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sing In",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
