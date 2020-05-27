import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_search_app/api/apiService.dart';
import 'package:movie_search_app/model/model.dart';
import 'package:movie_search_app/utils/appTheme.dart';
import 'package:movie_search_app/utils/loading.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';

class MoviesHome extends StatefulWidget {
  @override
  _MoviesHomeState createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  TextEditingController _textController = TextEditingController();
  FocusNode searchNode = new FocusNode();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius:
                  BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
          child: TextField(
            controller: _textController,
            focusNode: searchNode,
            style: TextStyle(fontSize: 16, color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
                borderRadius:
                    BorderRadius.circular(4 * SizeConfig.heightMultiplier),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                  borderRadius:
                      BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
              // suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                  borderRadius:
                      BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
              hintText: "Search here...",
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 20,
                top: 14,
                bottom: 14,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search Movies',
            onPressed: () {
              setState(() {
                searchText = _textController.text;
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.widthMultiplier,
            vertical: 2 * SizeConfig.heightMultiplier),
        child: searchText.length > 0
            ? FutureBuilder<List<Movie>>(
                future: searchMovies(searchText),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data.map((movie) {
                        return Card(
                          color: AppTheme.primaryDarkColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  4 * SizeConfig.heightMultiplier)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                movie.poster,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                4 * SizeConfig.heightMultiplier,
                                              ),
                                              topLeft: Radius.circular(
                                                4 * SizeConfig.heightMultiplier,
                                              ),
                                            ),
                                          ),
                                          child: Container(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(1 *
                                                  SizeConfig.textMultiplier),
                                              width: 38 *
                                                  SizeConfig.widthMultiplier,
                                              child: Text(
                                                movie.title,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTheme.display2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          1 * SizeConfig.textMultiplier),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'IMDB Rating: 3.8',
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTheme.display2,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${movie.year}',
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTheme.display2,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return LoadingDialog();
                })
            : Container(),
      ),
    );
  }
}
