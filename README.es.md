# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | **Español** | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Descubre tu entorno de herramientas. Amplifica tus capacidades.**

Tool Advisor escanea tu entorno en tiempo de ejecucion — servidores MCP, skills, plugins, herramientas CLI — y sugiere composiciones optimas de herramientas como **opciones no vinculantes** con comandos listos para copiar y pegar. Proporciona al modelo conocimiento que no tendria de otro modo.

![Demo](./assets/demo.gif)

## Instalacion

**Opcion 1: Instalacion en una linea**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Opcion 2: Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
```

Para actualizar, ejecuta el mismo comando nuevamente.

## Uso

Solo pregunta naturalmente:

```
"Analiza con tool-advisor: refactorizar el modulo de autenticacion"
"tool-advisor, como deberia abordar esta migracion de base de datos?"
"Cual es el mejor enfoque para implementar autenticacion de usuarios?"
```

El skill se activa cuando mencionas **tool-advisor** o pides recomendaciones de herramientas.

## Como Funciona

```
Tu Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.1            │
│     "Amplificador, no Comandante"│
├──────────────────────────────────┤
│ 1. Descubrir Entorno             │
│    MCP / Skills / Plugins / CLI  │
│ 2. Analizar Tarea + Done When    │
│ 3. Emparejar Capacidades         │
│ 4. Sugerir Opciones (hasta 3)    │
│ 5. Identificar Brechas           │
│ 6. Consejos de Rendimiento       │
└──────────────────────────────────┘
    ↓
Opciones + Tabla de Accion Rapida
```

## Caracteristicas

| Caracteristica | Descripcion |
|----------------|-------------|
| **Escaneo de Entorno 4 Capas** | Descubre servidores MCP, skills, plugins y herramientas CLI en tiempo de ejecucion |
| **Criterios de Completitud** | Extrae "Done when" de los prompts para que el modelo conozca la meta |
| **Salida Adaptativa** | Tareas pequenas <10 lineas; tareas grandes analisis completo |
| **Sugerencias Multi-Opcion** | Hasta 3 enfoques (Metodico / Rapido / Profundo) — nunca impone |
| **Analisis de Brechas** | Sugiere herramientas faltantes con aviso "realizable sin estas" |
| **Human-in-the-loop** | Nunca instala sin tu aprobacion |

## Ejemplo

**Entrada:**
```
Analiza con tool-advisor: Refactorizar modulo auth para usar tokens JWT
```

**Salida:**
```markdown
## Tool Advisor v3.1 — Analisis de Entorno y Composicion

Prompt: `Refactorizar modulo auth para usar tokens JWT`

### Tu Entorno

| Capa | Disponible |
|------|-----------|
| Servidores MCP | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 agentes) |
| CLI | git, node, pytest, docker |

### Perfil de Tarea
- **Tipo**: Modificacion / **Escala**: Grande / **Rasgos**: Necesita planificacion, tiene tests
- **Done when**: auth basado en sesiones reemplazado con JWT, tests pasan, sin imports de sesion

### Capacidades Relevantes
- `lsp_diagnostics` — Verificacion de tipos post-cambios
- `ast_grep_search` — Buscar patrones de uso de sesiones
- `/feature-dev` — Flujo de desarrollo guiado

### Enfoques Sugeridos

**A — Metodico** (Recomendado)
Task(Explore) -> EnterPlanMode -> Edit por etapas -> Bash(pytest)

**B — Guiado por Skill**
/feature-dev (maneja todo el flujo)

**C — Agentes en Paralelo**
[Task(Explore, bg), WebSearch("JWT best practices")] -> planificar -> implementar

---

## Accion Rapida

| Enfoque | Copiar y Pegar |
|---------|----------------|
| Metodico | Comenzar con `Task(Explore)` para explorar el codigo |
| Guiado por Skill | `/feature-dev` y describir la refactorizacion |
| Rapido | `Glob("**/auth/**") + Grep("session")` en paralelo |

-> Recomendado: "Metodico" (refactorizacion grande se beneficia de planificar primero)
```

## Requisitos

- Claude Code CLI

## Licencia

MIT © 2026 dragon1086
