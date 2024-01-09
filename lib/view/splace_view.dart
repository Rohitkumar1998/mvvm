import 'package:flutter/material.dart';
import 'package:mvvm/view/servieces.dart/splace_servies.dart';

class SplceView extends StatefulWidget {
  const SplceView({super.key});

  @override
  State<SplceView> createState() => _SplceViewState();
}

class _SplceViewState extends State<SplceView> {
  SplashServies splashServies = SplashServies();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServies.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Splace Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
