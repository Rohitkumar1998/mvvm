import 'package:flutter/material.dart';
import 'package:mvvm/resourses/component/round_button.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/utitlities/routes/utils.dart';
import 'package:mvvm/view/homeScreen.dart';
import 'package:mvvm/resourses/component/round_button.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
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
              ),
              RoundButton(
                title: 'Login',
                loading: authviewMode.loading,
                onPresed: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter passwordx', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        "Please enter 6 digit password", context);
                  } else {
                    // Map data = {
                    //   'email': _emailController.text.toString(),
                    //   'password': _passwordController.text.toString()
                    // };
                    Map data = {
                      "email": "eve.holt@reqres.in",
                      "password": "cityslicka"
                    };
                    print('Api hit');
                    authviewMode.loginApi(data, context);
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.signUp);
                  },
                  child: Text("don't have An Account ? Sign Up"))
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
