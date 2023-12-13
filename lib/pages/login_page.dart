import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/gastos_themes.dart';
import 'package:practice_1/design/practice_one_colors.dart';
import 'package:practice_1/pages/helpers/validate_input.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  bool checkBoxState = false;
  TextEditingController userInputController = TextEditingController();
  double titleSize = 50;
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 90, 16, 50),
        child: Center(
          child: Column(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 30, end: titleSize),
                curve: Curves.elasticIn,
                duration: const Duration(seconds: 4),
                onEnd: () {
                  setState(() {
                    titleSize = titleSize == 50 ? 13 : 50;
                  });
                },
                builder: (context, sizeText, _) {
                  return Text(
                    GastosTexts.welcome,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: sizeText),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 39),
                child: Text(
                  GastosTexts.pleaseAuth,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                          validator: (value) => validateInput(value),
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
                          validator: (value) => validateInput(value, true),
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
                          checkColor: GastosColors.brandLightColor,
                          activeColor: GastosColors.brandPrimaryColor,
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
                            UserProvider.of(context).userData.name = storeName;
                            Navigator.of(context).pushReplacementNamed(AppRoutes.homePage /* , arguments: storeName */);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GastosColors.brandPrimaryColor,
                            shape: RoundedRectangleBorder(borderRadius: GastosThemes.borderRadius)),
                        child: Text(
                          GastosTexts.logIn,
                          style: const TextStyle(color: GastosColors.brandLightColor),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: GastosColors.brandLightColorBorder,
                          thickness: 1.0,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(GastosTexts.orContinue),
                        ),
                        const Expanded(
                            child: Divider(
                          color: GastosColors.brandLightColorBorder,
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
                          decoration: BoxDecoration(
                              color: GastosColors.brandSecondaryColor, borderRadius: GastosThemes.borderRadius),
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
                          decoration: BoxDecoration(
                              color: GastosColors.brandSecondaryColor, borderRadius: GastosThemes.borderRadius),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(GastosTexts.notAMember),
                        TextButton(
                          child: Text(
                            GastosTexts.registerNow,
                            style: const TextStyle(color: GastosColors.brandPrimaryColor, fontSize: 13),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.registerNowPage);
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
