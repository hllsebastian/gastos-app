import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/practice_one_colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  var userInputController = TextEditingController();
  late String storeName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultContainerInputDecoration = const BoxDecoration(
      color: PracticeOneColors.brandErrorColor, borderRadius: BorderRadius.all(Radius.circular(12)));
  final activeContainerInputDecoration = BoxDecoration(
      color: PracticeOneColors.brandSecondaryColor,
      border: Border.all(color: PracticeOneColors.brandPrimaryColor, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(12)));
  final defaultInputLabelTheme =
      const TextStyle(fontSize: 13, color: PracticeOneColors.brandLigthDarkColor, fontWeight: FontWeight.normal);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 50),
        child: Center(
          child: Column(
            children: [
              Text(
                GastosTexts.welcome,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                child: Text(
                  GastosTexts.pleaseAuth,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formLoginKey,
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
                              label: Text(GastosTexts.emailLabel, style: defaultInputLabelTheme))),
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
                    Row(
                      children: [
                        Checkbox(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                          value: checkBoxState,
                          onChanged: (value) {
                            setState(() {
                              checkBoxState = !checkBoxState;
                            });
                          },
                          checkColor: PracticeOneColors.brandLightColor,
                          activeColor: PracticeOneColors.brandPrimaryColor,
                        ),
                        Expanded(child: Text(GastosTexts.rememberme)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            GastosTexts.recoveryPassword,
                            style: defaultInputLabelTheme,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 48),
                      width: 394,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formLoginKey.currentState!.validate()) {
                            print('Todos lo campos estan ok 🤯');
                            // _formLoginKey.currentState!.save();
                            storeName = userInputController.text;
                            Navigator.of(context).pushReplacementNamed(AppRoutes.homePage, arguments: storeName);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PracticeOneColors.brandPrimaryColor,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                        child: Text(
                          GastosTexts.orContinue,
                          style: const TextStyle(color: PracticeOneColors.brandLightColor),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: PracticeOneColors.brandLightColorBorder,
                          thickness: 1.0,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(GastosTexts.orContinue),
                        ),
                        const Expanded(
                            child: Divider(
                          color: PracticeOneColors.brandLightColorBorder,
                          thickness: 1.0,
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenSize.width * 0.4,
                          height: screenSize.height * 0.08,
                          decoration: const BoxDecoration(
                              color: PracticeOneColors.brandSecondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(
                              //   image: AssetImage('assets/images/google.png'),
                              //   width: 30,
                              // ),
                              const SizedBox(width: 12),
                              Text(
                                GastosTexts.google,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: PracticeOneColors.brandLigthDarkColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: screenSize.width * 0.4,
                          height: screenSize.height * 0.08,
                          decoration: const BoxDecoration(
                              color: PracticeOneColors.brandSecondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image(
                              //   image: AssetImage('assets/images/facebook.png'),
                              //   width: 30,
                              // ),
                              const SizedBox(width: 12),
                              Text(
                                GastosTexts.facebook,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: PracticeOneColors.brandLigthDarkColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(GastosTexts.notAMember),
                        TextButton(
                          child: Text(
                            GastosTexts.registerNow,
                            style: const TextStyle(color: PracticeOneColors.brandPrimaryColor, fontSize: 13),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, AppRoutes.registerNowPage);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
