import 'package:flutter/material.dart';
import '../domain/books_model.dart';

class ListBookChange extends ChangeNotifier {
  //singleton
  static ListBookChange changeInstance = ListBookChange();

  void saveNewBook({
    required titleAdd,
    required autorAdd,
    required pagesAdd,
    required sinopseAdd,
    required imageAdd,
    required dateAdd,
  }) {
    insertDataOnMap(
        booknumber: books.length + 1,
        booktitle: titleAdd,
        bookautor: autorAdd,
        bookpages: pagesAdd,
        booksynopsis: sinopseAdd,
        bookimage: imageAdd,
        bookdate: dateAdd);
    notifyListeners();
    booksList.add(
      Book(
          title: books[books.keys.last]!['titulo']!,
          autor: books[books.keys.last]!['autor']!,
          pages: books[books.keys.last]!['paginas']!,
          image: books[books.keys.last]!['capa']!,
          sinopse: books[books.keys.last]!['sinopse']!,
          date: books[books.keys.last]!['data']!,
          id: books.length - 1),
    );

    commentdata[books.length + 1] = {};
    notifyListeners();
  }

  deletebook({required booknumber}) {
    for (int i = 0; i < booksList.length; i++) {
      if (booksList[i].id == booknumber) {
        booksList.remove(booksList[i]);
        books.remove(booknumber + 1);
      }
    }
    notifyListeners();
  }

  editBook(
      {required booknumber,
      required titleEdit,
      required autorEdit,
      required pagesEdit,
      required sinopseEdit,
      required imageEdit,
      required dateEdit}) {
    booksList[booknumber].autor = autorEdit!;
    booksList[booknumber].title = titleEdit!;
    booksList[booknumber].sinopse = sinopseEdit!;
    booksList[booknumber].image = imageEdit!;
    booksList[booknumber].pages = pagesEdit!;
    notifyListeners();
  }
}
