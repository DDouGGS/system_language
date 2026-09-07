# Plano de Implementação: Alteração Dinâmica e Persistência do Idioma/Livro no SystemLanguage

Permitir que o aplicativo altere o livro ou o idioma ativo em tempo de execução e persista essa preferência (utilizando `shared_preferences`), para que ela seja mantida automaticamente em todas as futuras inicializações do aplicativo.

---

## Modificações Propostas

### 1. Dependências (`pubspec.yaml`)
- Adicionar o pacote `shared_preferences` às dependências para permitir persistência de chave-valor (código do idioma selecionado).

### 2. Classe Principal (`lib/system_language.dart`)
- **Preservação de Múltiplos Livros**: Ajustar o método `addBook` para adicionar/atualizar livros no mapa `books[language] = book` sem sobrescrever todo o mapa `books`.
- **Inicialização Assíncrona (`init`)**: Criar o método `init({String defaultLanguage = 'pt-br'})` para carregar o idioma salvo anteriormente no armazenamento do dispositivo (ou usar o idioma padrão caso nenhum tenha sido salvo).
- **Mudar Idioma (`setLanguage`)**: Adicionar o método `setLanguage(String language, {bool saveAsDefault = true})` para trocar o idioma ativo em tempo de execução e salvar a preferência no armazenamento local.
- **Definir Livro Dinamicamente (`setBook` / `addBook`)**: Permitir associar um novo `Book` a um idioma (inclusive ao idioma corrente) em tempo de execução e persistir a preferência.
- **Limpeza/Reset (`clearSavedLanguage`)**: Método utilitário para restaurar as configurações de fábrica/padrão, se necessário.

### 3. Testes Unitários (`test/system_language_test.dart`)
- Adicionar testes automatizados cobrindo:
  - Registro e alteração de livros/idiomas em tempo de execução.
  - Carregamento e salvamento com `SharedPreferences` mockado.
  - Formatação e saída de textos (`out`, `molded`).

### 4. Documentação (`README.md`)
- Atualizar a documentação do projeto com exemplos práticos de como inicializar o `SystemLanguage` no `main()` do app e alterar o livro/idioma em tempo de execução com persistência.

---

## Plano de Verificação

### Testes Automatizados
- Executar `flutter test` para validar o comportamento dos livros, troca de idioma e persistência.
- Executar `flutter analyze` para verificar que não há erros de lint ou warnings no código.

### Verificação Manual / Exemplo
- Criar um teste/exemplo demonstrando a troca de idioma e verificação da leitura dos valores persistidos.
