import 'package:flutter/foundation.dart';
import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
import 'package:flutter_provider_lesson_one/core/services/authentication_service.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/base_provider.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class LoginProvider extends BaseProvider {
  // inject
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    //
    var userId = int.tryParse(userIdText);

    // Not a number
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    errorMessage = null;
    var success = await _authenticationService.login(userId);
    //
    setState(ViewState.Idle);
    return success;
  }
}