import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: AppTextStyles.title,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 7),
          Text(
            post.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
