import 'package:buku_el_usu/pages/detail.dart';
import 'package:flutter/material.dart';

class UCardGrid extends StatelessWidget {
  const UCardGrid(
      {super.key,
      required this.name,
      required this.picture,
      required this.gender});

  final String name;
  final String picture;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(name: name, picture: picture, gender: gender);
            }));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image.network(picture),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Expanded(
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
