# CineGo 🎬

**CineGo** é um aplicativo móvel desenvolvido em Flutter que oferece uma experiência dinâmica e interativa para visualizar o catálogo de filmes em exibição, selecionar poltronas e realizar a compra de ingressos de cinema. O aplicativo também permite explorar filmes por categorias, ver as próximas estreias, e conta com um visualizador de poltronas que facilita a escolha dos assentos.

## Funcionalidades Principais

- 🔍 **Catálogo de Filmes**: Navegue pelos filmes em exibição e futuros lançamentos com descrições detalhadas.
- 🎞️ **Visualizador de Poltronas Dinâmico**: Selecione seus assentos de forma intuitiva, com ajuste automático do zoom para exibições com muitas poltronas.
- 🎟️ **Compra de Ingressos**: Adicione ingressos ao carrinho, selecione seu assento e finalize a compra diretamente pelo app.
- 🌟 **Avaliações e Favoritos**: Avalie os filmes e adicione aos favoritos para acompanhar seus lançamentos.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento mobile cross-platform.
- **Cubit**: Gerenciamento de estado reativo.
- **Flutter GetIt**: Injeção de dependências para facilitar o uso de serviços.

## Como Executar o Projeto

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/cinego.git
   cd cinego
    ```
2. **Instale as dependências:**

   ```bash
   flutter pub get
   ```
3. **Execute o aplicativo:**

   ```bash
    flutter run
    ```
   
## Estrutura do Projeto

```bash
    lib/
│
├── design/          # Definições de estilo, cores e temas
├── model/           # Modelos de dados
├── view/            # Telas principais como catálogo de filmes, seleção de poltronas, etc.
└── viewmodel/       # Cubits para gerenciamento de estado e lógica de negócio
```
