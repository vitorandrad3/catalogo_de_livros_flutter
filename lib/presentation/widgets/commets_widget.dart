import 'package:flutter/material.dart';
import 'package:catalogo_de_livros/domain/books_model.dart';

class CommentField extends StatefulWidget {
  const CommentField({required this.numberOfBook, super.key});

  final int numberOfBook;

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  final _comment = GlobalKey<FormState>();

  String comment = '';

  Widget commentsgenerate(int bookNumber) {
    if (commentdata[bookNumber + 1] == null) {
      return Container();
    } else {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 35,
                  child: Image.network(
                      'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg'),
                ),
                const SizedBox(width: 10),
                Text(
                  commentdata[bookNumber + 1]![index + 1]!,
                  style: const TextStyle(
                      color: Color.fromARGB(168, 12, 11, 11), fontSize: 15),
                ),
              ],
            );
          },
          separatorBuilder: (__, ____) => const Divider(),
          itemCount: commentdata[bookNumber + 1]!.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Comentários:',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF4CAF50)),
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
            key: _comment,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                onSaved: (value) {
                  comment = value!;
                },
                validator: (value) {
                  return value!.isEmpty ? 'Escreva um comentário' : null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        bool isValid = _comment.currentState!.validate();
                        if (isValid) {
                          _comment.currentState!.save();
                          if (commentdata
                              .containsKey(widget.numberOfBook + 1)) {
                            setState(() {
                              commentdata[widget.numberOfBook + 1]![
                                  commentdata[widget.numberOfBook + 1]!.length +
                                      1] = comment;
                              _comment.currentState!.reset();
                            });
                          } else {
                            setState(() {
                              commentdata[widget.numberOfBook + 1] = {
                                1: comment
                              };
                              _comment.currentState!.reset();
                            });
                          }
                        }
                      },
                      icon: const Icon(Icons.send_rounded),
                    ),
                    label: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(102, 226, 225, 225),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Adicione um comentário'),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(167, 226, 225, 225)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(height: 300, child: commentsgenerate(widget.numberOfBook)),
        ],
      ),
    );
  }
}
