import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/models/user.dart';
import 'package:flutter_provider_lesson_one/core/services/authentication_service.dart';

//
import 'package:flutter_provider_lesson_one/locator.dart';
import 'package:flutter_provider_lesson_one/ui/router.dart';
import 'package:flutter_provider_lesson_one/ui/views/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        initialData: User.initial(),
        create: (_) => locator<AuthenticationService>().userController.stream,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: '/login',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}