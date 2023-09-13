import 'package:flutter/material.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/utitlities/routes/utils.dart';
import 'package:mvvm/view/homeScreen.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> _obsecurePasssword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)),
            onFieldSubmitted: (value) {
              // it bassecally for go threw email to paasword
              // FocusScope.of(context).requestFocus(passwordFocusNode);
              Utils.fieldFocus(context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
              valueListenable: _obsecurePasssword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePasssword.value,
                  focusNode: passwordFocusNode,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePasssword.value =
                                !_obsecurePasssword.value;
                          },
                          child: Icon(_obsecurePasssword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              }),
          SizedBox(
            height: height * .1,
          )
        ])));
    //       body: InkWell(
    //           onTap: () {
    //             Utils.flushBarErrorMessage('No internate connction', context);

    //             // Utils.toastMessage('clicked me');
    //             // Utils.snackBar('yess', context);
    //             // Navigator.pushNamed(context, RoutesNames.home);
    //             // Navigator.push(context,
    //             //     MaterialPageRoute(builder: (context) => HomeScreen()));
    //           },
    //           child: Center(child: Text('Clicked')))
  }
}
