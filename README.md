# SystemLanguage

Gerenciador de idiomas utilizando o padrão Singleton para armazenar, alterar em tempo de execução e recuperar textos através de objetos `Book`, com suporte a persistência local entre aberturas do aplicativo.

---

## Versão

Essa versão é a: 0.4.0

---

# Objetivo

A classe `SystemLanguage` centraliza o controle de idiomas da aplicação, permitindo:

* Definir o idioma atual e persisti-lo no dispositivo.
* Armazenar múltiplos livros (`Book`) por idioma.
* Alterar ou substituir o livro da linguagem corrente em tempo de execução (`setBook`).
* Carregar o idioma salvo como padrão ao abrir o aplicativo (`init`).
* Recuperar textos por índice.
* Adicionar novos textos dinamicamente.

---

# Exemplo Rápido de Uso e Persistência

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final language = SystemLanguage();

  // 1. Carrega o idioma salvo no dispositivo (ou 'pt-br' se for a primeira vez)
  await language.init(defaultLanguage: 'pt-br');

  // 2. Registra os livros disponíveis
  final ptBook = Book();
  ptBook.add('welcome', 'Bem-vindo');

  final enBook = Book();
  enBook.add('welcome', 'Welcome');

  language.addBook(ptBook, 'pt-br', setAsCurrent: false);
  language.addBook(enBook, 'en-us', setAsCurrent: false);

  // 3. Define um novo livro para o idioma corrente em tempo de execução
  final customPtBook = Book();
  customPtBook.add('welcome', 'Bem-vindo ao Novo App!');
  language.setBook(customPtBook); // Atualiza o livro do idioma corrente

  print(language.out('welcome')); // Bem-vindo ao Novo App!

  // 4. Troca de idioma em tempo de execução e salva como padrão para futuras aberturas
  await language.setLanguage('en-us');
  print(language.out('welcome')); // Welcome
}
```

---

# Métodos Principais

| Método | Retorno | Descrição |
| ------ | ------- | --------- |
| `init({defaultLanguage})` | `Future<String>` | Carrega a preferência de idioma salva no dispositivo. |
| `setBook(book, {language})` | `bool` | Define/Substitui um `Book` para a linguagem corrente ou para uma linguagem específica em tempo de execução. |
| `setBookAsync(...)` | `Future<bool>` | Versão assíncrona do `setBook`, aguardando a persistência no disco. |
| `setLanguage(language)` | `Future<bool>` | Altera o idioma ativo e o salva como padrão no dispositivo. |
| `addBook(book, language)` | `bool` | Adiciona um livro ao catálogo de idiomas. |
| `out(index)` | `String` | Retorna o texto formatado para a chave informada no idioma ativo. |
| `add({index, text})` | `bool` | Inclui dinamicamente um texto no livro do idioma atual. |
| `clearSavedLanguage()` | `Future<bool>` | Remove o idioma salvo das preferências do dispositivo. |

---

## 📄 Licença

Licença Apache 2.0.
