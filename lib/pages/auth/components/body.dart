// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/auth/components/login_section.dart';
import 'package:food_delivery/pages/auth/components/signup_section.dart';
import 'package:food_delivery/pages/home/components/zoom_drawer.dart';
import 'package:food_delivery/services/auth_service.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  final AuthMethods? authMethods;
  Body({Key? key, this.authMethods}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController? _emailControllerLogin = TextEditingController();
  TextEditingController? _passwordControllerLogin = TextEditingController();
  TextEditingController? _emailControllerSignUp = TextEditingController();
  TextEditingController? _passwordControllerSignUp = TextEditingController();
  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: kRedColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //HEADER SECTION
                Container(
                  height: getProportionScreenHeight(300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      //LOGO SECTION
                      Container(
                        width: getProportionScreenWidth(100.0),
                        child: Image.asset(
                          "assets/images/bella_olonje_logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      //TABBAR SECTION
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kPadding * 1.5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: TabBar(
                                  indicatorColor: Color(0xFFFA4A0C),
                                  controller: _tabController,
                                  tabs: List.generate(
                                    2,
                                    (index) => customTab(
                                        index == 0 ? "Login" : "Sign-up",
                                        context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //FORM SECTION
                Expanded(
                  child: Container(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // LOGIN AUTH SECTION
                        Container(
                          child: LoginSection(
                            emailController: _emailControllerLogin,
                            passwordController: _passwordControllerLogin,
                            formKey: _formKeyLogin,
                            onPressed: logIn,
                          ),
                        ),
                        // SIGNUP AUTH SECTION
                        Container(
                          child: SignUpSection(
                            emailController: _emailControllerSignUp,
                            passwordController: _passwordControllerSignUp,
                            formKey: _formKeySignUp,
                            onPressed: signUp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  customTab(text, context) => Tab(
        child: Text(
          "$text",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      );
  signUp() async {
    if (_formKeySignUp.currentState!.validate()) {
      _formKeySignUp.currentState!.save();
      setState(() {
        isLoading = true;
      });
      try {
        await widget.authMethods!.signUp(
            _emailControllerSignUp!.text, _passwordControllerSignUp!.text);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyDrawer()),
            (route) => false);
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("The password provided is too weak."),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("The account already exists for that email."),
            ),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("$e"),
          ),
        );
      }
    }
  }

  logIn() async {
    if (_formKeyLogin.currentState!.validate()) {
      _formKeyLogin.currentState!.save();
      setState(() {
        isLoading = true;
      });
      try {
        await widget.authMethods!.signIn(
            _emailControllerLogin!.text, _passwordControllerLogin!.text);
        if (widget.authMethods!.getCurrentUser() != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyDrawer()),
              (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found for that email.")),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user.")),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("$e"),
          ),
        );
      }
    }
  }
}
