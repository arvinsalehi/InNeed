import 'package:flutter/material.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: Column(
            children: [
              Assets.img.icons.logo.svg(
                width: 120,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState((() {
                                    selectedTabIndex = loginTab;
                                  }));
                                },
                                child: Text(
                                  "LOGIN",
                                  style: tabTextStyle.apply(color: selectedTabIndex == 0? Colors.white: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTabIndex = signUpTab;
                                  });
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: tabTextStyle.apply(color: selectedTabIndex == 1? Colors.white: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.surface,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32))),
                          child: SingleChildScrollView(
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 48, 32, 32),
                                child: selectedTabIndex == 0
                                    ? _Login(themeData: themeData)
                                    : _SignUp(themeData: themeData)
                                // child: _Login(themeData: themeData),
                                ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Sign in with your account",
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 12,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: (() {}),
            child: const Text("LOGIN")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot you password?"),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: (() {}), child: const Text("Reset Here"))
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Center(
          child: Text(
            "OR SIGN IN WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 34,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 34,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "please enter your information",
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 12,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("First Name")),
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Last Name")),
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: (() {}),
            child: const Text("SING UP")),
        const SizedBox(
          height: 32,
        ),
        const Center(
          child: Text(
            "OR SIGN UP WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 34,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 34,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text("Password"),
        suffix: InkWell(
          onTap: (() {
            setState(() {
              obscureText = !obscureText;
            });
          }),
          child: Text(
            obscureText ? "Show" : "Hide",
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
