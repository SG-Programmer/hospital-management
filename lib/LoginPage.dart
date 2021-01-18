import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 49.0),
                child: Icon(
                  Icons.supervised_user_circle,
                  size: 115.0,
                  color: Colors.orange[300],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 29.0, bottom: 8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            labelText: "Email",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            /* hintStyle:
                                TextStyle(color: Colors.blue, fontSize: 18.0), */
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.orange,
                            )),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: "Password",
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            /* hintText: "Password", */
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.orange,
                            )
                            /* hintStyle:
                                TextStyle(color: Colors.blue, fontSize: 18.0) */
                            ),
                      ),
                      FlatButton(
                          onPressed: null,
                          child: Text(
                            "Forgat password?",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 150.0,
                child: RaisedButton(
                  onPressed: null,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  disabledColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    Text("or login with"),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            child: Icon(Icons.book),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            child: Icon(Icons.supervised_user_circle),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0),
                child: Column(
                  children: [
                    Text("Don't have an account?"),
                    FlatButton(onPressed: null, child: Text("Sing up")),
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
