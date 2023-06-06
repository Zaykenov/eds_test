import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String thumbNailLink;
  final String title;

  const PhotoCard({
    required this.thumbNailLink,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(thumbNailLink),
            fit: BoxFit.fill,
          ),
        ),
        width: 300,
        height: 50,
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 30),
          child: Text(
            title,
            style: AppTextStyles.bodyTextStyle,
          ),
        ),
      ),
    );
  }
}
