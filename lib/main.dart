import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';
import 'package:medicine_remainder_app/screens/Login/login_screen.dart';
import 'package:medicine_remainder_app/screens/Profiles/add_user.dart';
import 'package:medicine_remainder_app/screens/Reminder/add_reminder.dart';
import 'package:medicine_remainder_app/screens/Signup/signup_screen.dart';
import 'package:medicine_remainder_app/screens/Welcome/welcome_screen.dart';
import 'package:medicine_remainder_app/screens/main_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,  
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        // home: WelcomeScreen(),
        home: WelcomeScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routeName:(ctx) => SignUpScreen(),
          MainScreen.routeName:(ctx) =>const MainScreen(),
          AddReminderPage.routeName:(ctx) => const AddReminderPage(),
          AddUserPage.routeName:(ctx) => const AddUserPage()

        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
