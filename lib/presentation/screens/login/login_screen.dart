import 'package:algoriza_project/business_logic/login_cubit/cubit.dart';
import 'package:algoriza_project/business_logic/login_cubit/states.dart';
import 'package:algoriza_project/presentation/components.dart';
import 'package:algoriza_project/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  var phoneNumberController = TextEditingController();
   var button = Buttons.Google;

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , ShopLoginStates>(
          builder: (context , state) {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image(image: AssetImage('assets/images/photo.jfif'),fit: BoxFit.cover,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to Fashion Daily',style: Theme.of(context).textTheme.caption,) ,
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('Sign in',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Row(
                                  children: const [
                                    Text('Help' ,style: TextStyle(color: Colors.teal),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.help,color: Colors.teal,)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            const Padding(
                              padding:  EdgeInsets.only(left: 8.0),
                              child:  Text('phone'),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            defaultFormField(
                              onChange: (){},
                                controller: phoneNumberController,
                                label: 'eg.01222222222',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DropdownButton<String>(
                                    items: ShopLoginCubit.get(context).items.map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item))).toList(),
                                    onChanged: (item){
                                      ShopLoginCubit.get(context).onDropDownButtonChanged(item!);
                                    },
                                    value: ShopLoginCubit.get(context).selectedItem,
                                    dropdownColor: Colors.white,
                                    elevation: 0,
                                  ),
                                )
                            ),
                            SizedBox(height: 30,),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              child: MaterialButton(
                                onPressed: (){},
                                child: Text('sign in',style: TextStyle(fontSize: 20,color: Colors.white),),
                                color: Colors.teal,
                                minWidth: double.infinity,
                                height: 50,
                              ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              children: [
                                Expanded(child: Container(height: 1,color: Colors.teal.shade800,)),
                                SizedBox(width: 5,),
                                Text('OR'),
                                SizedBox(width: 5,),
                                Expanded(child: Container(height: 1,color: Colors.teal.shade800,)),
                              ],
                            ),
                            SizedBox(height: 25,),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              child: MaterialButton(
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Image(image: AssetImage(
                                    button == Buttons.Google
                                        ? 'assets/logos/google_light.png'
                                        : 'assets/logos/google_dark.png',
                                    package: 'flutter_signin_button',
                                  ),),
                                  Text('Sign in with google')
                                ],),
                                color: Colors.white,
                                minWidth: double.infinity,
                                height: 50,
                              ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account ? ',style: TextStyle(fontWeight: FontWeight.bold)),
                                InkWell(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));},child:  Text('Sign up',style: TextStyle(color: Colors.teal.shade800,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text('Use the application according to policy rules. Any kinds of violations will be subject to sanctions',textAlign: TextAlign.center,style: Theme.of(context).textTheme.caption,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context , state) {}),
    );
  }
}
