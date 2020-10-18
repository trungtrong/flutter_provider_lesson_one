import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';
import 'package:flutter_provider_lesson_one/core/models/post.dart';
import 'package:flutter_provider_lesson_one/core/models/user.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/home_provider.dart';
import 'package:flutter_provider_lesson_one/ui/shared/app_colors.dart';
import 'package:flutter_provider_lesson_one/ui/shared/text_styles.dart';
import 'package:flutter_provider_lesson_one/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_lesson_one/ui/views/base_view.dart';
import 'package:flutter_provider_lesson_one/ui/widgets/postlist_item.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isEnable = false;

  Widget getPostsUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
        post: posts[index],
        onTap: () {
          Navigator.pushNamed(context, '/post', arguments: posts[index]);
        },
      ));

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(
      onModelReady: (model) {
        print(model);
        //
        model.getPosts(Provider.of<User>(context).id).then((value) {
          setState(() {
            _isEnable = true;
          });
        });
        // model.getPosts(1);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Idle
            ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceLarge(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Welcome ${Provider.of<User>(context).name}', style: headerStyle,),
                // child: Text('Welcome Trong', style: headerStyle,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Here are all your posts', style: subHeaderStyle),
              ),
              UIHelper.verticalSpaceSmall(),
              Expanded(child: getPostsUi(model.posts != null ? model.posts : [])),
            ])
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
