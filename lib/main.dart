import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas4tpm/provider/bil_prima_provider.dart';
import 'package:tugas4tpm/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BilPrimaProvider(),
      child: MaterialApp(
        theme:  ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}