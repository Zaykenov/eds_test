class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromMap(Map<String, dynamic> map) => PhotoModel(
        albumId: map['albumId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        url: '${map['url']}.jpg',
        thumbnailUrl: '${map['thumbnailUrl']}.jpg',
      );
}
