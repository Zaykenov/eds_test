import 'package:flutter/material.dart';

import '../data/models/album_model.dart';
import '../data/models/user_model.dart';
import 'album_detail_page.dart';
import 'shared_widgets/album_card.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';

class AllAlbumsPage extends StatelessWidget {
  final UserModel user;
  final List<AlbumModelWithPhotos> albums;

  const AllAlbumsPage({
    required this.user,
    required this.albums,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            child: AlbumCard(
              album: album,
            ),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailPage(
                    album: album,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
