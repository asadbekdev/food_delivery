// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';

class LoginSection extends StatelessWidget {
  final onPressed, emailController, passwordController, formKey;
  LoginSection(
      {Key? key,
      this.emailController,
      this.passwordController,
      this.formKey,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kPadding * 2),

            //EMAIL FIELD SECTION
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: emailController,
              cursorColor: Colors.black,
              obscureText: false,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (val) {
                var regex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (regex.hasMatch(val!)) {
                  return null;
                } else {
                  return "Enter correct email";
                }
              },
            ),
            SizedBox(height: kPadding * 1.5),
            // PASSWORD FIELD SECTION
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (val) {
                if (val == null || val.length < 6) {
                  return "Enter 6 characters at least";
                }
              },
            ),
            SizedBox(height: kPadding * 2 - 10),

            // FORGOT PASSWORD SECTION
            Text(
              "Forgot Passcode?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.red, fontWeight: FontWeight.w400),
            ),
            Spacer(),

            // BUTTON FIELD SECTION
            CustomButton(
              // to determine Login page or not
              text: "Login",
              textColor: kTextColor,
              primary: kRedColor,
              onPressed: onPressed,
            ),
            SizedBox(height: kPadding),
          ],
        ),
      ),
    );
  }
}
