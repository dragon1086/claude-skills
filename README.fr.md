# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | **Français** | [Deutsch](./README.de.md)

**Decouvrez votre environnement d'outils. Amplifiez vos capacites.**

Tool Advisor scanne votre environnement d'execution — serveurs MCP, skills, plugins, outils CLI — et suggere des compositions optimales d'outils sous forme d'**options non contraignantes** avec des commandes pretes a copier-coller. Il fournit au modele des connaissances qu'il n'aurait pas autrement.

![Demo](./assets/demo.gif)

## Installation

**Option 1 : Installation en une ligne**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2 : Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
```

Pour mettre a jour, executez la meme commande a nouveau.

## Utilisation

Demandez simplement naturellement :

```
"Analyse avec tool-advisor : refactoriser le module d'authentification"
"tool-advisor, comment devrais-je aborder cette migration de base de donnees ?"
"Quelle est la meilleure approche pour implementer l'authentification utilisateur ?"
```

La skill s'active lorsque vous mentionnez **tool-advisor** ou demandez des recommandations d'outils.

## Comment ca marche

```
Votre Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.2            │
│  « Amplificateur, pas Commandant │
├──────────────────────────────────┤
│ 1. Decouvrir l'Environnement     │
│    MCP / Skills / Plugins / CLI  │
│ 2. Analyser Tache + Done When    │
│ 3. Apparier les Capacites        │
│ 4. Suggerer des Options (max 3)  │
│ 5. Identifier les Lacunes        │
│ 6. Conseils de Performance       │
└──────────────────────────────────┘
    ↓
Options + Tableau d'Action Rapide
```

## Fonctionnalites

| Fonctionnalite | Description |
|----------------|-------------|
| **Scan d'Environnement 4 Couches** | Decouvre serveurs MCP, skills, plugins et outils CLI a l'execution |
| **Criteres de Completion** | Extrait « Done when » des prompts pour que le modele connaisse l'objectif |
| **Sortie Adaptative** | Petites taches <10 lignes ; grandes taches analyse complete |
| **Suggestions Multi-Options** | Jusqu'a 3 approches (Methodique / Rapide / Approfondi) — jamais impose |
| **Analyse des Lacunes** | Suggere les outils manquants avec mention « realisable sans ceux-ci » |
| **Iron Rules & Anti-Patterns** | 9 regles limites empechent la derive de conseiller vers executeur ; 3 anti-patterns concis |
| **Application des Phases** | Chaque phase DOIT produire une sortie ou un « N/A » explicite — pas de saut |
| **Human-in-the-loop** | N'installe jamais sans votre approbation |

## Exemple

**Entree :**
```
Analyse avec tool-advisor : Refactoriser le module auth pour utiliser les tokens JWT
```

**Sortie :**
```markdown
## Tool Advisor v3.2 — Analyse d'Environnement et Composition

Prompt: `Refactoriser le module auth pour utiliser les tokens JWT`

### Votre Environnement

| Couche | Disponible |
|--------|-----------|
| Serveurs MCP | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 agents) |
| CLI | git, node, pytest, docker |

### Profil de la Tache
- **Type** : Modification / **Echelle** : Grande / **Traits** : Necessite planification, a des tests
- **Done when** : auth par sessions remplace par JWT, tests passent, aucun import de session

### Capacites Pertinentes
- `lsp_diagnostics` — Verification de types apres modifications
- `ast_grep_search` — Trouver les patterns d'utilisation des sessions
- `/feature-dev` — Flux de developpement guide

### Approches Suggerees

**A — Methodique** (Recommande)
Task(Explore) -> EnterPlanMode -> Edit par etapes -> Bash(pytest)

**B — Guide par Skill**
/feature-dev (gere l'ensemble du flux)

**C — Agents en Parallele**
[Task(Explore, bg), WebSearch("JWT best practices")] -> planifier -> implementer

---

## Action Rapide

| Approche | Copier-coller |
|----------|---------------|
| Methodique | Commencer avec `Task(Explore)` pour explorer le code |
| Guide par Skill | `/feature-dev` puis decrire la refactorisation |
| Rapide | `Glob("**/auth/**") + Grep("session")` en parallele |

-> Recommande : « Methodique » (la refactorisation importante beneficie d'une planification prealable)
```

## Prerequis

- Claude Code CLI

## Licence

MIT © 2026 dragon1086
