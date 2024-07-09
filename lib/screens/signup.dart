import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _cpasswordField = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  String? cpasswordErrorText;

  String? _emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Oops! Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(email)) {
      return 'Oops! Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Oops! Please enter your password';
    } else if (!RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
        .hasMatch(password)) {
      return 'Minimum 8 characters, must contain at least one lowercase letter, one uppercase letter, one digit and one special character';
    }
    return null;
  }

  String? _cpasswordValidator(String? cpassword) {
    if (cpassword == null || cpassword.isEmpty) {
      return 'Oops! Please re-enter your password';
    } else if (cpassword != _passwordField.text) {
      return 'Oops! Passwords do not match';
    } else if (!RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
        .hasMatch(cpassword)) {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Test Application',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Sign Up to Application',
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
                        TextFormField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Re-enter password*',
                              hintText: 'Re-enter your Password',
                              prefixIcon: const Icon(Icons.vpn_key),
                              errorText: cpasswordErrorText,
                              suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(_obscureText == true
                                      ? Icons.visibility_off
                                      : Icons.visibility))),
                          controller: _cpasswordField,
                          obscureText: _obscureText,
                          validator: _cpasswordValidator,
                        ),
                        const SizedBox(height: 20.0),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            child: const Row(
                              children: [
                                Text('Already have an account?'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Log in',
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
                              String? cpasswordError =
                                  _cpasswordValidator(_cpasswordField.text);
                              emailErrorText = emailError;
                              passwordErrorText = passwordError;
                              cpasswordErrorText = cpasswordError;

                              if (_emailField.text == staticEmail &&
                                  _passwordField.text == staticPassword &&
                                  cpasswordErrorText == null) {
                                Navigator.pushReplacementNamed(
                                    context, '/mainhome',
                                    arguments: staticEmail);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(110, 50)),
                          child: const Text('Sign Up',
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
                                backgroundColor:
                                    const Color.fromARGB(255, 199, 36, 14),
                                minimumSize: const Size(105, 45)),
                            onPressed: () {},
                            child: const Text(
                              'Sign up with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
