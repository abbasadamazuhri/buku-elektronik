import 'package:flutter_ebook/main.dart';
import 'package:flutter_ebook/pages/viewer.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.name,
      required this.picture,
      required this.gender});

  final String name;
  final String picture;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(color: Colors.red),
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Wrap(
                            spacing: 200,
                            runSpacing: 10,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      }),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const MainPage();
                                        }));
                                      }),
                                ],
                              )
                            ],
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Center(
                          child: Image.network(picture),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 0),
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Wrap(
                            spacing: 50,
                            runSpacing: 10,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  const Text(
                                    "Bahasa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    gender,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const Column(
                                children: <Widget>[
                                  Text(
                                    "Halaman",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "120 Halaman",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: const Expanded(
                          child: Text(
                            "Tentang Buku",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: const Expanded(
                          child: Text(
                            "Sistem informasi untuk mengelola administrasi data akademik pada fakultas/program studi. Aplikasi ini mendukung perubahan kurikulum akademik, fleksibilitas pengelolaan transkrip mahasiswa serta menyediakan fungsi pelaporan DIKTI secara otomatis dan terintegrasi. Sistem ini juga mendukung sepenuhnya KRS online dan bimbingan akademik online.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 29, 24, 45),
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewerPage();
                            }));
                          },
                          child: const Text('Baca'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
