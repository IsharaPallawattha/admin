import 'package:admin/service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:fluttertoast/fluttertoast.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _Userstate();
}

class _Userstate extends State<user>{
  //not yet
  TextEditingController Usernamecontroller = new TextEditingController();
  TextEditingController Passwordcontroller = new TextEditingController();
  TextEditingController Namecontroller = new TextEditingController();
  TextEditingController Phonecontroller = new TextEditingController();
  TextEditingController Emailcontroller = new TextEditingController();

   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            "Add",
            style: TextStyle(
            color: const Color.fromARGB(255, 169, 158, 60),
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
          ),
          Text(
            "Apiaries",
            style: TextStyle(
            color: Color.fromARGB(255, 255, 193, 37),
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
          ),
        ],

        ),),
      body:Container(
        margin: EdgeInsets.only(left: 20.0,top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text("Username",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.0,),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        decoration:BoxDecoration(
          color: Color.fromARGB(70, 251, 247, 5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        child: TextField(
          controller: Usernamecontroller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
      SizedBox(height: 20.0,),
       Text("Password",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.0,),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        decoration:BoxDecoration(
          color: Color.fromARGB(70, 251, 247, 5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        child: TextField(
          controller: Passwordcontroller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
      SizedBox(height: 20.0,),
       Text("Name",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.0,),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        decoration:BoxDecoration(
          color: Color.fromARGB(70, 251, 247, 5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        child: TextField(
          controller: Namecontroller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
      SizedBox(height: 20.0,),
       Text("Phone Number",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.0,),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        decoration:BoxDecoration(
          color: Color.fromARGB(70, 251, 247, 5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        child: TextField(
          controller: Phonecontroller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
      SizedBox(height: 20.0,),
       Text("Email",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.0,),
      Container(
        padding: EdgeInsets.only(left: 10.0),
        decoration:BoxDecoration(
          color: Color.fromARGB(70, 251, 247, 5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        child: TextField(
          controller: Emailcontroller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
      SizedBox(height: 40.0,),
      Center(
        child: ElevatedButton(
          onPressed: ()async {
            String Id= randomAlphaNumeric(10);
            Map<String, dynamic> userInfoMap = {
              "Username": Usernamecontroller.text,
              "Password": Passwordcontroller.text,
              "id": Id,
              "name": Namecontroller.text,
              "Phone": Phonecontroller.text,
              "Email": Emailcontroller.text
            };
            await DatabaseMethods().addUserDetails(userInfoMap, Id).then((value){
              
              Fluttertoast.showToast(
              msg: "User details added successfully!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
    );
            });
          },
          child: Text("Add",
           style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set text color to black
            ),),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow, // Set button color to yellow
          ),
        ),

      )
      ],),),
    );
  }}