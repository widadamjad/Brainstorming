import 'package:flutter/material.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/view/screens/section%203/home_screen.dart';
import 'package:foodtek/view/screens/section%202/rest_password_screen.dart';
import 'package:foodtek/view/screens/section%202/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passTextEditingController =
      TextEditingController();
  bool RememberMe = false;

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_photo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.69,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                  SizedBox(height: 2),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text:
                                AppLocalizations.of(
                                  context,
                                )!.dont_have_an_account,
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.sign_up,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 6),

                  Consumer<LoginController>(
                    builder: (context, loginController, child) {
                      return InputWidget(
                        obscureText: false,
                        textEditingController: emailTextEditingController,
                        label: AppLocalizations.of(context)!.email,
                        hintText: "Loisbakit@gmail.com",
                        errorText:
                            loginController.showErrorEmail
                                ? "Enter a valid Email"
                                : null,
                      );
                    },
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    controller: passTextEditingController,
                    obscureText: loginController.obscureTextPassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: AppLocalizations.of(context)!.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // errorText:
                      //     loginController.showErrorPassword
                      //         ? "Enter Your Password"
                      //         : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginController.changeObscureTextPassword();
                        },
                        icon: Icon(
                          loginController.obscureTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: RememberMe,
                            onChanged: (value) {
                              setState(() {
                                RememberMe = value!;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text(AppLocalizations.of(context)!.remember_me),
                        ],
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgot_password,
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 7),

                  TextButton(
                    onPressed: () {
                      loginController.checkEmail(
                        email: emailTextEditingController.text,
                      );
                      loginController.checkPassword(
                        password: passTextEditingController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 130,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    AppLocalizations.of(context)!.or,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  SizedBox(height: 6),

                  ElevatedButton.icon(
                    onPressed: () {
                      //add gmail here
                    },
                    icon: Icon(Icons.g_mobiledata_outlined, color: Colors.red),
                    label: Text(
                      AppLocalizations.of(context)!.continue_with_google,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 6),

                  ElevatedButton.icon(
                    onPressed: () {
                      //add facebook here
                    },
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    label: Text(
                      AppLocalizations.of(context)!.continue_with_facebook,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 6),

                  ElevatedButton.icon(
                    onPressed: () {
                      //add the apple here
                    },
                    icon: Icon(Icons.apple, color: Colors.black),
                    label: Text(
                      AppLocalizations.of(context)!.continue_with_apple,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 34,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white),
                      ),
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
}
