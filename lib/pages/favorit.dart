import 'package:flutter_ebook/components/grid.dart';
import 'package:flutter_ebook/components/list.dart';
import 'package:flutter_ebook/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({Key? key, required this.title, required this.mode})
      : super(key: key);

  final String title;
  final bool mode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Pencarian",
                filled: true,
                fillColor: const Color.fromARGB(255, 230, 230, 230),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: mode
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            LayoutGrid(
                              columnSizes: [auto, auto],
                              rowSizes: snapshot.data
                                  .map<IntrinsicContentTrackSize>((v) {
                                return auto;
                              }).toList(),
                              rowGap: 10,
                              columnGap: 10,
                              children: snapshot.data.map<Widget>((v) {
                                return UCardGrid(
                                    name: v.name,
                                    picture: v.picture,
                                    gender: v.gender);
                              }).toList(),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          children: snapshot.data.map<Widget>((v) {
                            return UCardList(
                                name: v.name,
                                picture: v.picture,
                                gender: v.gender);
                          }).toList(),
                        ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
