Aqui está um exemplo de **README.md** claro e organizado baseado na sua classe Dart:

---

# 📚 SystemLanguage

A classe `SystemLanguage` é responsável por gerenciar múltiplos conjuntos de textos (livros) para diferentes idiomas, permitindo acesso, customização e adição dinâmica de conteúdos.

## 🚀 Objetivo

Fornecer uma estrutura simples para:

* Gerenciar idiomas
* Recuperar textos por índice
* Inserir novos textos
* Trabalhar com textos dinâmicos (com parâmetros)

---

## 🧱 Estrutura da Classe

```dart
class SystemLanguage
```

### Propriedades

| Nome    | Tipo                   | Descrição                            |
| ------- | ---------------------- | ------------------------------------ |
| `basic` | `String`               | Define o idioma padrão (ex: `pt_br`) |
| `books` | `Map<String, dynamic>` | Mapa de livros por idioma            |

---

## 🔧 Construtores

### 1. Construtor padrão

```dart
SystemLanguage(String basic, book)
```

Inicializa o sistema com:

* Um idioma padrão
* Um único livro associado a esse idioma

**Exemplo:**

```dart
var system = SystemLanguage('pt_br', bookInstance);
```

---

### 2. Construtor nomeado

```dart
SystemLanguage.books(Map<String, dynamic> books, String indexBasic)
```

Permite iniciar com múltiplos livros e definir o idioma padrão.

**Exemplo:**

```dart
var system = SystemLanguage.books({
  'pt_br': bookPt,
  'en_us': bookEn
}, 'pt_br');
```

---

## 📖 Métodos

### 🔍 `out`

```dart
String out(String index)
```

Retorna um texto com base no índice no idioma atual.

**Exemplo:**

```dart
system.out('welcome_message');
```

---

### 🧩 `molded`

```dart
String molded(String index, Map<String,String> paramns)
```

Retorna um texto formatado com parâmetros dinâmicos.

**Exemplo:**

```dart
system.molded('greeting', {'name': 'João'});
```

---

### ➕ `add`

```dart
bool add({ required String index, required String text })
```

Adiciona um novo texto ao livro do idioma atual.

**Exemplo:**

```dart
system.add(index: 'bye', text: 'Tchau!');
```

---

### 📚 `addBook`

```dart
bool addBook(String index, Book book)
```

Adiciona um novo livro ao sistema para um idioma específico.

**Exemplo:**

```dart
system.addBook('en_us', bookEn);
```

---

## ⚙️ Getters e Setters

### Idioma padrão

```dart
String get myBasic
set myBasic(String basic)
```

---

### Livros

```dart
Map<String, dynamic> get myBooks
set myBooks(Map<String, dynamic> newBook)
```

---

## 🧠 Conceito Geral

A classe funciona como um **gerenciador de internacionalização simplificado**, onde:

* Cada idioma possui um "Book"
* O sistema usa um idioma padrão (`basic`)
* Todas as operações são feitas com base nesse idioma ativo

---

## 📌 Dependência

```dart
import 'package:application_language/books/book.dart';
```

A classe depende de um objeto `Book`, que deve implementar métodos como:

* `out`
* `molded`
* `add`

---

## ✅ Possíveis Melhorias

* Tipar `books` como `Map<String, Book>`
* Validação de existência do idioma antes de acessar
* Tratamento de erros
* Suporte a fallback de idioma


