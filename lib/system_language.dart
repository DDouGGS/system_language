import 'package:system_language/books/book.dart';

class SystemLanguage {
  String lng = 'pt-br';
  Map<String, Book> books = <String, Book>{};
  static final SystemLanguage _instance = SystemLanguage._();

  // construtor privado
  SystemLanguage._();

  // contrutor
  factory SystemLanguage() {
    return _instance;
  }

  // construtor nomeado
  SystemLanguage.books(Book book, String language) {
    lng = language;
    books = {lng: book};
  }

  // Devolve o texto para o indice.
  String out(String index) {
    return books[lng]!.out(index);
  }

  // Inclue texto no mapa como o indice.
  bool add({required String index, required String text}) {
    return books[lng]!.add(index, text);
  }

  // Adiciona livro ao mapa
  bool addBook(Book book, String language) {
    lng = language;
    books = {lng: book};
    return true;
  }
}
