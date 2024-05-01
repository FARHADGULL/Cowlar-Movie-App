import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/hive_movie_model.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late Box<HiveMovieModel> _movieWatchList;
  @override
  void initState() {
    _movieWatchList = Hive.box<HiveMovieModel>('movie_lists');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: _movieWatchList.isEmpty
          ? Center(
              child: Text('No Movies in Wish List'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _movieWatchList.listenable(),
                    builder: (context, Box<HiveMovieModel> item, child) {
                      List<int> keys = item.keys.cast<int>().toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          final key = keys[index];
                          final HiveMovieModel? _item = item.get(key);
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              title: Text(_item!.title),
                              subtitle: Text(
                                _item.overview,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Image.network(_item.poster),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(
                                    () {
                                      _movieWatchList.deleteAt(index);
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
