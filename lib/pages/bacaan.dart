import 'package:buku_el_usu/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

List<String> tags = [];
List<String> options = [
  'Buku Ajar',
  'Prosiding',
  'Jurnal',
  'Buku Panduan',
  'Lele',
  'Kaki',
  'Cordtela',
];

class BacaanPage extends StatelessWidget {
  const BacaanPage({Key? key, required this.title, required this.mode})
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: mode
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      LayoutGrid(
                        columnSizes: [auto, auto],
                        rowSizes: [auto, auto],
                        rowGap: 10,
                        columnGap: 10,
                        children: <Widget>[
                          UCardGrid(),
                          UCardGrid(),
                          UCardGrid(),
                          UCardGrid(),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      UCardList(),
                      UCardList(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class UCardGrid extends StatelessWidget {
  const UCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DetailPage();
            }));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image.asset(
                  'assets/images/book.png',
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Expanded(
                  child: Text(
                    "Demo Titles",
                    style: TextStyle(fontWeight: FontWeight.bold),
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

class UCardList extends StatelessWidget {
  const UCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DetailPage();
            }));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/images/book.png'),
                title: const Expanded(
                  child: Text(
                    "Demo Title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: const Expanded(
                  child: Text('This is a simple card in Flutter.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
