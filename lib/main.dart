import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanbuy/provider/user_provider.dart';
import 'package:urbanbuy/screens/auth_services.dart';
import 'package:urbanbuy/screens/cart/cart_model.dart';
import 'package:urbanbuy/screens/loginsignup/signup.dart';
import 'package:urbanbuy/screens/walletandsplash/splash.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Urban-buy',
        home: SafeArea(
          child: Provider.of<UserProvider>(context).user.token.isEmpty
              ? const SignUp()
              : HomeScreen(),
        ),
      ),
    );
  }
}
