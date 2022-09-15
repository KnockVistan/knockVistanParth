import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phew/screens/signIn.dart';
import 'package:phew/screens/verification.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            page1(),
            SignUpForm(),
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool checkedValue = false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
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
                  "Sign Up",
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: HexColor("#e1e1e1")))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(color: HexColor('#707070')),
                              ),
                              InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                textFieldController: controller,
                                formatInput: false,
                                inputDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "",
                                    suffixIcon:
                                        Icon(Icons.phone_android_sharp)),
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                onSaved: (PhoneNumber number) {
                                  print('On Saved: $number');
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: HexColor("#e1e1e1")))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OR Sign Up using Email address",
                                style: TextStyle(color: HexColor('#707070')),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "",
                                    suffixIcon: Icon(Icons.email_outlined)),
                              ),
                            ],
                          ),
                        ),

                        // CheckboxListTile(
                        //   title: Text('Remember me'),
                        //   contentPadding: EdgeInsets.all(0),
                        //   activeColor: Theme.of(context).primaryColor,
                        //   value: checkedValue,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       checkedValue = newValue!;
                        //     });
                        //   },
                        //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        // ),
                        SizedBox(
                          height: 40,
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.topToBottomJoined,
                                    duration: Duration(milliseconds: 300),
                                    child: const Verification(),
                                    childCurrent: SignUp()));
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
                              "Verification",
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
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.topToBottomJoined,
                                    duration: Duration(milliseconds: 300),
                                    child: const SignIn(),
                                    childCurrent: SignUp()));
                          },
                          child: Text(
                            "Terms Of Use",
                            style: TextStyle(color: HexColor("#707070")),
                          )),
                      Text("|"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.topToBottomJoined,
                                    duration: Duration(milliseconds: 300),
                                    child: const SignIn(),
                                    childCurrent: SignUp()));
                          },
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(color: HexColor("#707070")),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
