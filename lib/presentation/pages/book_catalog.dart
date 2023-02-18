import 'package:catalogo_de_livros/controllers/books_controller.dart';
import 'package:catalogo_de_livros/presentation/widgets/card_of_listview.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_de_livros/domain/books_model.dart';

import 'book_detail_page.dart';

class BookCatalog extends StatefulWidget {
  const BookCatalog({super.key});

  @override
  State<BookCatalog> createState() => _BookCatalogState();
}

class _BookCatalogState extends State<BookCatalog> {
  List<Book> listfOfBooks = booksList;

  void searchBook(String input) {
    final suggestions = listfOfBooks.where((book) {
      String bookTitle = book.title.toLowerCase();
      String filter = input.toLowerCase();
      return bookTitle.contains(filter);
    }).toList();
    setState(() => booksList = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ListBookChange.changeInstance,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(244, 4, 163, 68),
            body: NestedScrollView(
              headerSliverBuilder: (context, __) => [
                const SliverAppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(176, 2, 73, 6),
                  title: Center(
                    child: Text(
                      'Catálogo de Livros',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ],
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: searchBook,
                        decoration: InputDecoration(
                          label: const Text(
                            'Procurar livro:',
                            style: TextStyle(color: Colors.white),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          Book book = booksList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetail(
                                    autorDetail: book.autor,
                                    pagesDetail: book.pages,
                                    publicationDateDetail: book.date,
                                    titleDetail: book.title,
                                    imageDetail: book.image,
                                    sinopseDetail: book.sinopse,
                                    bookNumber: book.id,
                                  ),
                                ),
                              );
                            },
                            child: CardList(
                              indexOftile: index,
                            ),
                          );
                        },
                        separatorBuilder: (__, ____) => const Divider(),
                        itemCount: (booksList.length),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
