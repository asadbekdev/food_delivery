import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/components/body.dart';
import 'package:food_delivery/services/auth_service.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF2F2F2),
      body: Body(authMethods: AuthService()),
    );
  }
}
