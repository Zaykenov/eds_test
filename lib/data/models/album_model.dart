import 'package:eds_test/data/models/photo_model.dart';

class AlbumModel {
  final int userId;
  final int id;
  final String title;

  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromMap(Map<String, dynamic> map) => AlbumModel(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
      );
}

class AlbumModelWithPhotos extends AlbumModel {
  final List<PhotoModel> photos;

  AlbumModelWithPhotos({
    required int userId,
    required int id,
    required String title,
    required this.photos,
  }) : super(
          userId: userId,
          id: id,
          title: title,
        );

  factory AlbumModelWithPhotos.fromMap(Map<String, dynamic> map) =>
      AlbumModelWithPhotos(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        photos: List<PhotoModel>.from(
          List<Map<String, dynamic>>.from(map['photos'] as List)
              .map<PhotoModel>(PhotoModel.fromMap),
        ),
      );
}
