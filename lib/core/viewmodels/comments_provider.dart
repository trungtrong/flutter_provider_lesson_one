import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
import 'package:flutter_provider_lesson_one/core/models/comment.dart';
import 'package:flutter_provider_lesson_one/core/services/api.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/base_provider.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class CommentsProvider extends BaseProvider {
  ApiService _apiService = locator<ApiService>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _apiService.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}