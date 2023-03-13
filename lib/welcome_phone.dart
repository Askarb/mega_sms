import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/app_fonts.dart';
import 'package:flutter_application_1/assets/app_images.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/code_page.dart';
import 'package:flutter_application_1/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePhone extends StatelessWidget {
  WelcomePhone({super.key});

  final controller = TextEditingController(text: '996550686806');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.bg),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 84),
            child: RotatedBox(
              quarterTurns: 4,
              child: Image.asset(
                AppImages.circle,
                width: 215,
                height: 215,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 84, top: 470),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                AppImages.circle,
                width: 284,
                height: 284,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 185),
            child: Container(
              width: 428,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white.withOpacity(0.35),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Welcome",
                    style: AppFonts.w600s25.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 309,
                    height: 57,
                    child: TextFieldWidget(
                      hintText: 'Phone',
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      print(state);
                      if (state is AuthSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodePage(),
                          ),
                        );
                      } else if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.length == 12) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SendPhoneRequest(phoneNumber: controller.text),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Номер введите в формате 996555123456'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: AppFonts.w600s15.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Are you a new user?',
                        style: AppFonts.w600s15.copyWith(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: AppFonts.w600s15.copyWith(
                            color: const Color(0xff02FFF0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
