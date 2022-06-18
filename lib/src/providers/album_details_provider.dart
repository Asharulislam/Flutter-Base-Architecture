import 'package:flutter/material.dart';
import 'package:dang/src/models/album_model.dart';
import 'package:dang/src/network_module/api_response.dart';
import 'package:dang/src/repositories/album_repo.dart';

class AlbumDetailsProvider with ChangeNotifier {
  late AlbumRepository _albumRepository;

  late ApiResponse<Album> _album;

  ApiResponse<Album> get album => _album;

  AlbumDetailsProvider() {
    _albumRepository = AlbumRepository();
    fetchAlbumDetails();
  }

  fetchAlbumDetails() async {
    _album = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Album album = await _albumRepository.fetchAlbum();
      _album = ApiResponse.completed(album);
      notifyListeners();
    } catch (e) {
      _album = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  postDataDetails(int id) async {
    _album = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Album album = await _albumRepository.postAlbum(id);
      _album = ApiResponse.completed(album);
      notifyListeners();
    } catch (e) {
      _album = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
