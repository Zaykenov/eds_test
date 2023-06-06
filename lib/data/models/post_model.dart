class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
      );
}
