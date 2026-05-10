# SystemLanguage

Gerenciador de idiomas utilizando o padrão Singleton para armazenar e recuperar textos através de objetos `Book`.

---

## Versão

Essa versão é a: 0.3.1

---

# Objetivo

A classe `SystemLanguage` centraliza o controle de idiomas da aplicação, permitindo:

* Definir o idioma atual.
* Armazenar livros (`Book`) por idioma.
* Recuperar textos por índice.
* Adicionar novos textos.
* Registrar novos idiomas dinamicamente.

---

# Estrutura da Classe

```dart id="5vrg0l"
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
```

---

# Padrão Singleton

A classe utiliza o padrão Singleton, garantindo apenas uma instância global durante toda a execução da aplicação.

## Exemplo

```dart id="pk0ayl"
final language = SystemLanguage();
```

Todas as chamadas retornarão a mesma instância.

---

# Propriedades

| Propriedade | Tipo                | Descrição                          |
| ----------- | ------------------- | ---------------------------------- |
| `lng`       | `String`            | Idioma atualmente selecionado      |
| `books`     | `Map<String, Book>` | Mapa contendo os livros por idioma |
| `_instance` | `SystemLanguage`    | Instância singleton da classe      |

---

# Construtores

## Construtor Privado

```dart id="7v44zu"
SystemLanguage._();
```

Impede a criação direta da classe.

---

## Factory Constructor

```dart id="o8qtnr"
factory SystemLanguage()
```

Retorna a instância singleton da classe.

---

## Construtor Nomeado

```dart id="nd0i3l"
SystemLanguage.books(Book book, String language)
```

Inicializa o sistema já contendo um livro associado a um idioma.

### Exemplo

```dart id="yk1u5t"
final lang = SystemLanguage.books(bookPt, 'pt-br');
```

---

# Métodos

---

## out()

Retorna um texto utilizando o índice informado.

### Sintaxe

```dart id="bvvqko"
String out(String index)
```

### Parâmetros

| Nome    | Tipo     | Descrição                |
| ------- | -------- | ------------------------ |
| `index` | `String` | Índice do texto desejado |

### Exemplo

```dart id="0t7m5o"
String text = language.out('welcome');
```

---

## add()

Adiciona temporariamente um novo texto ao idioma atual.

### Sintaxe

```dart id="dkk45m"
bool add({
  required String index,
  required String text
})
```

### Parâmetros

| Nome    | Tipo     | Descrição                     |
| ------- | -------- | ----------------------------- |
| `index` | `String` | Chave identificadora do texto |
| `text`  | `String` | Texto que será armazenado     |

### Exemplo

```dart id="l73qwi"
language.add(
  index: 'hello',
  text: 'Olá Mundo'
);
```

---

## addBook()

Adiciona um novo livro ao sistema e altera o idioma atual.

### Sintaxe

```dart id="7v1zbf"
bool addBook(Book book, String language)
```

### Parâmetros

| Nome       | Tipo     | Descrição                |
| ---------- | -------- | ------------------------ |
| `book`     | `Book`   | Livro contendo os textos |
| `language` | `String` | Código do idioma         |

### Exemplo

```dart id="84vowv"
language.addBook(bookEn, 'en-us');
```

---

# Exemplo Completo

```dart id="n7rw8h"
void main() {

  Book ptBook = Book();
  ptBook.add('hello', 'Olá');

  Book enBook = Book();
  enBook.add('hello', 'Hello');

  final language = SystemLanguage.books(
    ptBook,
    'pt-br'
  );

  print(language.out('hello'));
  // Olá

  language.addBook(enBook, 'en-us');

  print(language.out('hello'));
  // Hello
}
```

---

# Estrutura Esperada da Classe Book

A classe `Book` deve implementar os métodos abaixo:

```dart id="zb6s7v"
class Book {

  bool add(String index, String text) {
    // implementação
  }

  String out(String index) {
    // implementação
  }
}
```

---

# Observações Importantes

## Troca de Idioma

O método `addBook()` altera automaticamente o idioma atual:

```dart id="47y2pd"
lng = language;
```

---

## Substituição do Mapa

Ao adicionar um novo livro:

```dart id="mf2w3s"
books = {lng: book};
```

O mapa anterior é substituído completamente.

### Exemplo

Se já existirem outros idiomas registrados, eles serão removidos.

---

## 📄 Licença

A Licença Apache 2.0 é uma licença de software de código aberto permissiva e popular. Ela permite o uso, modificação, distribuição e comercialização do software, inclusive em projetos fechados, desde que mantenha os créditos de autoria, inclua uma cópia da licença e relate as alterações feitas.

---
