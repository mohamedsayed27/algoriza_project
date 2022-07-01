import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';
import 'boarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> boarding = [
    BoardingModel(
      bodyTitle: 'Get food delivery to your doorstep asap',
      title: 'we have young and professional delivery team that will bring your food as soon as possible to your doorstep ',
      img: 'assets/images/Take Away-pana.png',
    ),
    BoardingModel(
      bodyTitle: 'Buy Any Food from your favorite restaurant',
      title: 'we are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
      img: 'assets/images/Order food-rafiki.png',
    ),
    BoardingModel(
      bodyTitle: 'Get exclusive offer from your favorite restaurant',
      title: 'we are constantly bringing your favorite food from your favorite restaurants with various types of offers',
      img: 'assets/images/Order food-pana.png',
    ),
  ];
  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: MaterialButton(onPressed: (){}, child: Text('Skip'),color: Colors.white60,),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             Expanded(
                child: PageView.builder(
                  controller: pageViewController,
                  itemBuilder: (context, index) {
                return buildBorderItem(boarding[index]);
                  },
                  itemCount: boarding.length,
                ),
              ),
            Column(
              children: [
                SmoothPageIndicator(
                  controller: pageViewController,
                  count: boarding.length,
                  effect:  ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 2,
                      dotWidth: 10,
                      spacing: 2.0,
                      activeDotColor: Colors.teal.shade600),
                ),
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text('Get started',style: TextStyle(fontSize: 20),),
                    color: Color(0xff008080),
                    minWidth: double.infinity,
                    height: 50,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ? ',style: TextStyle(fontWeight: FontWeight.bold)),
                    InkWell(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));},child: const Text('Sign up',style: TextStyle(color: Color(0xff008080),fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBorderItem(BoardingModel model) {
    return Column(
      children: [
        SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(model.img)
        ),
        const SizedBox(
          height: 20,
        ),
        Text(model.bodyTitle,
            style:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400 ), textAlign: TextAlign.center,)
      ],
    );
  }
}
