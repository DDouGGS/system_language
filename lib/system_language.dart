import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_language/books/book.dart';

class SystemLanguage {
  static const String _prefKey = 'system_language_current_lng';

  String lng = 'pt-br';
  Map<String, Book> books = <String, Book>{};
  static final SystemLanguage _instance = SystemLanguage._();

  // Construtor privado
  SystemLanguage._();

  // Construtor factory (Singleton)
  factory SystemLanguage() {
    return _instance;
  }

  // Construtor nomeado
  SystemLanguage.books(Book book, String language) {
    lng = language;
    books[language] = book;
  }

  /// Inicializa o gerenciador de idiomas carregando a linguagem padrão salva no dispositivo.
  /// Caso nenhuma linguagem tenha sido salva previamente, utiliza [defaultLanguage].
  Future<String> init({String defaultLanguage = 'pt-br'}) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLng = prefs.getString(_prefKey);
    if (savedLng != null && savedLng.isNotEmpty) {
      lng = savedLng;
    } else {
      lng = defaultLanguage;
    }
    return lng;
  }

  /// Devolve o texto para o índice no idioma atual.
  String out(String index) {
    final book = books[lng];
    if (book == null) {
      return '';
    }
    return book.out(index);
  }

  /// Inclui texto no mapa do livro do idioma atual como o índice.
  bool add({required String index, required String text}) {
    final book = books[lng];
    if (book == null) {
      return false;
    }
    return book.add(index, text);
  }

  /// Adiciona ou substitui um livro para o idioma informado.
  /// Por padrão, define o idioma informado como atual e dispara o salvamento da preferência no dispositivo.
  bool addBook(
    Book book,
    String language, {
    bool setAsCurrent = true,
    bool saveAsDefault = true,
  }) {
    books[language] = book;
    if (setAsCurrent) {
      lng = language;
      if (saveAsDefault) {
        saveLanguagePreference(language);
      }
    }
    return true;
  }

  /// Versão assíncrona de [addBook], aguardando a persistência no dispositivo se [saveAsDefault] for true.
  Future<bool> addBookAsync(
    Book book,
    String language, {
    bool setAsCurrent = true,
    bool saveAsDefault = true,
  }) async {
    books[language] = book;
    if (setAsCurrent) {
      lng = language;
      if (saveAsDefault) {
        return await saveLanguagePreference(language);
      }
    }
    return true;
  }

  /// Define um novo livro para a linguagem corrente ou para uma linguagem específica em tempo de execução.
  /// Se [language] não for informado, utiliza a linguagem corrente [lng].
  bool setBook(
    Book book, {
    String? language,
    bool setAsCurrent = true,
    bool saveAsDefault = true,
  }) {
    final targetLng = language ?? lng;
    return addBook(
      book,
      targetLng,
      setAsCurrent: setAsCurrent,
      saveAsDefault: saveAsDefault,
    );
  }

  /// Versão assíncrona de [setBook], aguardando a gravação no armazenamento local.
  Future<bool> setBookAsync(
    Book book, {
    String? language,
    bool setAsCurrent = true,
    bool saveAsDefault = true,
  }) async {
    final targetLng = language ?? lng;
    return await addBookAsync(
      book,
      targetLng,
      setAsCurrent: setAsCurrent,
      saveAsDefault: saveAsDefault,
    );
  }

  /// Altera o idioma atual em tempo de execução.
  /// Se [saveAsDefault] for `true`, salva este idioma como padrão no dispositivo.
  Future<bool> setLanguage(
    String language, {
    bool saveAsDefault = true,
  }) async {
    lng = language;
    if (saveAsDefault) {
      return await saveLanguagePreference(language);
    }
    return true;
  }

  /// Persiste a chave do idioma no armazenamento do dispositivo.
  Future<bool> saveLanguagePreference(String language) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_prefKey, language);
  }

  /// Remove a preferência de idioma salva no dispositivo.
  Future<bool> clearSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_prefKey);
  }
}
