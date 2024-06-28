

import 'package:catalog_app/CatalogApp/Pages/a02_homePage.dart';
import 'package:catalog_app/CatalogApp/utils/a08_routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class A01_LoginPage extends StatefulWidget {
  const A01_LoginPage({Key? key}) : super(key: key);

  @override
  State<A01_LoginPage> createState() => _A01_LoginPageState();
}

class _A01_LoginPageState extends State<A01_LoginPage> {

  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login.png", fit: BoxFit.fitWidth,),
              SizedBox(height: 20,),
              Text('Welcome $name', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username can't be Empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {

                        });
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can't be Empty";
                        }
                        else if(value.length < 6){
                          return "password should have atleast 6 letter";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40,),

                    Material(
                      color: context.theme.floatingActionButtonTheme.backgroundColor,
                      // conditional statement when changeButton = true then borderRadius = 25 otherwise 8
                      borderRadius: BorderRadius.circular(changeButton ? 25 : 8),
                      child: InkWell(
                        splashColor: Colors.pink,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          // Conditional statement when changeButton = true then width = 45 otherwise 120
                          width: changeButton ? 45 : 120,
                          height: 45,
                          alignment: Alignment.center,
                          // conditional statement when changeButton = true then show Icon.done otherwise show LoginTextButton
                          child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text('Login', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),


                    /*
                    ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => A01_HomePage()));
                    }, child: Text("Login"), style: TextButton.styleFrom(minimumSize: Size(120, 40)),)
                     */

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }


  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 450));
      /// After 450 millisecond move in the next page
      // await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => A02_HomePage()));
      await context.vxNav.push(Uri.parse(A08_MyRoutes.homeRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

}



// video complete till 2:30 min
