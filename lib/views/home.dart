// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:here4u/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:here4u/handlers/authentication.dart';
import 'resetpassword.dart';
import 'registration.dart';


class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  
final emailController=TextEditingController();
final passwordcontroller=TextEditingController();
String email='',password='';
bool spinner=false;
//final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.blueAccent,
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        tabBarTheme: const TabBarTheme(
        labelColor: Colors.blueAccent
        )
      ),
      home: Scaffold(
          body:  ListView(
              children: <Widget>[              
             SizedBox(
               height: MediaQuery.of(context).size.height/1.2,
               width: MediaQuery.of(context).size.width/1.2,
               child: ListView(
                 children: [
                  const Hero(
                         tag:'main',
                         child: Image(image: AssetImage('assets/logo.png'),
                         height: 200,
                         width: 200,),),
                   Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 height: 100,
                 width: 110,
                 child: ListView(
                   children: [
                     const Padding(
                       padding:  EdgeInsets.only(top:8.0,left: 8,right: 8),
                       child: Text("Enter email",
                      ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:4.0,left: 8,right: 8),
                       child: TextFormField(
                         controller: emailController,
                        autofocus: true, 
                         decoration: const InputDecoration(
                           hintText: "name@email.com"
                           ,fillColor: Colors.white
                         ),
                         keyboardType: TextInputType.emailAddress,
                         onChanged: (String value){
                           try{
                             email=value;
                           }catch(exception){
                             print(exception);
                            }
                         },
                       ),
                     )
                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:8.0,right: 8,top: 4),
               child: SizedBox(
                 height:100,
                 width:110,
                 child: ListView(
                   children: [
                     const Padding(
                       padding: EdgeInsets.only(left:8,right:8),
                       child: Text("Enter password",
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:4.0,left: 8,right: 8),
                       child: TextFormField(
                         controller: passwordcontroller,
                         obscureText: true,
                         keyboardType: TextInputType.text,
                         decoration: const InputDecoration(
                           hintText: 'password',
                           fillColor: Colors.white
                         ),
                         onChanged: (String value){
                           try{
                             password=value;
                           }catch(exception){
                             print(exception);
                           }
                         },
                       ),
                     ),             
                 ],
               ),
             )
                 ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          height: 36.8,
                          width: 69,
                          
                            child: Scaffold(
                              backgroundColor: Colors.blueAccent,
                              body: Builder(builder: (context)=>Center(
                                child: ElevatedButton(
                                  onPressed:()async {                                          
                                    try {
                                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                            email: email,
                                            password: password
                                          );
                                          emailController.clear();
                                          passwordcontroller.clear();
                                           Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>dashboard()));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                  authentication.customSnackBar(
                                                    content:
                                                        'No user found for that email.',
                                                  ),
                                                );
                                          } else if (e.code == 'wrong-password') {
      
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                  authentication.customSnackBar(
                                                    content:
                                                        'Wrong password provided for that user.',
                                                  ),
                                                );
                                                }
                                        }
                                      } ,
                                  child: const Text("Login")
                                ),
                              )),
                            ),
                          
                        ),
                      ),
                  ),TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => resetPassword(),));
                  },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10)
                      ),
                         child: const Text('Forgot password?',
                         style: TextStyle(
                           color: Colors.blue,
                           decoration: TextDecoration.underline,
                           fontWeight: FontWeight.w500
                         ),) ),

                         TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => register(),));
                  },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10)
                      ),
                         child: const Text('New in here? Sign in',
                         style: TextStyle(
                           color: Colors.blue,
                           decoration: TextDecoration.underline,
                           fontWeight: FontWeight.w500
                         ),) ),
                   ]
               ),
             )
              ]
              ),
        ),
    );
  }
}


