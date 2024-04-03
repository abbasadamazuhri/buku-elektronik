import 'package:flutter_ebook/pages/bacaan.dart';
import 'package:flutter_ebook/pages/beranda.dart';
import 'package:flutter_ebook/pages/favorit.dart';
import 'package:flutter_ebook/pages/login.dart';
import 'package:flutter_ebook/pages/profil.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Buku Elektronik USU',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedNavbar = 0;
  bool grid = true;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: <Widget>[
            const Text(
              'Beranda',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const Text(
              'Favorit',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const Text(
              'Bacaan',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const Text(
              'Profil',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ].elementAt(_selectedNavbar),
        ),
        leading: _selectedNavbar != 3
            ? IconButton(
                icon:
                    grid ? const Icon(Icons.list) : const Icon(Icons.grid_view),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    grid = !grid;
                  });
                })
            : null,
        actions: <Widget>[
          IconButton(
              icon: Image.asset("assets/images/avatar.png"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              }),
        ],
      ),
      body: IndexedStack(
        index: _selectedNavbar,
        children: [
          BerandaPage(title: 'Beranda', mode: grid),
          FavoritPage(title: 'Favorit', mode: grid),
          BacaanPage(title: 'Bacaan', mode: grid),
          ProfilPage(title: 'Profil'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bacaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
