import 'package:buku_el_usu/pages/detail.dart';
import 'package:flutter/material.dart';

class UCardList extends StatelessWidget {
  const UCardList(
      {super.key,
      required this.name,
      required this.picture,
      required this.gender});

  final String name;
  final String picture;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(name: name, picture: picture, gender: gender);
            }));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Image.network(picture),
                title: Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Expanded(
                  child: Text(
                    gender,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
