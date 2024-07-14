import 'package:duaya_app/common/styles/spacing_styles.dart';
import 'package:duaya_app/features/authentication/presentation/login/widgets/login_form.dart';
import 'package:duaya_app/features/authentication/presentation/login/widgets/login_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: DSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              DLoginHeader(),

              /// Form
              DLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
