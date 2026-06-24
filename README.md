# App Pessoas - Floor & ViewModel

Um aplicativo Flutter simples e direto, desenvolvido para demonstrar a implementação de persistência de dados locais utilizando o pacote **Floor** (ORM para SQLite) em conjunto com o gerenciamento de estado via **Provider** e a arquitetura **ViewModel**.

## 📱 Funcionalidades

* **Cadastro de Pessoas:** Inserção de nome e idade diretamente no banco de dados local.
* **Atualização em Tempo Real:** A lista de pessoas cadastradas na tela inicial é atualizada automaticamente a cada nova inserção, consumindo um `Stream` direto do banco de dados (sem necessidade de recarregar a tela ou gerenciar estados complexos).
* **Validação Básica:** Prevenção de entradas vazias ou idades inválidas.

## 🛠️ Tecnologias e Arquitetura

O projeto foi estruturado seguindo boas práticas de separação de responsabilidades (Layer-First Architecture):

* **Flutter / Dart:** Framework e linguagem base.
* **[Floor](https://pub.dev/packages/floor):** Abstração robusta e *type-safe* do SQLite para o ecossistema Flutter.
* **[Provider](https://pub.dev/packages/provider):** Injeção de dependências e gerenciamento de estado da interface.
* **MVVM (Model-View-ViewModel):** * `Data Layer`: Contém as Entidades (`Person`), DAOs e o próprio Banco de Dados.
  * `ViewModel Layer`: Contém a lógica de negócios (`PersonViewModel`), fazendo a ponte entre os dados e a interface visual.
  * `View Layer`: Contém a interface do usuário (`PersonScreen`).

## 🚀 Como executar o projeto

1. Faça o clone deste repositório:
```bash
git clone [https://github.com/GustavoDare/app-pessoas-flutter.git](https://github.com/GustavoDare/app-pessoas-flutter.git)
```

2. Acesse a pasta do projeto e baixe as dependências:
```bash
cd app-pessoas-flutter
flutter pub get
```

3. **Passo Essencial (Geração do Banco de Dados):**
Como o Floor utiliza geração de código, você precisa rodar o comando abaixo para criar o arquivo `app_database.g.dart` antes de compilar o app:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Execute o aplicativo:
```bash
flutter run
```
