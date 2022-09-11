import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_database_2/pages/home_page.dart';
import 'package:local_database_2/pages/sign_in_page.dart';
import 'package:local_database_2/services/HiveDB.dart';

import '../model/model_user.dart';
class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);
  static const String id = 'SignPage';

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
              SizedBox(height: 100,),
              Container(
                height: 70,
                width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage('assets/images/img.jpeg'),fit: BoxFit.cover,)
                ),
              ),
              SizedBox(height: 20,),
              Center(child: Text('Welcome Back!',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 30),),),
              SizedBox(height: 10,),
              Center(child: Text('Sign in to continue',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700,fontSize: 20),),),
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
              SizedBox(height: 20,),
              TextField( controller: PasswordController,style: TextStyle(color: Colors.white),
                decoration: InputDecoration( border: InputBorder.none,
                    prefixIcon: Icon(Icons.key_outlined,color: Colors.grey,),
                    hintText: 'Password',hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Container(height: 1,margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
              ),
              SizedBox(height: 20,),
              Center(child: Text('Forget Password?',style: TextStyle(color: Colors.grey),),),
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

            ],),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Already have an account?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, HomePage.id);
                }, child: Text('SIGN UP',style: TextStyle(fontWeight: FontWeight.bold),))

              ],)
          ],
        ),
      ),
    );
  }
}
