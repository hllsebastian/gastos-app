import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/design/gastos_themes.dart';
import 'package:practice_1/models/transaction_detail_mounth.dart';
import 'package:practice_1/models/user.dart';
import 'package:practice_1/pages/all_transactions.dart';
import 'package:practice_1/pages/home_page.dart';
import 'package:practice_1/pages/login_page.dart';
import 'package:practice_1/pages/new_page.dart';
import 'package:practice_1/pages/other_page.dart';
import 'package:practice_1/pages/sign_in_page.dart';

class PracticeOneApp extends StatelessWidget {
  const PracticeOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userData: User(name: '', age: 0),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: GastosThemes.defaulTheme,
        // home: const HomePage(),
        // routes: {
        //   AppRoutes.detailsPage: (context) => const HomePage(),
        //   AppRoutes.newpage: (context) => const NewPage(),
        //   AppRoutes.otherPage: (context) => const OtherPage(
        //         userData: User(name: '', age: 0),
        //       ),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case (AppRoutes.registerNowPage):
              return MaterialPageRoute(builder: (context) => const SignInPage());
            case (AppRoutes.homePage):
              return MaterialPageRoute(
                  builder: (context) => const HomePage(/* storeName: settings.arguments as String */));
            case (AppRoutes.newpage):
              return MaterialPageRoute(builder: (context) => const NewPage());
            case (AppRoutes.otherPage):
              return MaterialPageRoute(
                  builder: (context) => const OtherPage(/* userData: settings.arguments as User */));
            case (AppRoutes.allTransactionsPage):
              return MaterialPageRoute(
                  builder: (context) =>
                      AllTransactions(listOftransactions: settings.arguments as List<TransactionDetailByMounth>?));
            default:
              // return MaterialPageRoute(
              //     builder: (context) => const HomePage(
              //           storeName: 'Don Saitama',
              //         ));
              return MaterialPageRoute(builder: (context) => const LogInPage());
          }
        },
      ),
    );
  }
}
