# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | **Español** | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | [Deutsch](./README.de.md)

**Deja de adivinar qué herramienta usar. Deja que Claude Code decida.**

Tool Advisor analiza tu prompt y recomienda la combinación óptima de herramientas, agentes, servidores MCP y patrones de orquestación — con **comandos listos para copiar y pegar** que puedes ejecutar inmediatamente.

![Demo](./assets/demo.gif)

## Instalación

**Opción 1: Instalación en una línea**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Opción 2: Vía [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills
```

Para actualizar, ejecuta el mismo comando nuevamente.

## Uso

Solo pregunta naturalmente:

```
"Analiza con tool-advisor: refactorizar el módulo de autenticación"
"tool-advisor, ¿cómo debería abordar esta migración de base de datos?"
"¿Cuál es el mejor enfoque para implementar autenticación de usuarios?"
```

El skill se activa cuando mencionas **tool-advisor** o pides recomendaciones de herramientas.

## Cómo Funciona

```
Tu Prompt
    ↓
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. Verificar inventario local   │
│ 2. Evaluar complejidad          │
│ 3. Detectar necesidad de harness│
│ 4. ¿Recomendar plan mode?       │
│ 5. Seleccionar agentes (3 niv.) │
│ 6. Verificar necesidades MCP    │
│ 7. Sugerir instalación          │
│ 8. Tabla de Acción Rápida       │
└─────────────────────────────────┘
    ↓
🎯 Comandos listos para copiar y pegar
```

## Características

| Característica | Descripción |
|----------------|-------------|
| **Tabla de Acción Rápida** | Comandos para copiar y pegar de ejecución inmediata |
| **Detección de Plan Mode** | Recomienda `EnterPlanMode` para tareas complejas |
| **Patrones Harness** | Detecta "hasta que", "sigue intentando" → patrón Ralph |
| **Búsqueda de Agentes 3 Niveles** | Integrado → Local personalizado → Marketplace |
| **Recomendación MCP** | Muestra estado de instalación (✅/❌) con alternativas |
| **Human-in-the-loop** | Nunca instala sin tu aprobación |

## Ejemplo

**Entrada:**
```
Analiza con tool-advisor: Refactorizar módulo auth para usar tokens JWT
```

**Salida:**
```markdown
## Resultado del Análisis

### 1. Clasificación
- Tipo: Refactorización/Arquitectura
- Complejidad: Compleja (5+ archivos)

### 2. Harness
- Requerido: No

### 3. Plan Mode
- Recomendado: Sí
- Razón: Múltiples archivos, sensible a seguridad

### 4. Agente
- feature-dev (instalado)
- backend-developer (agente local)
- security-engineer (agente local)

### 5. Recomendación
Usar /feature-dev con Plan Mode

---

## 🎯 Acción Rápida

| Tu situación | Copiar y pegar |
|--------------|----------------|
| Planificar primero | `Planifica la refactorización JWT` |
| Desarrollo guiado | `/feature-dev` |
| Solo hazlo | `Refactoriza auth para usar JWT` |

→ Recomendado: "Planificar primero" (5+ archivos, sensible a seguridad)
```

## Requisitos

- Claude Code CLI

## Licencia

MIT © 2026 dragon1086
