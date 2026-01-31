# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | **Português** | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Pare de adivinhar qual ferramenta usar. Deixe o Claude Code decidir.**

O Tool Advisor analisa seu prompt e recomenda a combinação ideal de ferramentas, agentes, servidores MCP e padrões de orquestração — com **comandos prontos para copiar e colar** que você pode executar imediatamente.

![Demo](./assets/demo.gif)

## Instalação

```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

Para atualizar, execute o mesmo comando novamente.

## Como Usar

Apenas pergunte naturalmente:

```
"Analise com tool-advisor: refatorar o módulo de autenticação"
"tool-advisor, como devo abordar esta migração de banco de dados?"
"Qual é a melhor abordagem para implementar autenticação de usuários?"
```

A skill é ativada quando você menciona **tool-advisor** ou pede recomendações de ferramentas.

## Como Funciona

```
Seu Prompt
    ↓
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. Verificar inventário local   │
│ 2. Avaliar complexidade         │
│ 3. Detectar necessidade harness │
│ 4. Recomendar plan mode?        │
│ 5. Selecionar agentes (3 níveis)│
│ 6. Verificar necessidades MCP   │
│ 7. Sugerir instalação           │
│ 8. Tabela de Ação Rápida        │
└─────────────────────────────────┘
    ↓
🎯 Comandos prontos para copiar e colar
```

## Recursos

| Recurso | Descrição |
|---------|-----------|
| **Tabela de Ação Rápida** | Comandos para copiar e colar de execução imediata |
| **Detecção de Plan Mode** | Recomenda `EnterPlanMode` para tarefas complexas |
| **Padrões Harness** | Detecta "até que", "continue tentando" → padrão Ralph |
| **Busca de Agentes 3 Níveis** | Integrado → Local personalizado → Marketplace |
| **Recomendação MCP** | Mostra status de instalação (✅/❌) com alternativas |
| **Human-in-the-loop** | Nunca instala sem sua aprovação |

## Exemplo

**Entrada:**
```
Analise com tool-advisor: Refatorar módulo auth para usar tokens JWT
```

**Saída:**
```markdown
## Resultado da Análise

### 1. Classificação
- Tipo: Refatoração/Arquitetura
- Complexidade: Complexa (5+ arquivos)

### 2. Harness
- Necessário: Não

### 3. Plan Mode
- Recomendado: Sim
- Motivo: Múltiplos arquivos, sensível à segurança

### 4. Agente
- feature-dev (instalado)
- backend-developer (agente local)
- security-engineer (agente local)

### 5. Recomendação
Usar /feature-dev com Plan Mode

---

## 🎯 Ação Rápida

| Sua situação | Copiar e colar |
|--------------|----------------|
| Planejar primeiro | `Planeje a refatoração JWT` |
| Desenvolvimento guiado | `/feature-dev` |
| Apenas faça | `Refatore auth para usar JWT` |

→ Recomendado: "Planejar primeiro" (5+ arquivos, sensível à segurança)
```

## Requisitos

- Claude Code CLI

## Licença

MIT © 2026 dragon1086
