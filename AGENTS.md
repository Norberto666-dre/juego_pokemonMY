# AGENTS.md — Pokémon Card & Slot Battle

## Contexto
Juego móvil Flutter. Fuente de verdad: docs/GDD.md. Lee la sección indicada en cada tarea.

## Arquitectura (obligatoria)
- Feature-first. Capas: presentation / domain / data.
- `lib/domain` NO importa Flutter, Drift, Dio ni Supabase.
- Estado: Riverpod. Navegación: go_router. Modelos: freezed.
- Toda aleatoriedad pasa por la interfaz `Rng` (nunca `Random()` directo en dominio).
- Offline-first: la UI lee de Drift; las APIs externas NO se llaman durante partidas.
- Errores: `Result<T>`/`Failure`, no excepciones hasta la UI.

## Comandos
- Generar código: `dart run build_runner build --delete-conflicting-outputs`
- Formato: `dart format .`
- Análisis: `flutter analyze --fatal-infos`
- Tests: `flutter test`
- Integración: `flutter test integration_test`

## Reglas de trabajo
1. Una tarea = una rama `feat/T-XXX-nn-descripcion`.
2. Escribe primero los tests del dominio, luego la implementación.
3. No añadas dependencias sin justificarlo en el PR.
4. Textos visibles en lib/l10n/app_es.arb (y app_en.arb).
5. Accesibilidad: Semantics, objetivos ≥ 48dp, respeta "reducir animaciones".
6. No subir claves ni datos de usuario. Usa --dart-define-from-file.
7. Si una especificación del GDD es ambigua, detente y pregunta; no inventes reglas.
8. Al terminar: ejecuta format, analyze y test; resume qué cambió y qué falta.

## Prohibido
- Hardcodear probabilidades fuera de SlotConfig / balance_config.
- Lógica de juego dentro de widgets.
- Llamadas de red en build() o durante combate.
- Copiar assets con derechos de terceros al repositorio.
