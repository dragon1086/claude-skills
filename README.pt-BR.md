# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | **Português** | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Descubra seu ambiente de ferramentas. Amplifique suas capacidades.**

O Tool Advisor escaneia seu ambiente em tempo de execucao — servidores MCP, skills, plugins, ferramentas CLI — e sugere composicoes otimas de ferramentas como **opcoes nao vinculantes** com comandos prontos para copiar e colar. Ele fornece ao modelo conhecimento que nao teria de outra forma.

![Demo](./assets/demo.gif)

## Instalacao

**Opcao 1: Instalacao em uma linha**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Opcao 2: Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
npx skills add dragon1086/claude-skills -y --agent codex
```

Para atualizar, execute o mesmo comando novamente.

## Como Usar

Apenas pergunte naturalmente:

```
"Analise com tool-advisor: refatorar o modulo de autenticacao"
"tool-advisor, como devo abordar esta migracao de banco de dados?"
"Qual e a melhor abordagem para implementar autenticacao de usuarios?"
```

A skill e ativada quando voce menciona **tool-advisor** ou pede recomendacoes de ferramentas.

## Como Funciona

```
Seu Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.4            │
│  "Amplificador, nao Comandante" │
├──────────────────────────────────┤
│ 1. Descobrir Ambiente            │
│    MCP / Skills / Plugins / CLI  │
│ 2. Analisar Tarefa + Done When   │
│ 3. Combinar Capacidades          │
│ 4. Sugerir Opcoes (ate 3)        │
│ 5. Identificar Lacunas           │
│ 6. Dicas de Performance          │
└──────────────────────────────────┘
    ↓
Opcoes + Tabela de Acao Rapida
```

## Recursos

| Recurso | Descricao |
|---------|-----------|
| **Escaneamento de Ambiente 4 Camadas** | Descobre servidores MCP, skills, plugins e ferramentas CLI em tempo de execucao |
| **Criterios de Conclusao** | Extrai "Done when" dos prompts para o modelo conhecer a meta |
| **Saida Adaptativa** | Tarefas pequenas <10 linhas; tarefas grandes analise completa |
| **Sugestoes Multi-Opcao** | Ate 3 abordagens (Metodico / Rapido / Profundo) — nunca impoe |
| **Analise de Lacunas** | Sugere ferramentas faltantes com aviso "realizavel sem estas" |
| **Iron Rules & Anti-Padroes** | 9 regras limite previnem desvio de consultor para executor; 3 anti-padroes concisos |
| **Aplicacao de Fases** | Cada fase DEVE produzir saida ou "N/A" explicito — sem pular |
| **Human-in-the-loop** | Nunca instala sem sua aprovacao |

## Exemplo

**Entrada:**
```
Analise com tool-advisor: Refatorar modulo auth para usar tokens JWT
```

**Saida:**
```markdown
## Tool Advisor v3.4 — Analise de Ambiente e Composicao

Prompt: `Refatorar modulo auth para usar tokens JWT`

### Seu Ambiente

| Camada | Disponivel |
|--------|-----------|
| Servidores MCP | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 agentes) |
| CLI | git, node, pytest, docker |

### Perfil da Tarefa
- **Tipo**: Modificacao / **Escala**: Grande / **Caracteristicas**: Precisa planejamento, tem testes
- **Done when**: auth baseado em sessoes substituido por JWT, testes passam, sem imports de sessao

### Capacidades Relevantes
- `lsp_diagnostics` — Verificacao de tipos pos-mudancas
- `ast_grep_search` — Encontrar padroes de uso de sessoes
- `/feature-dev` — Fluxo de desenvolvimento guiado

### Abordagens Sugeridas

**A — Metodico** (Recomendado)
Task(Explore) -> EnterPlanMode -> Edit em etapas -> Bash(pytest)

**B — Guiado por Skill**
/feature-dev (gerencia todo o fluxo)

**C — Agentes em Paralelo**
[Task(Explore, bg), WebSearch("JWT best practices")] -> planejar -> implementar

---

## Acao Rapida

| Abordagem | Copiar e Colar |
|-----------|----------------|
| Metodico | Comecar com `Task(Explore)` para explorar o codigo |
| Guiado por Skill | `/feature-dev` e descrever a refatoracao |
| Rapido | `Glob("**/auth/**") + Grep("session")` em paralelo |

-> Recomendado: "Metodico" (refatoracao grande se beneficia de planejar primeiro)
```

## Requisitos

- Claude Code CLI and/or Codex CLI

## Licenca

MIT © 2026 dragon1086
