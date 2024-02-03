import 'package:assignment_3/models/albums.dart';
import 'package:assignment_3/services/album_services.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<Album>? albums;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //Fetch Data from API
    getDataAlbum();
  }

  getDataAlbum() {
    albums = await AlbumService().getAlbums();

    if(albums != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API"),
        backgroundColor: Colors.brown.shade200,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: albums?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      albums![index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      albums![index].body ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
