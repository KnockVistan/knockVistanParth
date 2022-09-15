import 'package:flutter/material.dart';
// import 'package:intro_slider/slide_object.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phew/screens/signIn.dart';
import 'package:phew/screens/signUp.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
class HomeSplash extends StatefulWidget {
  const HomeSplash({Key? key}) : super(key: key);

  @override
  State<HomeSplash> createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {


  late List<Widget> _pages;
  int activePage = 0;



  @override
  Widget build(BuildContext context) {

    _pages = [
      page1(),
      page2(),
      page3(),
    ];
    final controller = PageController();
    bool isFinished = false;

    return Scaffold(
      body: Stack(
        children: [
          CustomAppbar(),
          PageView(
            controller: controller,
            children: _pages,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(controller: controller, count: _pages.length, effect: WormEffect(
                    activeDotColor: Colors.amberAccent,
                    dotColor: Colors.grey,
                    dotWidth: 15,
                    dotHeight: 8,
                  ),),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.topToBottomJoined,
                              duration: Duration(milliseconds: 300),
                              child: const SignIn(),childCurrent: HomeSplash()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.amberAccent,
                      ),
                      child: Center(child: Text("SignIn",
                      style: TextStyle(
                        fontSize: 16
                      ),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      TextButton(onPressed: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.topToBottomJoined,
                                duration: Duration(milliseconds: 300),
                                child: const SignUp(),childCurrent: HomeSplash()));
                      }, child: Text("Sign Up."))
                    ],
                  )
                ],
              ),
            ),
          ),




        ],
      )
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
          )
        ),

        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text("Welcome to Phew",
                style: TextStyle(
                  //fontFamily: 'Poppins',

                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black

                ),),
            ],
          ),
        )

      ),
    );
  }
}


class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.65,
            image: AssetImage('assets/images/logo1.png'),
          ),
          SizedBox(height: 40,),
          Text("Phew-your guided messanger\nPhew try to manage knowledge, connection, entertainment. Even without knowing you.",textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

class page2 extends StatelessWidget {
  const page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.65,
            image: AssetImage('assets/images/logo1.png'),
          ),
          SizedBox(height: 40,),
          Text("Phew-your guided messanger""Phew try to manage knowledge, connection, entertainment. Even without knowing you.",textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

class page3 extends StatelessWidget {
  const page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.65,
            image: AssetImage('assets/images/logo1.png'),
          ),
          SizedBox(height: 40,),
          Text("Phew-your guided messanger""Phew try to manage knowledge, connection, entertainment. Even without knowing you.",textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}


