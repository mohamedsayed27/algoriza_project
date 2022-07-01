import 'package:algoriza_project/presentation/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';

import '../../../business_logic/register_cubit/RegCubit.dart';
import '../../../business_logic/register_cubit/RegStates.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var button = Buttons.Google;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
          builder: (context , state) {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Stack(
                      children:  [
                        Image(image: AssetImage('assets/images/photo.jfif'),width: double.infinity,fit: BoxFit.cover,),
                        Positioned(
                          top: 50,
                            left: 20,
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.arrow_back_ios),),
                            ),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to Fashion Daily',style: Theme.of(context).textTheme.caption,) ,
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text('Register',style:  TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                const Spacer(),
                                Row(
                                  children: const [
                                     Text('Help' ,style: TextStyle(color: Colors.teal),),
                                     SizedBox(width: 5,),
                                     Icon(Icons.help,color: Colors.teal,)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: const Text('Email'),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultFormField(
                              label: 'Eg.eg@example.com',
                                onChange: (){},
                                controller: emailController,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: const Text('phone'),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultFormField(
                              label: 'Eg.0122222222',
                                onChange: (){},
                                controller: phoneNumberController,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DropdownButton<String>(
                                    items: ShopRegisterCubit.get(context).items.map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item))).toList(),
                                    onChanged: (item){
                                      ShopRegisterCubit.get(context).onDropDownButtonChanged(item!);
                                    },
                                    value: ShopRegisterCubit.get(context).selectedItem,
                                    dropdownColor: Colors.white,
                                    elevation: 0,
                                  ),
                                )
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: const Text('password'),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultFormField(
                              label: 'password',
                                onChange: (){},
                                controller: passwordController,
                            ),
                            const SizedBox(height: 20,),
                            ClipRRect(
                              borderRadius: const BorderRadius.all( Radius.circular(15.0)),
                              child: MaterialButton(
                                onPressed: (){},
                                child: const Text('sign in',style:  TextStyle(fontSize: 20,color: Colors.white),),
                                color: Colors.teal,
                                minWidth: double.infinity,
                                height: 50,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Expanded(child: Container(height: 1,color: Colors.teal,)),
                                const SizedBox(width: 5,),
                                const Text('OR'),
                                const SizedBox(width: 5,),
                                Expanded(child: Container(height: 1,color: Colors.teal.shade800,)),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
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
                                    const Text('Sign in with google')
                                  ],),
                                color: Colors.white,
                                minWidth: double.infinity,
                                height: 50,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Has any account ? ',style: TextStyle(fontWeight: FontWeight.bold)),
                                InkWell(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},child:  Text('Sign in',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('By registering your account you are agree to our terms and conditions LOOK to it',textAlign: TextAlign.center,style: Theme.of(context).textTheme.caption,),
                                Text('Terms and Conditions',textAlign: TextAlign.center,style:  TextStyle(color: Colors.teal),)
                              ],
                            ), //
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
