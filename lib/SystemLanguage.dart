import 'package:application_language/books/book.dart';

class SystemLanguage
{
  String basic = 'pt_br';
  late Map<String, dynamic> books;
  // contrutor
  SystemLanguage(String basic, book)
  {
    myBasic = basic;
    myBooks = {myBasic: book};
  }
  // construtor nomeado
  SystemLanguage.books(Map<String, dynamic> books, String indexBasic)
  {
    myBasic = indexBasic;
    myBooks = books;
  } 
  // Devolve o texto para o indice.
  String out(String index)
  {
    return books[basic].out(index);
  }
  // Devolve texto fabricado
  String molded(String index, Map<String,String> paramns)
  {
    return books[basic].molded(index, paramns);
  }
  // Inclue texto no mapa como o indice.
  bool add({ required String index, required String text})
  {
    return books[basic].add(index, text);
  }
  // Adiciona livro ao mapa
  bool addBook(String index, Book book)
  {
    books[index] = book;
    return true;
  }
  // Get e Set basic
  String get myBasic => basic;
  set myBasic(String basic){
    this.basic = basic;
  }
  // Get e Set Books
  Map<String, dynamic> get myBooks => books;
  set myBooks(Map<String, dynamic> newBook){
    books = newBook;
  }
}
