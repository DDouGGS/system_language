class Book
{
  late Map<String, String> texts;
  // Devolve o texto para o indice.
  String out(String index)
  {
      String? dd = texts[index];
      if(dd == null || dd.isEmpty){
        return '';
      }
      return dd;
  }
  // Devolve o texto modelado
  // Seletor >:? Ex.: >:1
  String molded(String idx, Map<String,String> paramns)
  {
    String output = out(idx);
    paramns.forEach((key, value) {
      output = output.replaceAll(">:$key", value);
    });
    return output;
  }
  // Inclue texto no mapa como o indice.
  bool add(String index, String text)
  {
    texts[index] = text;
    return true;
  }
  // get e set texts
  Map<String, String>? get myTexts => texts;
  set myTexts(Map<String, String> book){
    texts = book;
  }
}