import 'package:buku_el_usu/htrht.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 24, 45),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: const Text(
                    "Selamat Datang!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: const Text(
                    "Silahkan Masuk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Center(
                    child: Image.asset("assets/images/login.png"),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "NIM/NIP/USU's Email",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 230, 230, 230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 230, 230, 230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      }));
                    },
                    child: const Text('Masuk'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
