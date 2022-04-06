import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';
import 'package:medicine_remainder_app/screens/Reminder/add_reminder.dart';
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
        home: MainScreen(),
        routes: {
          // LoginScreen.routeName: (ctx) => LoginScreen(),
          // SignUpScreen.routeName:(ctx) => SignUpScreen(),
          AddReminderPage.routeName:(ctx) => const AddReminderPage(),
          MainScreen.routeName:(ctx) =>const MainScreen(),
          AddReminderPage.routeName:(ctx) => const AddReminderPage(),
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
