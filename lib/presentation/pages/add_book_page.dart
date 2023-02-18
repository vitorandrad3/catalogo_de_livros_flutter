import 'package:catalogo_de_livros/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../controllers/books_controller.dart';


class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _form = GlobalKey<FormState>();

  String? titleAdd = '';

  String? autorAdd = '';

  String? pagesAdd = '';

  String? sinopseAdd = '';

  String? imageAdd = '';

  String? dateAdd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 4, 163, 68),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                const Text(
                  'Adicione um Novo Livro',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      MyFormField(
                        onSaved: (value) {
                          titleAdd = value;
                          return null;
                        },
                        label: 'Nome:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe o nome' : null;
                        },
                      ),
                      MyFormField(
                        onSaved: (value) {
                          autorAdd = value;
                          return null;
                        },
                        label: 'Autor:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe o autor' : null;
                        },
                      ),
                      MyFormFieldNumbers(
                          onSaved: (value) {
                            pagesAdd = value;
                            return null;
                          },
                          label: 'Páginas',
                          validator: (value) {
                            return value!.isEmpty
                                ? 'informe o número de páginas'
                                : null;
                          }),
                      MyFormFieldNumbers(
                          onSaved: (value) {
                            dateAdd = value;
                            return null;
                          },
                          label: 'Ano de Lançamento',
                          validator: (value) {
                            return value!.isEmpty ? 'informe o ano' : null;
                          }),
                      MyFormField(
                        onSaved: (value) {
                          sinopseAdd = value;
                          return null;
                        },
                        label: 'Sinopse:',
                        validator: (value) {
                          return value!.isEmpty ? 'informe a sinopse' : null;
                        },
                      ),
                      MyFormField(
                        onSaved: (value) {
                          imageAdd = value;
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
                    final bool isValid = _form.currentState!.validate();
                    if (isValid) {
                      setState(() {
                        _form.currentState!.save();

                        ListBookChange.changeInstance.saveNewBook(
                            titleAdd: titleAdd,
                            autorAdd: autorAdd,
                            pagesAdd: pagesAdd,
                            sinopseAdd: sinopseAdd,
                            imageAdd: imageAdd,
                            dateAdd: dateAdd);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Novo Livro Adicionado')));
                        _form.currentState!.reset();
                      });
                    }
                  },
                  child: const Text('ADICIONAR'),
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
