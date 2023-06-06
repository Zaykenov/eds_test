import 'dart:convert';

import 'package:eds_test/data/models/album_model.dart';
import 'package:eds_test/data/models/comment_model.dart';
import 'package:eds_test/data/models/photo_model.dart';
import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<UserModel>> getAllUsers() async {
    const url = '$baseUrl/users/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(UserModel.fromMap).toList();
  }

  static Future<List<PostModel>> getAllPosts() async {
    const url = '$baseUrl/posts/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  static Future<List<AlbumModel>> getAllAlbums() async {
    const url = '$baseUrl/albums';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  static Future<List<PhotoModel>> getAllPhotos() async {
    const url = '$baseUrl/photos/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  static Future<List<CommentModel>> getAllComments() async {
    const url = '$baseUrl/comments/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  static Future<List<PostModel>> getPostsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/posts';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  static Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/albums';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  static Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '$baseUrl/user/$userId/albums?_embed=photos';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(AlbumModelWithPhotos.fromMap).toList();
  }

  static Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final url = '$baseUrl/albums/$albumId/photos/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  static Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final url = '$baseUrl/posts/$postId/comments/';
    final response = await http.get(Uri.parse(url));
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.body) as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  static Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '$baseUrl/comments/';
    await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
