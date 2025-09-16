
# Rick and Morty Pokedex

Bem-vindo ao Rick and Morty Pokedex! Este projeto é um aplicativo Flutter moderno e responsivo que transforma o universo da série Rick and Morty em uma experiência interativa de Pokédex. Ideal para fãs, curiosos e desenvolvedores que buscam referência de arquitetura, UI/UX e integração com APIs públicas.

## Sobre o Projeto
O Rick and Morty Pokedex foi desenvolvido para ser multiplataforma (Web e Android), com foco em usabilidade, performance e visual atraente. Utiliza a [Rick and Morty API](https://rickandmortyapi.com/) para buscar e exibir personagens, episódios e localizações, tudo organizado em uma interface intuitiva e divertida.

## Recursos Principais
- **Busca inteligente** de personagens, com sugestões e debounce
- **Detalhes completos**: informações, localizações e episódios de cada personagem
- **Lista de episódios** com visual moderno e navegação fluida
- **Design responsivo**: adapta-se perfeitamente a diferentes tamanhos de tela
- **Provider** para gerenciamento de estado eficiente
- **Widgets customizados** para consistência visual
- **Paginação, tratamento de erros e retry automático**
- **Testes unitários e de widgets** para garantir qualidade
- **CI/CD automatizado** via GitHub Actions

## Como Executar
1. Instale o Flutter 3.22.0 ou superior
2. No diretório do projeto, rode `flutter pub get`
3. Para Web: `flutter run -d chrome`
4. Para Android: `flutter run -d android`

## Estrutura do Projeto
- `lib/models`: Modelos de dados (Character, Location, Episode)
- `lib/services`: Serviço de API
- `lib/providers`: Provider de busca
- `lib/widgets`: Widgets customizados
- `lib/screens`: Telas do app
- `test/`: Testes unitários e de widgets
- `.github/workflows/ci.yaml`: Workflow de CI
- `analysis_options.yaml`: Regras de lint

## Diferenciais Técnicos
- Arquitetura escalável e modular
- UI polida com animações, cards, gradientes e centralização
- Código limpo, documentado e fácil de manter
- Automatização total de testes, análise e formatação

## Futuras Melhorias
- Testes de integração
- Mais animações e efeitos visuais
- Suporte para iOS e desktop
- Filtros avançados e favoritos

## Agradecimentos
Este projeto foi idealizado e desenvolvido por luizGDpulz em setembro de 2025, inspirado pela comunidade Flutter e fãs de Rick and Morty. Sinta-se livre para contribuir, sugerir melhorias ou usar como base para seus próprios apps!

---