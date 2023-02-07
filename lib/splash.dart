import 'package:flutter/material.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/onboarding.dart';


class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()))
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Assets.img.background.splashBackground.image(fit: BoxFit.cover))
        ],
      ),
    );
  }
}
