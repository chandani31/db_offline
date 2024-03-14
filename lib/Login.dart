import 'package:flutter/material.dart';
import 'package:offline_db_form/Registration.dart';
import 'package:offline_db_form/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200,),
              myTextField(
                  controller: email,
                  hintText: "Enter Email",
                prefixIcon: Icon(Icons.email),
                validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter Email";
                    }
                }
              ),

              myTextField(
                  controller: password,
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter Password";
                    }
                  }
              ),
              ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Login")),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Text("Don't have an account? Login"),),],
          ),
        ),
      ),
    );
  }
}
