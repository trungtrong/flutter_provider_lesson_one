import 'dart:async';

import 'package:flutter_provider_lesson_one/core/models/user.dart';
import 'package:flutter_provider_lesson_one/core/services/api.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class AuthenticationService {
  // Inject our Api
  ApiService _apiService = locator<ApiService>();
/*
 * constructor(private apiService: ApiService)
 */
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // get the user profile for id
    var fetchedUser = await _apiService.getUserProfile(userId);

    // check if success
    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}