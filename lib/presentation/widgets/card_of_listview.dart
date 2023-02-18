import 'package:flutter/material.dart';
import '../../domain/books_model.dart';

class CardList extends StatelessWidget {
  const CardList({required this.indexOftile, super.key});
  final int indexOftile;

  //função para quebrar a sinopse-------------------------
  String synopsisBreaker(String sinopse) {
    String text = '';
    List<String> synopsis = [sinopse];
    synopsis = synopsis[0].split('');
    if (synopsis.length > 96) {
      synopsis.removeRange(96, synopsis.length - 1);
      for (int i = 0; i < synopsis.length; i++) {
        text = text + synopsis[i];
      }
      return '$text...';
    } else {
      return sinopse;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(238, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.network(booksList[indexOftile].image),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Flexible(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    booksList[indexOftile].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Text(
                    booksList[indexOftile].autor,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    ' "${synopsisBreaker(booksList[indexOftile].sinopse)}" ',
                    //daria para usar um método já existente com a seguinte cosntrução: overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text('Páginas: ${booksList[indexOftile].pages}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
