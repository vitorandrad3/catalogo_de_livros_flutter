import 'package:flutter/material.dart';
import 'book_catalog.dart';
import 'add_book_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int page = 0;

  late PageController nav;

  @override
  void initState() {
    super.initState();
    nav = PageController(initialPage: page);
  }

  setCurrentPage(currentpage) {
    setState(() {
      page = currentpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setCurrentPage,
        controller: nav,
        children: const [
          BookCatalog(),
          AddBookPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 10, 79, 12),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 8, 252, 0),
        currentIndex: page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Meus Livros',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'Novo Livro')
        ],
        onTap: (page) {
          nav.animateToPage(page,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasySplashScreen(
        logo: Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
        title: const Text(
          "Catálogo de Livros",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 134, 42),
        showLoader: true,
        loadingText: const Text("Loading..."),
        navigator: const StartPage(),
        durationInSeconds: 4,
      ),
    );
  }
}
