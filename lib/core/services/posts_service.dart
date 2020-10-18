import 'package:flutter_provider_lesson_one/core/models/post.dart';
import 'package:flutter_provider_lesson_one/core/services/api.dart';
import 'package:flutter_provider_lesson_one/locator.dart';

class PostsService {
  ApiService _apiService = locator<ApiService>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _apiService.getPostsForUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}