import 'package:test/test.dart';
import 'package:application_language/application_language.dart';
import 'package:application_language/pt_br_sample.dart';

void main(){
  // Captura texto.
  group(
    'Testando o uso da classe ApplicationLanguage.', 
    (){
      test(
        'Estanciar classe ApplicationLanguage',
        () {
          final lng = ApplicationLanguage('pt_br', PtBrSample());
          expect(
            lng,
            isA<ApplicationLanguage>()
          );
      });
      test(
        'Recuperar indice',
        () {
          final lng = ApplicationLanguage('pt_br', PtBrSample());
          const txt = 'This language for pt_br.';
          expect(
            lng.out('pt_br'),
            equals(txt)
          );
      });
      test(
        'Inserir novo indice temporário.',
        () {
          final lng = ApplicationLanguage('pt_br', PtBrSample());
          expect(
            lng.add(index: 'teste', text: 'Teste de inclusão temporária.'),
            isTrue
          );
      });
      test(
        'Receber vários livros',
        () {
          final lng = ApplicationLanguage.books({'pt_br': PtBrSample(), 'en_us': PtBrSample}, 'en_us');
          expect(
            lng.myBooks.length,
            equals(2)
          );
      });
      test(
        'Definir dinâmicamente o index básico.',
        () {
          final lng = ApplicationLanguage.books({'pt_br': PtBrSample(), 'en_us': PtBrSample}, 'en_us');
          expect(
            lng.myBasic,
            equals('en_us')
          );
      });
      test(
        'Adiciona book.',
        () {
          final lng = ApplicationLanguage('pt_br', PtBrSample());
          lng.addBook('en_us', PtBrSample());
          expect(
            lng.myBooks.length,
            equals(2)
          );
      });
      test(
        'Devolve texto parametrizado.',
        () {
          final lng = ApplicationLanguage('pt_br', PtBrSample());
          expect(
            lng.molded('molded_sample', {'1': 'moldada'}),
            equals('A saída deve ser moldada.')
          );
      });
  });
}