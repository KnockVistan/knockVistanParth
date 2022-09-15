import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phew/screens/homeScreen.dart';
import 'package:phew/screens/signUp.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            page1(),
            SignInForm(),
          ],
        ));
  }
}

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: 0,
      child: Container(
        height: ScreenHeight * 0.5,
        width: ScreenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                )
              ],
            ),
            Image(
              width: ScreenWidth * 0.65,
              image: AssetImage('assets/images/logo1.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool checkedValue = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 0,
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
              ),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Mobile Number OR Email Address"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Password",
                              //contentPadding: EdgeInsets.only(top: 20)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CheckboxListTile(
                          title: Text('Remember me'),
                          contentPadding: EdgeInsets.all(0),
                          activeColor: Theme.of(context).primaryColor,
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         type: PageTransitionType.topToBottomJoined,
                            //         duration: Duration(milliseconds: 300),
                            //         child: const SignIn(),childCurrent: HomeSplash()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 17),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                                child: Text(
                              "SignIn",
                              style: TextStyle(fontSize: 16),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.topToBottomJoined,
                                    duration: Duration(milliseconds: 300),
                                    child: const SignUp(),
                                    childCurrent: HomeSplash()));
                          },
                          child: Text("Sign Up."))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
