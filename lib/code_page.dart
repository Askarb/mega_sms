import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/app_fonts.dart';
import 'package:flutter_application_1/assets/app_images.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodePage extends StatelessWidget {
  CodePage({super.key});

  final controller = TextEditingController();
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
                    "Code virify",
                    style: AppFonts.w600s25.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 309,
                    height: 57,
                    child: TextFieldWidget(
                      hintText: 'Code',
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is CodeSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('SuccessCode'),
                          ),
                        );
                      } else if (state is CodeError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.length == 4) {
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   SendCodeRequest(code: controller.text),
                          // );
                          BlocProvider.of<AuthBloc>(context).add(
                            SendCodeRequest(code: controller.text),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Длина кода должна быть равна: 4'),
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
                        'Send',
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
