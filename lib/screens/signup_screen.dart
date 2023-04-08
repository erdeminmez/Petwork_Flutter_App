import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petwork/utils/colors.dart';
import 'package:petwork/widgets/text_field_input.dart';
import 'package:petwork/resources/auth_methods.dart';
import 'package:petwork/utils/utils.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:petwork/responsive/responsive_layout_screen.dart';
import 'package:petwork/responsive/mobile_screen_layout.dart';
import 'package:petwork/responsive/web_screen_layout.dart';
import 'package:petwork/screens/login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _phoneController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      bio: _bioController.text,
      phone: _phoneController.text,
    );

    setState(() {
      _isLoading = false;
    });
    
    if (res != 'success') {
      showSnackBar(res, context);
    }
    else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
      );

    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              //image
              Image.asset('assets/petwork.png', height: 64,),
              const SizedBox(height: 64,),
              // circular-avatar
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              //textfield input for email
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 24,),
              //textfiled input for password
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              //button login
              TextFieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.emailAddress,
                textEditingController: _bioController,
              ),
              const SizedBox(height: 24,),
              TextFieldInput(
                hintText: 'Enter your phone',
                textInputType: TextInputType.emailAddress,
                textEditingController: _phoneController,
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading ?
                  const Center(child: CircularProgressIndicator(color: primaryColor,),)
                  : const Text('Sign up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(4)
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),
              //transition to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        "Login.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

