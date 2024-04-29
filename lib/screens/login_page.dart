import 'package:flutter/material.dart';
import 'package:tugas4tpm/screens/home_page.dart';
import 'package:tugas4tpm/screens/login_page.dart';

class LoginPage extends StatefulWidget {
  final String? message;

  const LoginPage({Key? key, this.message}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  String? message;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    message = widget.message;
  }

  Widget _inputField(String hintText,
      {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (hintText == 'Email' && !value!.contains('@')) {
            return 'Email tidak valid';
          }
          if (isPassword && value!.length < 8) {
            return 'Password harus lebih dari 8 karakter';
          }
          return null;
        },
      ),
    );
  }

  Widget _elevatedButton(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 0.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (userController.text == "user@gmail.com" && passController.text == "12345678") {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } else {
              setState(() {
                message = "Login Gagal";
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message!)));
            }
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(380, 60),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
                    child: SizedBox(
                      width: 260,
                      child: Image.asset('images/signIn.png'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 30.0),
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  _inputField("Email", controller: userController),
                  _inputField("Password", controller: passController, isPassword: true),
                  if (message != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 20.0, 8.0, 0.0),
                      child: Text(message!,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  _elevatedButton("Login", context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}