import 'package:catalogo_de_livros/presentation/widgets/commets_widget.dart';
import 'package:catalogo_de_livros/presentation/widgets/container_of_book_detail.dart';
import 'package:catalogo_de_livros/presentation/widgets/text_of_details_page.dart';
import 'package:flutter/material.dart';

import '../../controllers/books_controller.dart';
import '../../domain/books_model.dart';
import 'edit_book_page.dart';

class BookDetail extends StatefulWidget {
  const BookDetail(
      {required this.autorDetail,
      required this.pagesDetail,
      required this.publicationDateDetail,
      required this.titleDetail,
      required this.imageDetail,
      required this.sinopseDetail,
      required this.bookNumber,
      super.key});

  final String titleDetail;
  final String autorDetail;
  final String pagesDetail;
  final String publicationDateDetail;
  final String imageDetail;
  final String sinopseDetail;
  final int bookNumber;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  List<Book>? booktoshow;
  void getBook() {
    booktoshow =
        booksList.where((book) => book.id == widget.bookNumber).toList();
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              getBook();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBookPage(
                      booktoshowinfo: booktoshow!,
                      numberOfBook: widget.bookNumber),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                ListBookChange.changeInstance
                    .deletebook(booknumber: widget.bookNumber);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
        ],
        title: const Center(
          child: Text(
            'DETALHES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(176, 2, 73, 6),
      ),
      backgroundColor: const Color.fromARGB(244, 4, 163, 68),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  MyContainer(
                    image: widget.imageDetail,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.43,
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextofDetails(text: 'Título:'),
                        TextofDetails2(text: widget.titleDetail),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextofDetails(text: 'Autor:'),
                        TextofDetails2(text: widget.autorDetail),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextofDetails(text: 'Páginas:'),
                        TextofDetails2(text: widget.pagesDetail),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextofDetails(text: 'Ano da Publicação:'),
                        TextofDetails2(text: widget.publicationDateDetail),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    const Text(
                      'SINOPSE:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '   ${widget.sinopseDetail}',
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CommentField(numberOfBook: widget.bookNumber),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
