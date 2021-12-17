import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'E-commerce Sing up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool check = false;
  final _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 100,
              child: Image(
                image: NetworkImage(
                    'https://www.flaticon.com/free-icon/schedules_5778200?related_id=5778200&origin=pack'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'الرئيسية',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'الرئيسية',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'الرئيسية',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'الرئيسية',
                      style: GoogleFonts.almarai(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 30,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        onChanged: (text) {
                          List<String> outputexpression = [];
                          // print('First text field: $text');
                          text.runes.forEach((int rune) {
                            var character = new String.fromCharCode(rune);
                            // print(character);
                            // فتحة وضمة وكسرة
                            if (character.contains('\u064E') ||
                                character.contains('\u064F') ||
                                character.contains('\u0650')) {
                              outputexpression.add('/');

                              // السكون
                            } else if (character.contains('\u0652')) {
                              outputexpression.add('0');

                              // المد
                            } else if (character.contains('\u06E4')) {
                              outputexpression.add('0/');

                              // التنوين
                            } else if (character.contains('\u064B') ||
                                character.contains('\u064C') ||
                                character.contains('\u064D')) {
                              outputexpression.add('//');

                              //الشدة
                            } else if (character.contains('\u0651') ||
                                character.contains('\uFCF2') ||
                                character.contains('\uFCF3') ||
                                character.contains('\uFCF4')) {
                              outputexpression.add('/0');
                            }
                          });
                          outputexpression.add('0');
                          print(outputexpression);
                        },
                        controller: _controller,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          labelText: '....ابحث عن',
                          suffix: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
