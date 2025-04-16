import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/section%202/Congra_screen.dart';
import 'package:foodtek/view/screens/section%202/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../controller/lang_controller.dart';
import '../../../controller/login_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController newPassTextEditingController =
      TextEditingController();
  final TextEditingController confirmPassTextEditingController =
      TextEditingController();

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
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.43,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_sharp),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                      AppLocalizations.of(context)!.reset_password,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                      AppLocalizations.of(context)!.want_to_try_with_my_current_password,
                        style: TextStyle(fontSize: 10),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TextFormField(
                    controller: newPassTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      label: Text(AppLocalizations.of(context)!.new_password),
                      fillColor: Colors.white,
                      //  labelText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),

                      // errorText:
                      // loginController.showErrorPassword
                      //     ? "Enter Your Password"
                      //     : null,
                    ),
                  ),
                  SizedBox(height: 10),

                  TextFormField(
                    controller: confirmPassTextEditingController,
                    //put in login controller
                    obscureText: loginController.obscureTextPassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: AppLocalizations.of(context)!.confirm_new_password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),

                      // errorText:
                      // loginController.showErrorPassword
                      //     ? "Enter Your Password"
                      //     : null,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      loginController.checkPassword(
                        password:
                            newPassTextEditingController
                                .text, //put in login controller
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CongraScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 9,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
    AppLocalizations.of(context)!.update_password,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
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
