import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/gastos_themes.dart';
import 'package:practice_1/design/practice_one_colors.dart';

class RegisterNowPage extends StatefulWidget {
  const RegisterNowPage({super.key});

  @override
  State<RegisterNowPage> createState() => _RegisterNowPageState();
}

class _RegisterNowPageState extends State<RegisterNowPage> {
  final formRegisterNowKey = GlobalKey<FormState>();
  bool checkBoxState = false;
  TextEditingController userInputController = TextEditingController();
  late String storeName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultContainerInputDecoration =
      BoxDecoration(color: GastosColors.brandErrorColor, borderRadius: GastosThemes.borderRadius);
  final activeContainerInputDecoration = BoxDecoration(
      color: GastosColors.brandSecondaryColor,
      border: Border.all(color: GastosColors.brandPrimaryColor, width: 2),
      borderRadius: GastosThemes.borderRadius);
  final defaultInputLabelTheme =
      const TextStyle(fontSize: 13, color: GastosColors.brandLigthDarkColor, fontWeight: FontWeight.normal);

  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: GastosColors.brandPrimaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 50),
        child: Column(
          children: [
            Text(
              GastosTexts.signIn,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 30),
            Text(GastosTexts.canContinue),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.08,
                  decoration:
                      BoxDecoration(color: GastosColors.brandSecondaryColor, borderRadius: GastosThemes.borderRadius),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/google_icon.png'),
                        width: 30,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        GastosTexts.google,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold, color: GastosColors.brandLigthDarkColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.08,
                  decoration:
                      BoxDecoration(color: GastosColors.brandSecondaryColor, borderRadius: GastosThemes.borderRadius),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/facebook_icon.png'),
                        width: 30,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        GastosTexts.facebook,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold, color: GastosColors.brandLigthDarkColor),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: GastosColors.brandLightColorBorder,
                  thickness: 1.0,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(GastosTexts.or),
                ),
                const Expanded(
                    child: Divider(
                  color: GastosColors.brandLightColorBorder,
                  thickness: 1.0,
                )),
              ],
            ),
            Form(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.only(left: 24, bottom: 4),
                    decoration: userContainerDecoration,
                    child: TextFormField(
                        controller: userInputController,
                        style: Theme.of(context).textTheme.labelSmall,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return GastosTexts.emptyFieldError;
                          }
                          if (value.length >= 10) {
                            return GastosTexts.lengthFieldError;
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            userContainerDecoration = activeContainerInputDecoration;
                            pswContainerDecoration = defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            userContainerDecoration = defaultContainerInputDecoration;
                          });
                        },
                        onSaved: (userNameValue) {
                          storeName = userNameValue!;
                        },
                        decoration: InputDecoration(
                            border: defaultInputBorder,
                            label: Text(
                              GastosTexts.emailLabel, /* style: defaultInputLabelTheme */
                            ))),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.only(left: 24, bottom: 4),
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    decoration: pswContainerDecoration,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return GastosTexts.emptyFieldError;
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            pswContainerDecoration = activeContainerInputDecoration;
                            userContainerDecoration = defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            pswContainerDecoration = defaultContainerInputDecoration;
                          });
                        },
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            border: defaultInputBorder,
                            label: Text(GastosTexts.passwordlLabel),
                            labelStyle: defaultInputLabelTheme)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (p) {}),
                RichText(
                  text: TextSpan(
                    text: GastosTexts.iAgreeWith,
                    style: const TextStyle(color: GastosColors.brandDarkColor),
                    children: [
                      TextSpan(text: GastosTexts.terms, style: const TextStyle(color: GastosColors.brandPrimaryColor)),
                      TextSpan(
                        text: GastosTexts.and,
                        style: const TextStyle(color: GastosColors.brandDarkColorOpacity),
                      ),
                      TextSpan(
                          text: GastosTexts.privacy, style: const TextStyle(color: GastosColors.brandPrimaryColor)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: GastosColors.brandPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: GastosThemes.borderRadius)),
                child: Text(
                  GastosTexts.getStarted,
                  style: const TextStyle(color: GastosColors.brandLightColor),
                ),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Divider(thickness: 1.0),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: GastosTexts.alreadyHaveAccount),
              TextSpan(
                text: GastosTexts.logIn,
                style: const TextStyle(
                  color: GastosColors.brandPrimaryColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, AppRoutes.loginPage);
                  },
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
