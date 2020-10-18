import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
//
import 'package:flutter_provider_lesson_one/core/models/comment.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/comments_provider.dart';
import 'package:flutter_provider_lesson_one/ui/shared/app_colors.dart';
import 'package:flutter_provider_lesson_one/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_lesson_one/ui/views/base_view.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsProvider>(
      onModelReady: (model) {
        model.fetchComments(postId);
      },
      builder: (BuildContext context, model, child) {
        if (model.state == ViewState.Busy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: ListView(
            children: model.comments
              .map((comment) => CommentItem(comment)).toList(),
          ),
        );
      },
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}