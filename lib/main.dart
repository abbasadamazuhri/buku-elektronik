import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

int _selectedIndex = 0;
bool _selectedMode = false;
List<String> tags = [];
List<String> options = [
  'Buku Ajar',
  'Prosiding',
  'Jurnal',
  'Buku Panduan',
];

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
      body: _selectedIndex == 0
          ? BerandaPage()
          : _selectedIndex == 1
              ? FavoritPage()
              : _selectedIndex == 2
                  ? BacaanPage()
                  : _selectedIndex == 3
                      ? ProfilPage()
                      : null,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text(
              "Kategori",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => (),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text(
              "Buku Ajar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: _selectedMode
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      UCardList(),
                      UCardList(),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      LayoutGrid(
                        columnSizes: [auto, auto],
                        rowSizes: [auto, auto],
                        rowGap: 20,
                        columnGap: 5,
                        children: <Widget>[
                          UCardGrid(),
                          UCardGrid(),
                          UCardGrid(),
                          UCardGrid(),
                        ],
                      ),
                    ],
                  ),
          ),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: _selectedMode
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      UCardList(),
                      UCardList(),
                    ],
                  )
                : LayoutGrid(
                    columnSizes: [auto, auto],
                    rowSizes: [auto, auto],
                    rowGap: 20,
                    columnGap: 10,
                    children: <Widget>[
                      UCardGrid(),
                      UCardGrid(),
                      UCardGrid(),
                      UCardGrid(),
                    ],
                  ),
          ),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: _selectedMode
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      UCardList(),
                      UCardList(),
                    ],
                  )
                : LayoutGrid(
                    columnSizes: [auto, auto],
                    rowSizes: [auto, auto],
                    rowGap: 20,
                    columnGap: 10,
                    children: <Widget>[
                      UCardGrid(),
                      UCardGrid(),
                      UCardGrid(),
                      UCardGrid(),
                    ],
                  ),
          ),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Center(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Center(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Center(
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
          ),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Selamat Datang!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan Masuk",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 35),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Image.asset("assets/images/login.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextFormField(
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
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: TextFormField(
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
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    _pushTo(context, MainPage());
                  },
                  child: Text('Masuk'),
                ),
              ),
            ],
          ),
        ));
  }
}

class UCardGrid extends StatelessWidget {
  const UCardGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/book.png',
            ),
            Text(
              "Demo Titles",
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
