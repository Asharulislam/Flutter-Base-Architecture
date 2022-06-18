// ignore_for_file: avoid_print

import 'package:dang/src/enums/posts_enum.dart';
import 'package:dang/src/models/album_model.dart';
import 'package:dang/src/network_module/api_path.dart';
import 'package:dang/src/network_module/http_client.dart';

class AlbumRepository {
  Future<Album> fetchAlbum() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.testPath));
    print("Response - $response");
    return Album.fromJson(response);
  }

  Future<dynamic> postAlbum(int postId) async {
    final response = await HttpClient.instance.postData(
      APIPathHelper.getValue(APIPath.testPath),
      {'postId': postId},
    );
    print("Response - $response");
    return Album.fromJson(response);
  }

  Future<dynamic> updateAlbum(int postId) async {
    final response = await HttpClient.instance.putData(
      APIPathHelper.getValue(APIPath.testPath),
      {'postId': postId},
    );
    print("Response - $response");
    return Album.fromJson(response);
  }

  Future<dynamic> deleteAlbum(int postId) async {
    final response = await HttpClient.instance.deleteData(
      APIPathHelper.getValue(APIPath.testPath),
      params: {'postId': postId.toString()},
    );
    print("Response - $response");
    return Album.fromJson(response);
  }
}
