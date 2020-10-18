import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/models/post.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/home_provider.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/like_button_provider.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/posts_provider.dart';
import 'package:flutter_provider_lesson_one/ui/views/base_view.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({
    @required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonProvider>(
        builder: (context, model, child) => Row(
          children: <Widget>[
            Text('Likes ${model.postLikes(postId)}'),
            MaterialButton(
              color: Colors.white,
              child: Icon(Icons.thumb_up),
              onPressed: () {
                model.increaseLikes(postId);
              },
            )
          ],
        ));
  }
}