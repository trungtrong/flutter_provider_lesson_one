import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
import 'package:flutter_provider_lesson_one/core/models/post.dart';
import 'package:flutter_provider_lesson_one/core/services/posts_service.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/base_provider.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class PostsProvider extends BaseProvider {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}