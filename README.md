# Rick and Morty Pokedex

Um aplicativo Flutter que funciona como uma Pokédex temática usando a Rick and Morty API. Compatível com Web e Android, possui busca inteligente, tela de detalhes, lista de episódios, interface responsiva e automação completa de CI/CD.

## Funcionalidades
- Busca de personagens do universo Rick and Morty
- Visualização de detalhes, localizações e episódios
- Design responsivo para Web e Android
- Gerenciamento de estado com Provider
- Widgets customizados: CharacterCard, SearchBarRick, EntityBadge
- Paginação, tratamento de erros e lógica de retry
- Linting, formatação e workflow de CI
- Testes unitários e de widgets

## Como executar
1. Instale o Flutter 3.22.0 ou superior
2. Execute `flutter pub get`
3. Para rodar no Web: `flutter run -d chrome`
4. Para rodar no Android: `flutter run -d android`

## Estrutura do Projeto
- `lib/models`: Modelos de dados (Character, Location, Episode)
- `lib/services`: Serviço de API
- `lib/providers`: Provider de busca
- `lib/widgets`: Widgets customizados
- `lib/screens`: Telas do app
- `test/`: Testes unitários e de widgets
- `.github/workflows/ci.yaml`: Workflow de CI
- `analysis_options.yaml`: Regras de lint

## CI/CD
- Workflow do GitHub Actions executa análise, formatação e testes a cada push/PR

## Justificativa
- Estrutura e nomes de pastas rigorosos para manutenção
- Provider para gerenciamento de estado escalável
- Widgets customizados para consistência visual
- Testes e CI automatizados para confiabilidade

## Checklist
- [x] Estrutura e scaffold do projeto
- [x] Configuração de dependências
- [x] Implementação de modelos, serviços, provider, widgets, telas
- [x] Testes e CI
- [x] Build para Web e Android
- [x] Documentação

## Melhorias Futuras
- Testes de integração
- UI com mais animações
- Suporte para iOS e desktop
- Mais opções de filtro

---

Feito por luizGDpulz, Setembro 2025.