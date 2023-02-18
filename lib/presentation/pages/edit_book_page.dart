import 'package:catalogo_de_livros/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../domain/books_model.dart';
import '../../controllers/books_controller.dart';

class EditBookPage extends StatefulWidget {
  const EditBookPage(
      {required this.booktoshowinfo, required this.numberOfBook, super.key});
  final int numberOfBook;
  final List booktoshowinfo;
  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final _formEdit = GlobalKey<FormState>();

  String? titleEdit = '';
  String? autorEdit = '';
  String? pagesEdit = '';
  String? sinopseEdit = '';
  String? imageEdit = '';
  String? dateEdit = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Página de Edição         ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(176, 2, 73, 6),
      ),
      backgroundColor: const Color.fromARGB(244, 4, 163, 68),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: _formEdit,
                  child: Column(
                    children: [
                      MyFormFieldEdit(
                        initialValue: widget.booktoshowinfo.first.title,
                        onSaved: (value) {
                          titleEdit = value;
                          return null;
                        },
                        label: 'Nome:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe o nome' : null;
                        },
                      ),
                      MyFormFieldEdit(
                        initialValue: widget.booktoshowinfo.first.autor,
                        onSaved: (value) {
                          autorEdit = value;
                          return null;
                        },
                        label: 'Autor:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe o autor' : null;
                        },
                      ),
                      MyFormFieldEditNumber(
                          initialValue: widget.booktoshowinfo.first.pages,
                          onSaved: (value) {
                            pagesEdit = value;
                            return null;
                          },
                          label: 'Páginas',
                          validator: (value) {
                            return value!.isEmpty
                                ? 'informe o número de páginas'
                                : null;
                          }),
                      MyFormFieldEditNumber(
                          initialValue: widget.booktoshowinfo.first.date,
                          onSaved: (value) {
                            dateEdit = value;
                            return null;
                          },
                          label: 'Ano de Lançamento',
                          validator: (value) {
                            return value!.isEmpty ? 'informe o ano' : null;
                          }),
                      MyFormFieldEdit(
                        initialValue: widget.booktoshowinfo.first.sinopse,
                        onSaved: (value) {
                          sinopseEdit = value;
                          return null;
                        },
                        label: 'Sinopse:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe a sinopse' : null;
                        },
                      ),
                      MyFormFieldEdit(
                        initialValue: widget.booktoshowinfo.first.image,
                        onSaved: (value) {
                          imageEdit = value;
                          return null;
                        },
                        label: 'Link da foto:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe a url' : null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 71, 19),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.5,
                          MediaQuery.of(context).size.height * 0.055),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(
                      () {
                        final bool isValid = _formEdit.currentState!.validate();
                        if (isValid) {
                          _formEdit.currentState!.save();
                          ListBookChange.changeInstance.editBook(
                              booknumber: booksList
                                  .indexOf(widget.booktoshowinfo.first),
                              titleEdit: titleEdit,
                              autorEdit: autorEdit,
                              pagesEdit: pagesEdit,
                              sinopseEdit: sinopseEdit,
                              imageEdit: imageEdit,
                              dateEdit: dateEdit);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Livro Atualizado')));

                          int count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                        }
                      },
                    );
                  },
                  child: const Text('ATUALIZAR'),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
