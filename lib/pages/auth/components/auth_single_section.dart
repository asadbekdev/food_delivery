// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:food_delivery/components/custom_button.dart';
// import 'package:food_delivery/constants.dart';

// class AuthSingleSection extends StatelessWidget {
//   var formKey,
//       emailController,
//       passwordController,
//       phoneNumberController,
//       onPressed,
//       detect;
//   AuthSingleSection(
//       {Key? key,
//       this.formKey,
//       this.emailController,
//       this.passwordController,
//       this.phoneNumberController,
//       this.onPressed,
//       this.detect})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
//       child: Form(
//         key: formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: kPadding * 2),

//             //EMAIL FIELD SECTION
//             customTextField(
//               context,
//               controller: emailController,
//               labelText: "Email address",
//               obscureText: false,
//             ),
//             SizedBox(height: kPadding * 1.5),

//             // PHONE NUMBER FIELD SECTION
//             detect == false
//                 ? Column(
//                     children: [
//                       customTextField(
//                         context,
//                         controller: phoneNumberController,
//                         labelText: "Phone Number",
//                         obscureText: true,
//                       ),
//                       SizedBox(height: kPadding * 2 - 10),
//                     ],
//                   )
//                 : Container(),

//             // PASSWORD FIELD SECTION
//             customTextField(
//               context,
//               controller: passwordController,
//               labelText: "Password",
//               obscureText: true,
//             ),
//             SizedBox(height: kPadding * 2 - 10),

//             // FORGOT PASSWORD SECTION
//             Text(
//               "Forgot Passcode?",
//               style: Theme.of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(color: Colors.red, fontWeight: FontWeight.w400),
//             ),
//             Spacer(),

//             // BUTTON FIELD SECTION
//             CustomButton(
//               // to determine Login page or not
//               text: detect ? "Login" : "Sign-up",
//               textColor: kTextColor,
//               primary: kRedColor,
//               onPressed: onPressed,
//             ),
//             SizedBox(height: kPadding),
//           ],
//         ),
//       ),
//     );
//   }

//   TextFormField customTextField(BuildContext context,
//       {labelText, obscureText, controller}) {
//     return TextFormField(
//       controller: controller,
//       cursorColor: Colors.black,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: "$labelText",
//         labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
//             color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w400),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.black),
//         ),
//       ),
//       onFieldSubmitted: (v) {
//         FocusScope.of(context).unfocus();
//       },
//     );
//   }
// }
