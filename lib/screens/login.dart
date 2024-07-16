import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;

  String? _emailValidator(String? email) {
    if (email == null || email.isEmpty || email != staticEmail) {
      return 'Oops! Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(email)) {
      return 'Oops! Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password == null || password.isEmpty || password != staticPassword) {
      return 'Oops! Please enter your password';
    } else if (!RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
        .hasMatch(password)) {
      return 'Minimum 8 characters, must contain at least one lowercase letter, one uppercase letter, one digit and one special character';
    }
    return null;
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final String staticEmail = 'chlarenzterrones@gmail.com';
  final String staticPassword = '@Renz1214';

  @override
  void dispose() {
    _emailField.dispose();
    _passwordField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/p1.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: const Color.fromARGB(179, 255, 255, 255),
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Log Into Application',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Email*',
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(Icons.alternate_email),
                                errorText: emailErrorText,
                              ),
                              controller: _emailField,
                              keyboardType: TextInputType.emailAddress,
                              validator: _emailValidator,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Password*',
                                  hintText: 'Enter your Password',
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  errorText: passwordErrorText,
                                  suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(_obscureText == true
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                              controller: _passwordField,
                              obscureText: _obscureText,
                              validator: _passwordValidator,
                            ),
                            const SizedBox(height: 20.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signup');
                                },
                                child: const Row(
                                  children: [
                                    Text('Don\'t have an account?'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  String? emailError =
                                      _emailValidator(_emailField.text);
                                  String? passwordError =
                                      _passwordValidator(_passwordField.text);
                                  emailErrorText = emailError;
                                  passwordErrorText = passwordError;

                                  String email = staticEmail;

                                  if (_emailField.text == staticEmail &&
                                      _passwordField.text == staticPassword) {
                                    Navigator.pushReplacementNamed(
                                        context, '/mainhome',
                                        arguments: email);
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  minimumSize: const Size(110, 50)),
                              child: const Text('Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    minimumSize: const Size(105, 45)),
                                onPressed: () {},
                                child: SizedBox(
                                  width: 230.0,
                                  child: ListTile(
                                    onTap: () {},
                                    leading: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/g.png'),
                                    ),
                                    title: const Text(
                                      'Sign In with Google',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
