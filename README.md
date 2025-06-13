# Rick and Morty Flutter App

Aplicativo Flutter que consome a API pública do Rick and Morty, utilizando Riverpod para gerenciamento de estado e arquitetura limpa.

---

## 📖 Sobre o projeto

Este app exibe uma lista de personagens da série "Rick and Morty".  
É possível buscar personagens pelo nome, visualizar detalhes em modal e favoritar personagens.  
A interface é responsiva e suporta paginação infinita com scroll.

---

## 🧱 Arquitetura

- **Model:** `Character` representa os dados do personagem.
- **Service:** `ApiService` realiza as requisições HTTP para a API.
- **ViewModel:** `CharacterViewModel` gerencia estado, busca, paginação e favoritos usando Riverpod.
- **UI:** Telas e widgets organizados para exibição e interação, incluindo:
  - `CharacterScreen` (lista com busca e scroll infinito)
  - `FavoritesScreen` (lista de favoritos)
  - `CharacterCard` (card individual)
  - `CharacterDetailModal` (modal com detalhes)
  - `CustomAppBar` e `SearchBarWidget` componentes reutilizáveis.

---

## 🚀 Funcionalidades

- Busca dinâmica por nome com debounce
- Paginação infinita para carregar mais personagens ao rolar a lista
- Marcar e desmarcar favoritos, com lista dedicada
- Modal detalhado responsivo
- Feedbacks visuais para loading e erros

---

## 📦 Tecnologias

- Flutter
- Riverpod (gerenciamento de estado)
- HTTP (requisições REST)
- flutter_svg (exibir logos SVG)
- Dart

---

## 🛠 Como rodar o projeto

1. Clone o repositório:
git clone https://github.com/seuusuario/rick_and_morty_flutter.git

2. Clone o repositório:
flutter pub get

3. Execute o app:
flutter run
