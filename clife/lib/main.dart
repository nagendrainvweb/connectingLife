import 'package:clife/app/app_repo.dart';
import 'package:clife/app/locator.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/screens/dashboard/dashboard_page.dart';
import 'package:clife/screens/intro_screens/intro_page.dart';
import 'package:clife/screens/login/login_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  setUpLocator();
  setupDialogUi();
  final model = AppRepo();
  await model.init();
  final login = await Prefs.login;
  myPrint("start login is $login");
  runApp(MyApp(
    repo: model,
    login: login,
  ));
}

final routies = {
  '/HomePage': (BuildContext context) => DashboardPage(),
  '/LoginPage': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  final AppRepo repo;
  final bool login;

  const MyApp({Key key, @required this.repo, @required this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AppRepo>.value(value: repo)],
      child: MaterialApp(
        color: AppColors.backgroundColor,
        //title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              brightness: Brightness.light
            ),
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
       // home: (repo.introDone) ?(login) ?DashboardPage() : LoginPage():IntroPage(),
        home: (repo.introDone) ?DashboardPage() :IntroPage(),
        routes: routies,
      ),
    );
  }
}
