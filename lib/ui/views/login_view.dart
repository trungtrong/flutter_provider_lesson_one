import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/login_provider.dart';
import 'package:flutter_provider_lesson_one/locator.dart';
import 'package:flutter_provider_lesson_one/ui/shared/app_colors.dart';
import 'package:flutter_provider_lesson_one/ui/views/base_view.dart';
import 'package:flutter_provider_lesson_one/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage, controller: _controller),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if (loginSuccess) {
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}