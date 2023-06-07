import 'dart:convert';

import 'package:eds_test/data/models/album_model.dart';
import 'package:eds_test/data/models/comment_model.dart';
import 'package:eds_test/data/models/photo_model.dart';
import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static final Logger _logger = Logger();

  static Future<List<T>> _handleApiResponse<T>(
    Future<http.Response> apiCall,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    try {
      final response = await apiCall;

      if (response.statusCode == 200) {
        final jsonResponse =
            List<Map<String, dynamic>>.from(json.decode(response.body) as List);
        return jsonResponse.map(fromMap).toList();
      } else {
        _logger.e('Request failed with status: ${response.statusCode}');
        return [];
      }
    } on Exception catch (e, stackTrace) {
      _logger.e('Error: $e', e, stackTrace);
      return [];
    }
  }

  static Future<List<UserModel>> getAllUsers() async {
    const url = '$baseUrl/users/';
    return _handleApiResponse<UserModel>(
      http.get(Uri.parse(url)),
      UserModel.fromMap,
    );
  }

  static Future<List<PostModel>> getAllPosts() async {
    const url = '$baseUrl/posts/';
    return _handleApiResponse<PostModel>(
      http.get(Uri.parse(url)),
      PostModel.fromMap,
    );
  }

  static Future<List<AlbumModel>> getAllAlbums() async {
    const url = '$baseUrl/albums';
    return _handleApiResponse<AlbumModel>(
      http.get(Uri.parse(url)),
      AlbumModel.fromMap,
    );
  }

  static Future<List<PhotoModel>> getAllPhotos() async {
    const url = '$baseUrl/photos/';
    return _handleApiResponse<PhotoModel>(
      http.get(Uri.parse(url)),
      PhotoModel.fromMap,
    );
  }

  static Future<List<CommentModel>> getAllComments() async {
    const url = '$baseUrl/comments/';
    return _handleApiResponse<CommentModel>(
      http.get(Uri.parse(url)),
      CommentModel.fromMap,
    );
  }

  static Future<List<PostModel>> getPostsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/posts';
    return _handleApiResponse<PostModel>(
      http.get(Uri.parse(url)),
      PostModel.fromMap,
    );
  }

  static Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/albums';
    return _handleApiResponse<AlbumModel>(
      http.get(Uri.parse(url)),
      AlbumModel.fromMap,
    );
  }

  static Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '$baseUrl/user/$userId/albums?_embed=photos';
    return _handleApiResponse<AlbumModelWithPhotos>(
      http.get(Uri.parse(url)),
      AlbumModelWithPhotos.fromMap,
    );
  }

  static Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final url = '$baseUrl/albums/$albumId/photos/';
    return _handleApiResponse<PhotoModel>(
      http.get(Uri.parse(url)),
      PhotoModel.fromMap,
    );
  }

  static Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final url = '$baseUrl/posts/$postId/comments/';
    return _handleApiResponse<CommentModel>(
      http.get(Uri.parse(url)),
      CommentModel.fromMap,
    );
  }

  static Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '$baseUrl/comments/';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': name,
          'email': email,
          'body': body,
        },
      );

      if (response.statusCode != 201) {
        _logger.e('Request failed with status: ${response.statusCode}');
        // Handle error response
      }
    } on Exception catch (e, stackTrace) {
      _logger.e('Error: $e', e, stackTrace);
    }
  }
}
