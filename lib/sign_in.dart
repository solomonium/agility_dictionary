import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String name = '';
  String pwd = '';

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signInUser() {
    if (formKey.currentState!.validate()) {
      setState(() {
        name = username.text;
        pwd = password.text;
      });
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => Homepage(
      //               username: name,
      //               password: pwd,
      //             )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in Form'),
          backgroundColor: Colors.pinkAccent.withOpacity(0.3),
        ),
        body: Form(
          key: formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username:'),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text('Password:'),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: signInUser,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    child: Text('Sign in'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
