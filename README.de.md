# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | **Deutsch**

**Entdecken Sie Ihre Tool-Umgebung. Verstarken Sie Ihre Fahigkeiten.**

Tool Advisor scannt Ihre Laufzeitumgebung — MCP-Server, Skills, Plugins, CLI-Tools — und schlagt optimale Tool-Kombinationen als **unverbindliche Optionen** mit kopierfertigen Befehlen vor. Er stattet das Modell mit Wissen aus, das es sonst nicht hatte.

![Demo](./assets/demo.gif)

## Installation

**Option 1: Einzeilige Installation**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2: Uber [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
npx skills add dragon1086/claude-skills -y --agent codex
```

Zum Aktualisieren fuhren Sie denselben Befehl erneut aus.

## Verwendung

Fragen Sie einfach naturlich:

```
"Analysiere mit tool-advisor: Refaktorisierung des Auth-Moduls"
"tool-advisor, wie sollte ich diese Datenbankmigration angehen?"
"Was ist der beste Ansatz fur die Implementierung der Benutzerauthentifizierung?"
```

Der Skill wird aktiviert, wenn Sie **tool-advisor** erwahnen oder nach Tool-Empfehlungen fragen.

## Funktionsweise

```
Ihr Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.4            │
│  „Verstarker, nicht Kommandant"  │
├──────────────────────────────────┤
│ 1. Umgebung entdecken            │
│    MCP / Skills / Plugins / CLI  │
│ 2. Aufgabe analysieren + Done W. │
│ 3. Fahigkeiten abgleichen        │
│ 4. Optionen vorschlagen (bis 3)  │
│ 5. Lucken identifizieren         │
│ 6. Performance-Tipps             │
└──────────────────────────────────┘
    ↓
Optionen + Schnellaktion-Tabelle
```

## Funktionen

| Funktion | Beschreibung |
|----------|--------------|
| **4-Schichten-Umgebungsscan** | Entdeckt MCP-Server, Skills, Plugins und CLI-Tools zur Laufzeit |
| **Abschlusskriterien** | Extrahiert „Done when" aus Prompts, damit das Modell das Ziel kennt |
| **Adaptive Ausgabe** | Kleine Aufgaben <10 Zeilen; grosse Aufgaben vollstandige Analyse |
| **Multi-Optionen-Vorschlage** | Bis zu 3 Ansatze (Methodisch / Schnell / Tiefgehend) — nie aufgezwungen |
| **Luckenanalyse** | Schlagt fehlende Tools vor mit Hinweis „auch ohne diese machbar" |
| **Iron Rules & Anti-Patterns** | 9 Grenzregeln verhindern Abdriften vom Berater zum Ausfuhrer; 3 Anti-Patterns |
| **Phasen-Durchsetzung** | Jede Phase MUSS Ausgabe oder explizites „N/A" produzieren — kein Uberspringen |
| **Human-in-the-loop** | Installiert niemals ohne Ihre Zustimmung |

## Beispiel

**Eingabe:**
```
Analysiere mit tool-advisor: Auth-Modul refaktorisieren fur JWT-Token
```

**Ausgabe:**
```markdown
## Tool Advisor v3.4 — Umgebungs- und Kompositionsanalyse

Prompt: `Auth-Modul refaktorisieren fur JWT-Token`

### Ihre Umgebung

| Schicht | Verfugbar |
|---------|----------|
| MCP-Server | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 Agenten) |
| CLI | git, node, pytest, docker |

### Aufgabenprofil
- **Typ**: Modifikation / **Umfang**: Gross / **Merkmale**: Benotigt Planung, hat Tests
- **Done when**: Session-Auth ersetzt durch JWT, Tests bestanden, keine Session-Imports

### Relevante Fahigkeiten
- `lsp_diagnostics` — Typprufung nach Anderungen
- `ast_grep_search` — Session-Nutzungsmuster finden
- `/feature-dev` — Gefuhrter Entwicklungsworkflow

### Vorgeschlagene Ansatze

**A — Methodisch** (Empfohlen)
Task(Explore) -> EnterPlanMode -> Edit stufenweise -> Bash(pytest)

**B — Skill-gefuhrt**
/feature-dev (verwaltet den gesamten Ablauf)

**C — Agenten parallel**
[Task(Explore, bg), WebSearch("JWT best practices")] -> planen -> implementieren

---

## Schnellaktion

| Ansatz | Kopieren und Einfugen |
|--------|----------------------|
| Methodisch | Mit `Task(Explore)` die Codebasis erkunden |
| Skill-gefuhrt | `/feature-dev` und die Refaktorisierung beschreiben |
| Schnell | `Glob("**/auth/**") + Grep("session")` parallel |

-> Empfohlen: „Methodisch" (grosse Refaktorisierung profitiert von vorheriger Planung)
```

## Voraussetzungen

- Claude Code CLI and/or Codex CLI

## Lizenz

MIT © 2026 dragon1086
