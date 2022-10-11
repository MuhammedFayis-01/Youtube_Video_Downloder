import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_downloader/browser_page.dart';
import 'package:youtube_downloader/download.dart';
import 'package:youtube_downloader/page_link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffc81d25),
        body: Center(
          child: Container(
            height: 200,
            width: 180,
            child: Image.asset("images/logo.png"),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cindex = 0;
  List<Widget> pages = [
    PageLinkScreen(),
    BrowserPage()
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcd1d25),
      body: pages[cindex],
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Color(0xffcd1d25),
          currentIndex: cindex,
          onTap: (value) {
            setState(() {
              cindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.paste), label: "paste"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
            
          ]),
    );
  }
}
