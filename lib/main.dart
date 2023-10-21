import 'package:flutter/material.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/utitlities/routes/routes.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesNames.login,
        onGenerateRoute: Routes.genrateRoutes,
      ),
    );
  }
}
