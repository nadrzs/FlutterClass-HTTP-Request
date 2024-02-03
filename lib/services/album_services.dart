import 'package:assignment_3/models/albums.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  Future<List<Album>?> getAlbums() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return albumFromJson(json);
    }
  }
}
