import 'package:flutter/material.dart';
import 'package:offline_db_form/Login.dart';
import 'package:offline_db_form/constants.dart';

import 'Dashboard.dart';
import 'Database.dart';

enum GenderSelect {Male, Female}
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  GenderSelect _gender = GenderSelect.Male;
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String dropDownValue = "Rajkot";
  List<String> city = [
    "Vadodara",
    "Ahmedabad",
    "Surat",
    "Rajkot",
    "Pune",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 120,),
              myTextField(
                  controller: firstName,
                  hintText: "First Name",
                prefixIcon: Icon(Icons.person),
                validator: (value){
                    if(value!.isEmpty){
                      return "Enter a First Name";
                    }
                }
              ),
              myTextField(
                  controller: lastName,
                  hintText: "Last Name",
                  prefixIcon: Icon(Icons.person),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter a Last Name";
                    }
                  }
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Text("Gender"),
                    SizedBox(width: 25,),
                    Text("Male"),
                    Radio(
                        value: GenderSelect.Male,
                        groupValue: _gender,
                        onChanged: (GenderSelect? value){
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    Text("Female"),
                    Radio(
                        value: GenderSelect.Female,
                        groupValue: _gender,
                        onChanged: (GenderSelect? value){
                          setState(() {
                            _gender = value!;
                          });
                        }),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: DropdownButton(
                  value: dropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  items: city.map((String items){
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                      print(dropDownValue);
                    });
                  },
                ),
              ),
              myTextField(
                  controller: email,
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter a Email";
                    }
                  }
              ),
              myTextField(
                  controller: password,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter a Password";
                    }
                  }
              ),
              ElevatedButton(
                  onPressed: () async{
                    // Check if the form is valid
                    if (_formkey.currentState!.validate()) {
                      // Form is valid, proceed with registration

                      // Gather data from form fields
                      String firstNameValue = firstName.text;
                      String lastNameValue = lastName.text;
                      String emailValue = email.text;
                      String passwordValue = password.text;
                      String selectedCity = dropDownValue;
                      GenderSelect selectedGender = _gender;

                      // Add data to the database
                      await SQLiteDatabase.createData(firstNameValue, lastNameValue, selectedGender.toString(), selectedCity, '', emailValue, passwordValue);

                      // Navigate to the next screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRegisteredData()));
                    }
                  },
                  child: Text("Register")),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Already have an account? Login"),),
            ],
          ),
        ),
      ),
    );
  }
}
