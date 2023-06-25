import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int _selectedIndex = 0;
bool _selectedMode = false;
void main() => runApp(MyApp());

_pushTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Elektronik USU',
      home: LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: <Widget>[
            Text(
              'Beranda',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              'Favorit',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              'Bacaan',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              'Profil',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ].elementAt(_selectedIndex),
        ),
        leading: _selectedIndex != 3
            ? IconButton(
                icon: SvgPicture.asset(
                  _selectedMode
                      ? "assets/icons/grid.svg"
                      : "assets/icons/list.svg",
                ),
                onPressed: () {
                  setState(() {
                    _selectedMode = !_selectedMode;
                  });
                })
            : null,
        actions: <Widget>[
          IconButton(
              icon: Image.asset("assets/images/avatar.png"),
              onPressed: () {
                _pushTo(context, LoginPage());
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _selectedIndex == 0
            ? BerandaPage()
            : _selectedIndex == 1
                ? FavoritPage()
                : _selectedIndex == 2
                    ? BacaanPage()
                    : _selectedIndex == 3
                        ? ProfilPage()
                        : null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/icons/beranda.svg",
              ),
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/icons/favorit.svg",
              ),
            ),
            label: "Favorit",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/icons/bacaan.svg",
              ),
            ),
            label: "Bacaan",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/icons/profil.svg",
              ),
            ),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Pencarian",
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Kategori",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Buku Ajar'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Proceeding'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Jurnal'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Buku Panduan'),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Buku Ajar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _selectedMode
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    UCardList(),
                    UCardList(),
                  ],
                )
              : GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    UCardGrid(),
                    UCardGrid(),
                  ],
                ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Pencarian",
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 30),
          _selectedMode
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    UCardList(),
                    UCardList(),
                  ],
                )
              : GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    UCardGrid(),
                    UCardGrid(),
                  ],
                ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class BacaanPage extends StatelessWidget {
  const BacaanPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Pencarian",
              filled: true,
              fillColor: Color.fromARGB(255, 230, 230, 230),
              prefixIcon: Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 30),
          _selectedMode
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    UCardList(),
                    UCardList(),
                  ],
                )
              : GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    UCardGrid(),
                    UCardGrid(),
                  ],
                ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.asset('assets/images/avatar.png'),
                    title: Text(
                      "Abbas Adam Az Zuhri",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("abbasadamazzuhri@usu.ac.id"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Tentang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Bantuan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Keluar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 24, 45),
        body: SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 100),
                  Text(
                    "Selamat Datang!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Silahkan Masuk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Image.asset("assets/images/login.png"),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "NIM/NIP/USU's Email",
                      filled: true,
                      fillColor: Color.fromARGB(255, 230, 230, 230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Color.fromARGB(255, 230, 230, 230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _pushTo(context, MainPage());
                    },
                    child: Text('Masuk'),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }
}

class UCardGrid extends StatelessWidget {
  const UCardGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset('assets/images/book.png'),
            ),
            Text(
              "Demo Title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/images/book.png'),
              title: Text(
                "Demo Title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('This is a simple card in Flutter.'),
            ),
          ],
        ),
      ),
    );
  }
}
