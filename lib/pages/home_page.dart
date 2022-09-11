import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_database_2/pages/sign_in_page.dart';
import 'package:local_database_2/services/HiveDB.dart';

import '../model/model_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final NumberController = TextEditingController();
  final PasswordController = TextEditingController();


  doLOgin() async {
    String username = NameController.text.toString().trim();
    String email = EmailController.text.toString().trim();
    String number = EmailController.text.toString().trim();
    String password = PasswordController.text.toString().trim();

    var user = new User(email: email,password: password,phonenumber: number,username: username);
    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();
    print(user2.password);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: CupertinoColors.secondaryLabel,

      body: Container(padding: EdgeInsets.all(20),
      child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

              SizedBox(height: 100,),
              Center(child: Text('Create',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 30),),),
              SizedBox(height: 10,),
              Center(child: Text('Account',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 30),),),
              SizedBox(height: 100,),

              TextField(controller: NameController,style: TextStyle(color: Colors.white),
                decoration: InputDecoration( border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                    hintText: 'User Name',hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Container(height: 1,margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
              ),
              SizedBox(height: 25,),
              TextField(controller: EmailController,style: TextStyle(color: Colors.white),
                decoration: InputDecoration( border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail_outline,color: Colors.grey,),
                    hintText: 'E-Mail',hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Container(height: 1,margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
              ),
              SizedBox(height: 25,),
              TextField(controller: NumberController,style: TextStyle(color: Colors.white),
                decoration: InputDecoration( border: InputBorder.none,
                    prefixIcon: Icon(Icons.local_phone_outlined,color: Colors.grey,),
                    hintText: 'Phone Number',hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Container(height: 1,margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
              ),
              SizedBox(height: 25,),
              TextField( controller: PasswordController,style: TextStyle(color: Colors.white),
                decoration: InputDecoration( border: InputBorder.none,
                    prefixIcon: Icon(Icons.key_outlined,color: Colors.grey,),
                    hintText: 'Password',hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Container(height: 1,margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
              ),
              SizedBox(height: 60,),

              Center(child: Container(height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle,

                ),
                child: Container(height: 70,width: double.infinity,
                    decoration: BoxDecoration(shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [
                              Colors.blue.shade900,
                              Colors.blue.shade900,
                              Colors.blue.shade900,
                              Colors.blueAccent,
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0.9)
                            ]
                        )
                    ),
                    child: IconButton(onPressed: (){
                      doLOgin();
                    }, icon: Icon(Icons.arrow_forward,size: 50,color: Colors.white,),)

                ),
              ),),
              SizedBox(height: 60,),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: Text('Already have an account?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),),
           TextButton(onPressed: (){
             Navigator.pushNamed(context, SignPage.id);
           }, child: Text('SIGN IN',style: TextStyle(fontWeight: FontWeight.bold),))

          ],)
        ],
      ),
      ),
    );
  }
}
