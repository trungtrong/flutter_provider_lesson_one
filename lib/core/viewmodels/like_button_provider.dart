import 'package:flutter_provider_lesson_one/core/services/posts_service.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/base_provider.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class LikeButtonProvider extends BaseProvider{
  PostsService _postsService = locator<PostsService>();

  int postLikes(int postId) {
    if (_postsService.posts != null && _postsService.posts.length != 0) {
      return _postsService.posts
          .firstWhere((post) => post.id == postId)
          .likes;
    } else {
      return 0;
    }
  }

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }
}