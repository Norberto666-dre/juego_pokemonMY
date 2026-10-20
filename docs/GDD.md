# GDD + Plan de Implementación — Pokémon Card & Slot Battle

> Documento maestro único. Fusiona todos los prompts, GDDs y listas de mecánicas previas en un plan ejecutable módulo por módulo.
> Pensado para ser leído por una persona **y** consumido por agentes de código (OpenCode, Claude Code, etc.) como fuente de verdad.
> Plataforma: móvil (Android / iOS), Web/Desktop opcional. Framework: Flutter + Dart.

---

## Índice

0. Cómo usar este documento
1. Visión, pilares y decisiones previas (legal y de negocio)
2. Requisitos consolidados y trazabilidad
3. Stack tecnológico y dependencias
4. Arquitectura y estructura del repositorio
5. Design system minimalista (tokens, tema, componentes)
6. Navegación y shell de la app
7. Dominio: entidades y value objects
8. Reglas puras del juego (código de referencia)
9. Persistencia local (Drift) y repositorios
10. APIs externas: PokéAPI, TCGdex, apitcg/TCGGraph, pokemontcg.io
11. Interfaces (pantallas): especificación 1–15 + nuevas
12. Motor de la tragaperras (Slot/Gachapon)
13. Overworld procedural con Flame
14. Motor de combate por cartas
15. Captura
16. Economía y balance
17. Backend Supabase (SQL, RLS, Edge Functions)
18. PvP online
19. Animación, audio y librerías avanzadas
20. CRUD completo por entidad
21. Testing
22. CI/CD y entornos
23. Telemetría, accesibilidad, i18n
24. Roadmap por sprints con tareas
25. Guía para agentes de código (OpenCode) y prompts por módulo
26. Riesgos, decisiones abiertas y glosario

---

## 0. Cómo usar este documento

1. Lee las secciones 1 a 4 completas antes de escribir una línea de código.
2. Cada interfaz (sección 11) tiene: objetivo, wireframe, estado, widgets, flujos, CRUD, criterios de aceptación y tareas. Trabaja **una interfaz por rama**.
3. El código incluido es **de referencia**: demuestra contratos, firmas y lógica clave. Puede requerir ajustes menores al compilar con las versiones vigentes de cada paquete.
4. **Verifica versiones al crear el proyecto** (`flutter pub add <paquete>` instala la última compatible). No fijes versiones de memoria.
5. Los IDs de tarea (por ejemplo `T-SLOT-03`) se usan en el roadmap (sección 24) y en los prompts para agentes (sección 25).

Convenciones del documento:

| Marca | Significado |
|---|---|
| **MUST** | Obligatorio para el MVP |
| **SHOULD** | Recomendado, puede ir a beta |
| **COULD** | Opcional / post-lanzamiento |
| ★ | Interfaz o mecánica nueva (no estaba en los documentos originales) |

---

## 1. Visión, pilares y decisiones previas

### 1.1 Concepto

Juego móvil que fusiona tres ideas:

1. **Estrategia de cartas (TCG):** el combate se resuelve jugando cartas de acción.
2. **Aleatoriedad tipo tragaperras/Gachapon:** una máquina decide qué criatura enfrentas o qué premio recibes.
3. **Laberinto procedural infinito** con vista tipo mapa de Super Mario World: nodos, bifurcaciones, atajos secretos.

El corazón del juego es el bucle: **explorar → girar → combatir → capturar → mejorar → avanzar**.

### 1.2 Pilares de diseño

1. **Sorpresa con control:** el azar entretiene, pero siempre hay decisiones (ruta, riesgo, mazo, qué bola usar).
2. **Minimalismo claro:** una acción principal por pantalla; poco texto; mucho feedback visual y sonoro.
3. **Sesiones cortas, progreso largo:** una run dura 5–10 min; la colección dura meses.
4. **Offline-first:** todo funciona sin conexión salvo PvP, intercambios y rankings.
5. **Transparencia:** probabilidades visibles; sin trampas ni mecánicas oscuras.

### 1.3 Público objetivo

Jugadores casuales y mid-core, fans de Pokémon, TCG y gacha. Sesiones en móvil, una mano, vertical.

### 1.4 Decisiones previas OBLIGATORIAS (leer antes de empezar)

#### 1.4.1 Propiedad intelectual

- Pokémon (nombres, diseños, sprites, ilustraciones de cartas) pertenece a Nintendo, Game Freak, Creatures y The Pokémon Company.
- Publicar un juego que use esos activos, especialmente con monetización, puede causar **retirada de tiendas y acciones legales**.
- Las APIs (PokéAPI, TCGdex, pokemontcg.io) exponen datos y URLs de imágenes, pero **eso no otorga licencia** sobre el contenido.

**Estrategia recomendada (data layer intercambiable):**

```
CreatureCatalog (interfaz del dominio)
   ├─ PokeApiCatalog      → modo fan/prototipo (uso personal, no publicar)
   └─ OriginalCatalog     → criaturas propias ("B-Bots") para publicar
```

El dominio nunca depende de `PokemonSpecies` concreto de la API; depende de `CreatureSpecies`. Así, cambiar a criaturas propias es sustituir un repositorio y los assets, no reescribir el juego. En este documento se usa la palabra «Pokémon» por claridad, pero **el modelo de dominio usa `Creature`** donde importa.

#### 1.4.2 Azar y regulación (loot boxes / juegos de azar)

- La tragaperras debe funcionar **solo con monedas/fichas del juego ganables jugando**.
- Prohibido vender tiradas directas con dinero real (en muchos países se considera juego de azar).
- Mostrar **tabla de probabilidades dentro de la app** (requisito de Apple y Google para loot boxes).
- Gemas premium: solo cosméticos, espacio extra, aceleradores; nunca poder exclusivo.
- Clasificación por edad correcta y política de privacidad (si hay cuentas y analítica).

#### 1.4.3 Datos de terceros

- Respetar límites de uso de cada API; **cachear localmente** y no depender de la red durante una partida.
- Registrar una API key gratuita cuando exista (pokemontcg.io).
- Incluir atribución en «Créditos» (PokéAPI, TCGdex, etc.).

---

## 2. Requisitos consolidados y trazabilidad

Resumen de lo pedido en todos los prompts, ahora sin duplicados.

### 2.1 Las tres interfaces principales

| # | Espacio | Contenido |
|---|---|---|
| 1 | **Home / Colección** | Cards con opciones: equipo, Pokédex, cambiar ataques, evolucionar, objetos, álbumes de cartas, crear mazo, colecciones, tienda |
| 2 | **Laberinto vs B-Bots** (la más importante) | Mapa procedural, tragaperras que decide encuentro/objeto, combate, captura, HUD de vida y mazo |
| 3 | **Combate multijugador** | Lobby, matchmaking, combate sincronizado, ranking, amigos, intercambios |

### 2.2 Matriz de trazabilidad (requisito → módulo → sección)

| Requisito original | Módulo | Sección |
|---|---|---|
| Home en cards | `features/home` | 11.1 |
| Pokédex (vistos/capturados, filtros, evoluciones) | `features/pokedex` | 11.2 |
| Cambiar ataque / equipo / liberar / transferir | `features/team` | 11.3 |
| Mazo por Pokémon (15–20 cartas) | `features/deck` | 11.4 |
| Evolución (nivel, piedra, amistad, objeto, intercambio) | `features/evolution` | 11.5 |
| Tienda (bolas, curación, vitaminas, X-stats, equipables, cartas, atajos) | `features/shop` | 11.6 |
| Inventario/Mochila | `features/inventory` | 11.7 |
| Laberinto procedural, atajos secretos | `features/overworld` | 13 |
| Tragaperras: 3 carretes × 10 símbolos, match ≥2 | `features/slot` | 12 |
| Batalla por cartas con tipos y estados | `features/battle` | 14 |
| Captura según HP restante | `features/capture` | 15 |
| PvP, matchmaking ELO, validación servidor | `features/pvp` | 18 |
| Reciclador de repetidos | `features/recycler` | 11.13 |
| Guardería auto-farm | `features/daycare` | 11.14 |
| Gimnasios cada 50 niveles | `features/gyms` | 11.15 |
| Cartas HD en español | `data/api/tcgdex` | 10.3 |
| Sprites retro animados | `data/api/pokeapi` | 10.2 |
| Caché de imágenes | `core/cache` | 10.7 |
| Offline-first + cloud save | Drift + Supabase | 9, 17 |

### 2.3 Aclaración sobre «10 slots en filas de 3»

La descripción original es ambigua. Interpretación adoptada y consistente en todo el documento:

- **3 carretes** (columnas), cada uno con una **banda circular de 10 símbolos**.
- Se ven **3 filas** a la vez; **la fila central es la línea activa**.
- Resultado: **x2** (dos iguales en la línea), **x3** (tres iguales, jackpot) o **sin match**.

Si prefieres otra lectura (por ejemplo 10 carretes), solo cambia `SlotConfig.reelCount` y `symbolsPerReel` (sección 12); el motor es paramétrico.

---

## 3. Stack tecnológico y dependencias

### 3.1 Por qué Flutter + Flame

- Renderizado fluido (Impeller) a 60/120 FPS para carretes, cartas arrastrables y mapa.
- `Draggable` / `DragTarget` / `GestureDetector` nativos para cartas y nodos.
- **Flame** como motor 2D sobre Flutter para el overworld y la animación de carretes (partículas, cámara, sprites).
- Un código Dart para Android, iOS, Web y escritorio.

### 3.2 Tabla de tecnologías

| Capa | Tecnología | Uso |
|---|---|---|
| UI | Flutter (Material 3 personalizado) | Pantallas, formularios, listas |
| Motor 2D | `flame` | Overworld, slot visual, partículas |
| Estado | `flutter_riverpod` + `riverpod_annotation` | Estado y DI |
| Navegación | `go_router` | Rutas, deep links, shell |
| Modelos | `freezed`, `json_serializable` | Inmutabilidad y serialización |
| Local DB | `drift` + `sqlite3_flutter_libs` | Persistencia offline |
| Backend | `supabase_flutter` | Auth, DB, Realtime, Storage |
| Red | `dio` | HTTP con interceptores |
| Imágenes | `cached_network_image` + `flutter_cache_manager` | Caché de cartas y sprites |
| Animación UI | `flutter_animate`, `lottie`, `rive` | Microinteracciones, evoluciones |
| Efectos | `confetti`, `shimmer`, `flutter_staggered_animations` | Jackpot, carga, listas |
| Audio | `flame_audio` / `audioplayers` | SFX y música |
| Gráficos | `fl_chart` | Radar de stats |
| Háptica | `HapticFeedback` (SDK) | Vibración |
| Config | `flutter_dotenv` o `--dart-define` | Claves por entorno |
| Telemetría | `firebase_analytics`, `firebase_crashlytics` | Métricas y errores |
| i18n | `flutter_localizations`, `intl` (arb) | Español e inglés |
| Testing | `flutter_test`, `mocktail`, `integration_test`, `golden_toolkit` | Pruebas |
| Lint | `flutter_lints` o `very_good_analysis` | Calidad |

### 3.3 `pubspec.yaml` de referencia

```yaml
name: pokemon_card_slot_battle
description: Card battler + slot machine + procedural maze.
publish_to: "none"
version: 0.1.0+1

environment:
  sdk: ">=3.4.0 <4.0.0"   # ajustar a la versión de Flutter instalada

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any

  # Estado / navegación
  flutter_riverpod: any
  riverpod_annotation: any
  go_router: any

  # Modelos
  freezed_annotation: any
  json_annotation: any

  # Persistencia
  drift: any
  sqlite3_flutter_libs: any
  path_provider: any
  path: any
  shared_preferences: any

  # Red y backend
  dio: any
  supabase_flutter: any
  connectivity_plus: any

  # Imágenes y caché
  cached_network_image: any
  flutter_cache_manager: any

  # Juego y animación
  flame: any
  flame_audio: any
  flutter_animate: any
  lottie: any
  rive: any
  confetti: any
  shimmer: any
  flutter_staggered_animations: any
  fl_chart: any

  # Utilidades
  collection: any
  equatable: any
  uuid: any
  logger: any

dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  flutter_lints: any
  build_runner: any
  freezed: any
  json_serializable: any
  riverpod_generator: any
  drift_dev: any
  mocktail: any
  golden_toolkit: any

flutter:
  uses-material-design: true
  generate: true
  assets:
    - assets/images/
    - assets/audio/
    - assets/sprites/
    - assets/data/
    - assets/lottie/
    - assets/rive/
  fonts:
    - family: PixelTitle
      fonts:
        - asset: assets/fonts/PressStart2P-Regular.ttf
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600
```

> Nota: `any` es solo para el documento. Al ejecutar `flutter pub add` cada paquete queda con un rango `^x.y.z` seguro. Haz commit del `pubspec.lock`.

### 3.4 Comandos de arranque

```bash
flutter create --org com.tuestudio --platforms=android,ios pokemon_card_slot_battle
cd pokemon_card_slot_battle
flutter pub add flutter_riverpod riverpod_annotation go_router freezed_annotation json_annotation \
  drift sqlite3_flutter_libs path_provider path shared_preferences dio supabase_flutter connectivity_plus \
  cached_network_image flutter_cache_manager flame flame_audio flutter_animate lottie rive confetti shimmer \
  flutter_staggered_animations fl_chart collection equatable uuid logger intl
flutter pub add --dev build_runner freezed json_serializable riverpod_generator drift_dev mocktail golden_toolkit flutter_lints
dart run build_runner build --delete-conflicting-outputs
```

---

## 4. Arquitectura y estructura del repositorio

### 4.1 Capas

```
┌──────────────────────────────────────────────┐
│ Presentation: pantallas, widgets, controllers │  Riverpod Notifiers/AsyncNotifiers
├──────────────────────────────────────────────┤
│ Domain: entidades, casos de uso, reglas puras │  Dart puro, sin Flutter, sin IO
├──────────────────────────────────────────────┤
│ Data: repositorios, DAOs, API clients, mappers│  Drift, Dio, Supabase
└──────────────────────────────────────────────┘
```

Reglas:

- `domain/` **no importa** `package:flutter`, `drift`, `dio` ni `supabase`.
- La UI nunca habla con APIs ni con la DB; solo con repositorios vía providers.
- Toda la aleatoriedad pasa por una interfaz `Rng` inyectable (tests determinísticos, auditoría).
- Flame solo en overworld y en la visual de la tragaperras; el resto son widgets Flutter.

### 4.2 Offline-first

1. Lectura **siempre** desde Drift.
2. Escrituras: local primero, cola de sincronización (`sync_queue`) después.
3. Datos estáticos (especies, movimientos, cartas) se **precargan** y cachean; la partida no hace peticiones de catálogo en vivo.
4. Conflictos: perfil = last-write-wins; inventario = merge por deltas; colección = unión por `uid`.

### 4.3 Estructura del repositorio

```
pokemon_card_slot_battle/
├─ lib/
│  ├─ main.dart
│  ├─ app.dart
│  ├─ bootstrap.dart
│  ├─ core/
│  │  ├─ config/env.dart
│  │  ├─ router/app_router.dart
│  │  ├─ router/routes.dart
│  │  ├─ theme/app_colors.dart
│  │  ├─ theme/app_typography.dart
│  │  ├─ theme/app_theme.dart
│  │  ├─ theme/type_colors.dart
│  │  ├─ di/providers.dart
│  │  ├─ network/dio_client.dart
│  │  ├─ network/api_exception.dart
│  │  ├─ cache/app_cache_manager.dart
│  │  ├─ cache/game_image.dart
│  │  ├─ random/rng.dart
│  │  ├─ audio/audio_service.dart
│  │  ├─ haptics/haptics.dart
│  │  ├─ logging/logger.dart
│  │  └─ widgets/            # componentes UI compartidos
│  ├─ domain/
│  │  ├─ entities/
│  │  ├─ value_objects/
│  │  ├─ rules/
│  │  ├─ repositories/       # interfaces
│  │  └─ usecases/
│  ├─ data/
│  │  ├─ db/app_database.dart
│  │  ├─ db/tables/
│  │  ├─ db/daos/
│  │  ├─ api/pokeapi/
│  │  ├─ api/tcgdex/
│  │  ├─ api/apitcg/
│  │  ├─ remote/supabase/
│  │  ├─ repositories/       # implementaciones
│  │  └─ sync/
│  └─ features/
│     ├─ onboarding/ ★
│     ├─ home/
│     ├─ pokedex/
│     ├─ team/
│     ├─ deck/
│     ├─ cards_album/ ★
│     ├─ evolution/
│     ├─ shop/
│     ├─ inventory/
│     ├─ overworld/
│     ├─ slot/
│     ├─ battle/
│     ├─ capture/
│     ├─ run_summary/ ★
│     ├─ pvp/
│     ├─ friends/ ★
│     ├─ trades/ ★
│     ├─ recycler/
│     ├─ daycare/
│     ├─ gyms/
│     ├─ quests/ ★
│     ├─ profile/
│     ├─ settings/ ★
│     └─ odds_info/ ★
├─ assets/
│  ├─ images/ audio/ sprites/ data/ lottie/ rive/ fonts/
├─ supabase/
│  ├─ migrations/
│  └─ functions/
├─ test/ (unit, widget, golden)
├─ integration_test/
├─ docs/ (GDD.md, api_contracts.md, ADRs)
├─ tool/ (scripts de datos)
├─ .github/workflows/
├─ AGENTS.md
├─ pubspec.yaml
└─ analysis_options.yaml
```

### 4.4 Estructura interna de un feature (plantilla)

```
features/team/
├─ presentation/
│  ├─ team_screen.dart
│  ├─ pc_screen.dart
│  ├─ creature_detail_screen.dart
│  ├─ widgets/ (team_slot.dart, stat_radar.dart, move_picker_sheet.dart)
│  └─ controllers/ (team_controller.dart, pc_controller.dart)
├─ application/ (providers, casos de uso específicos)
└─ README.md  # contrato del feature: estado, eventos, criterios de aceptación
```

### 4.5 Providers raíz (DI)

```dart
// lib/core/di/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final rngProvider = Provider<Rng>((ref) => SecureRng());

final dioProvider = Provider<Dio>((ref) => buildDio(ref.watch(envProvider)));

final creatureRepositoryProvider = Provider<CreatureRepository>(
  (ref) => CreatureRepositoryImpl(
    db: ref.watch(appDatabaseProvider),
    pokeApi: ref.watch(pokeApiClientProvider),
  ),
);

final inventoryRepositoryProvider = Provider<InventoryRepository>(
  (ref) => InventoryRepositoryImpl(ref.watch(appDatabaseProvider)),
);
// ... un provider por repositorio
```

### 4.6 Convenciones de código

- Nombres: `snake_case.dart`; clases `PascalCase`; providers `xxxProvider`.
- Entidades inmutables con `freezed`; copias con `copyWith`.
- Errores tipados: `sealed class Failure` y `Result<T>`; nunca lanzar excepciones hasta la UI.
- Todo texto visible en `.arb` (i18n desde el día 1).
- Cada PR: `flutter analyze` limpio, tests de lo tocado, capturas si es UI.
- ADRs cortos en `docs/adr/` para cada decisión grande (por ejemplo «Drift vs Isar»).

---

## 5. Design system minimalista

### 5.1 Principios

1. **Una acción principal por pantalla** (botón relleno ámbar o cian).
2. **Pixel art solo en personajes, mapa y símbolos**; la UI es plana, con esquinas redondeadas.
3. **Espaciado en escala de 4 px** (4, 8, 12, 16, 24, 32).
4. **Jerarquía por tamaño y color, no por bordes.**
5. **Movimiento con propósito:** 150–250 ms en transiciones; largo solo en slot, captura y evolución.

### 5.2 Tokens de color

```dart
// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

abstract final class AppColors {
  // Fondos
  static const bg = Color(0xFF10201A);          // bosque oscuro
  static const surface = Color(0xFF1B3228);
  static const surfaceHigh = Color(0xFF244235);
  static const outline = Color(0xFF3A5A4A);

  // Acentos
  static const amber = Color(0xFFF5B83D);       // slot, recompensas, CTA principal
  static const cyan = Color(0xFF4FD1C5);        // acciones secundarias
  static const danger = Color(0xFFE5484D);
  static const success = Color(0xFF46C281);

  // Texto
  static const textPrimary = Color(0xFFF2F7F4);
  static const textSecondary = Color(0xFFA9C0B5);
  static const textDisabled = Color(0xFF6C8579);

  // Rareza
  static const rarityCommon = Color(0xFFB8C4BE);
  static const rarityUncommon = Color(0xFF46C281);
  static const rarityRare = Color(0xFF4FA3F5);
  static const rarityEpic = Color(0xFFB66CF2);
  static const rarityLegendary = Color(0xFFF5B83D);
}
```

Colores de los 18 tipos (solo en chips pequeños; incluir además un icono/forma para daltónicos):

```dart
// lib/core/theme/type_colors.dart
const typeColors = <PokeType, Color>{
  PokeType.normal: Color(0xFFA8A77A),   PokeType.fire: Color(0xFFEE8130),
  PokeType.water: Color(0xFF6390F0),    PokeType.grass: Color(0xFF7AC74C),
  PokeType.electric: Color(0xFFF7D02C), PokeType.ice: Color(0xFF96D9D6),
  PokeType.fighting: Color(0xFFC22E28), PokeType.poison: Color(0xFFA33EA1),
  PokeType.ground: Color(0xFFE2BF65),   PokeType.flying: Color(0xFFA98FF3),
  PokeType.psychic: Color(0xFFF95587),  PokeType.bug: Color(0xFFA6B91A),
  PokeType.rock: Color(0xFFB6A136),     PokeType.ghost: Color(0xFF735797),
  PokeType.dragon: Color(0xFF6F35FC),   PokeType.dark: Color(0xFF705746),
  PokeType.steel: Color(0xFFB7B7CE),    PokeType.fairy: Color(0xFFD685AD),
};
```

### 5.3 Tipografía

| Uso | Fuente | Tamaño |
|---|---|---|
| Títulos de pantalla, números del HUD | PixelTitle (Press Start 2P) | 14–20 |
| Cuerpo y descripciones | Inter | 14–16 |
| Etiquetas pequeñas | Inter SemiBold | 11–12 |

Escalado: respetar `MediaQuery.textScaler`; probar a 1.3×.

### 5.4 Tema

```dart
// lib/core/theme/app_theme.dart
ThemeData buildAppTheme() {
  final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.amber,
      secondary: AppColors.cyan,
      surface: AppColors.surface,
      error: AppColors.danger,
      onPrimary: Color(0xFF1B1300),
    ),
    textTheme: base.textTheme.apply(
      fontFamily: 'Inter',
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.surfaceHigh,
      height: 68,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );
}
```

> Si `FadeForwardsPageTransitionsBuilder` no existe en tu versión de Flutter, usa `ZoomPageTransitionsBuilder`.

### 5.5 Componentes compartidos (`core/widgets/`)

| Componente | Descripción | Props clave |
|---|---|---|
| `AppScaffold` | Scaffold con safe areas, fondo y HUD opcional | `title`, `actions`, `hud` |
| `ResourceBar` | Monedas, gemas, boletos con animación de contador | `coins`, `gems`, `tickets` |
| `PrimaryButton` | CTA principal con estado de carga | `label`, `onPressed`, `loading` |
| `TypeChip` | Chip de tipo con color e icono | `type`, `size` |
| `RarityBadge` | Borde/brillo según rareza | `rarity` |
| `HpBar` | Barra de vida animada con color por umbral | `current`, `max` |
| `StatusChip` | Estado alterado con contador de turnos | `status`, `turns` |
| `CreatureTile` | Sprite + nombre + nivel + tipos | `creature`, `onTap` |
| `CardTile` | Carta TCG o carta de acción con flip y zoom | `card`, `selected` |
| `EmptyState` | Mensaje + botón para pantallas vacías | `icon`, `message`, `cta` |
| `ConfirmSheet` | Confirmación de acciones destructivas con deshacer | `title`, `body`, `onConfirm` |
| `RewardToast` | Toast de recompensas apilable | `reward` |
| `SkeletonList` | Carga con shimmer | `itemCount` |
| `OddsSheet` | Hoja con probabilidades del slot | `table` |

`HpBar` de referencia:

```dart
class HpBar extends StatelessWidget {
  const HpBar({super.key, required this.current, required this.max});
  final int current;
  final int max;

  Color _color(double r) => r > 0.5
      ? AppColors.success
      : r > 0.2
          ? AppColors.amber
          : AppColors.danger;

  @override
  Widget build(BuildContext context) {
    final ratio = max == 0 ? 0.0 : (current / max).clamp(0.0, 1.0);
    return Semantics(
      label: 'Vida $current de $max',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: ratio, end: ratio),
          duration: const Duration(milliseconds: 300),
          builder: (_, v, __) => LinearProgressIndicator(
            value: v,
            minHeight: 10,
            backgroundColor: AppColors.surfaceHigh,
            valueColor: AlwaysStoppedAnimation(_color(v)),
          ),
        ),
      ),
    );
  }
}
```

### 5.6 Reglas de accesibilidad del sistema

- Tamaño táctil mínimo 48×48 dp.
- Contraste AA mínimo; texto principal sobre `surface` ≥ 7:1.
- Nunca solo color: tipo = color + icono; estado = color + texto corto.
- `Semantics` en barras, cartas y botones de icono.
- Opción «Reducir animaciones» (desactiva shake de cámara, confeti, giros largos).
- Opción «Captura automática» (sin minijuego de timing).

---

## 6. Navegación y shell de la app

### 6.1 Mapa de rutas

| Ruta | Pantalla | Tipo |
|---|---|---|
| `/splash` | Splash y precarga | raíz |
| `/onboarding` | Onboarding ★ | raíz |
| `/home` | Home Hub | tab 1 |
| `/collection` | Colección (equipo, PC, álbum) | tab 2 |
| `/shop` | Tienda | tab 3 |
| `/profile` | Perfil | tab 4 |
| `/maze` | Overworld (botón central) | pantalla completa |
| `/maze/slot` | Slot (modal) | modal |
| `/battle/:encounterId` | Batalla | pantalla completa |
| `/capture/:encounterId` | Captura | modal |
| `/run-summary/:runId` | Resumen de run ★ | pantalla completa |
| `/pokedex`, `/pokedex/:speciesId` | Pokédex y detalle | push |
| `/team`, `/team/pc`, `/creature/:uid` | Equipo, PC, detalle | push |
| `/deck/:uid` | Constructor de mazo | push |
| `/cards`, `/cards/:cardId` | Álbum de cartas ★ | push |
| `/evolution` | Evolución/incubadora | push |
| `/inventory` | Inventario | push |
| `/recycler`, `/daycare`, `/gyms` | Módulos de meta | push |
| `/quests` ★ | Misiones y logros | push |
| `/pvp`, `/pvp/match/:matchId` | Arena | push |
| `/friends`, `/trades` ★ | Social | push |
| `/settings`, `/odds` ★ | Ajustes y probabilidades | push |

### 6.2 Shell con barra inferior (4 pestañas + botón central)

```
┌───────────────────────────────┐
│          contenido            │
├───────────────────────────────┤
│ Inicio  Colección ( ⚔ ) Tienda  Perfil │
└───────────────────────────────┘
          botón central grande = Laberinto
```

```dart
// lib/core/router/app_router.dart
final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(sessionProvider);
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final onboarded = ref.read(onboardingDoneProvider);
      if (!onboarded && state.matchedLocation != '/onboarding' &&
          state.matchedLocation != '/splash') {
        return '/onboarding';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/collection', builder: (_, __) => const CollectionScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/shop', builder: (_, __) => const ShopScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
          ]),
        ],
      ),
      GoRoute(path: '/maze', builder: (_, __) => const OverworldScreen()),
      GoRoute(
        path: '/battle/:encounterId',
        builder: (_, s) => BattleScreen(encounterId: s.pathParameters['encounterId']!),
      ),
      GoRoute(
        path: '/capture/:encounterId',
        pageBuilder: (_, s) => CustomTransitionPage(
          child: CaptureScreen(encounterId: s.pathParameters['encounterId']!),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          opaque: false,
        ),
      ),
      // ... resto de rutas push
    ],
  );
});
```

```dart
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => context.push('/maze'),
        backgroundColor: AppColors.amber,
        child: const Icon(Icons.explore, color: Color(0xFF1B1300)),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (i) => shell.goBranch(i, initialLocation: i == shell.currentIndex),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.collections_bookmark_outlined), label: 'Colección'),
          NavigationDestination(icon: Icon(Icons.storefront_outlined), label: 'Tienda'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}
```

### 6.3 Reglas de navegación

- Máximo **2 toques** para llegar a cualquier función frecuente.
- El botón «atrás» del sistema nunca debe sacar al jugador de una batalla sin confirmar (`PopScope`).
- Las pantallas de combate, captura y slot **bloquean** la navegación por barra inferior.
- Deep links previstos: `app://battle/<matchId>` (reto de amigo), `app://trade/<id>`.

---

## 7. Dominio: entidades y value objects

### 7.1 Enumeraciones base

```dart
// lib/domain/value_objects/enums.dart
enum PokeType {
  normal, fire, water, grass, electric, ice, fighting, poison, ground,
  flying, psychic, bug, rock, ghost, dragon, dark, steel, fairy,
}

enum MoveCategory { physical, special, status }

enum StatusCondition { none, burn, poison, paralysis, freeze, sleep, confusion }

enum Rarity { common, uncommon, rare, epic, legendary }

enum ItemCategory { ball, healing, vitamin, xstat, held, evolution, shortcut, ticket, material }

enum NodeType { battle, chest, shop, cave, boss, rest, secret, gym, event }

enum Biome { forest, cave, volcano, ocean, mountain, desert }

enum SlotContext { encounter, chest, secret, shop }
```

### 7.2 Value objects

```dart
// lib/domain/value_objects/stats.dart
@freezed
class Stats with _$Stats {
  const factory Stats({
    required int hp, required int atk, required int def,
    required int spa, required int spd, required int spe,
  }) = _Stats;
}

@freezed
class Ivs with _$Ivs {
  const Ivs._();
  const factory Ivs({
    @Default(0) int hp, @Default(0) int atk, @Default(0) int def,
    @Default(0) int spa, @Default(0) int spd, @Default(0) int spe,
  }) = _Ivs;
  // Cada valor 0..31
  static Ivs random(Rng rng) => Ivs(
        hp: rng.nextInt(32), atk: rng.nextInt(32), def: rng.nextInt(32),
        spa: rng.nextInt(32), spd: rng.nextInt(32), spe: rng.nextInt(32),
      );
}

@freezed
class Evs with _$Evs {
  const Evs._();
  const factory Evs({
    @Default(0) int hp, @Default(0) int atk, @Default(0) int def,
    @Default(0) int spa, @Default(0) int spd, @Default(0) int spe,
  }) = _Evs;
  // Cada valor 0..252; suma máxima 510
  int get total => hp + atk + def + spa + spd + spe;
}

enum Nature {
  hardy, lonely, brave, adamant, naughty, bold, docile, relaxed, impish, lax,
  timid, hasty, serious, jolly, naive, modest, mild, quiet, bashful, rash,
  calm, gentle, sassy, careful, quirky;
}
```

Tabla de naturalezas (+10 % / −10 %):

| Naturaleza | + | − | Naturaleza | + | − |
|---|---|---|---|---|---|
| Firme (adamant) | atk | spa | Alegre (jolly) | spe | spa |
| Miedosa (timid) | spe | atk | Modesta (modest) | spa | atk |
| Serena (calm) | spd | atk | Audaz (bold) | def | atk |
| Picara (impish) | def | spa | Activa (hasty) | spe | def |
| Cauta (careful) | spd | spa | Fuerte/Neutras | — | — |

> Las neutras (Hardy, Docile, Serious, Bashful, Quirky) no modifican nada.

### 7.3 Entidades principales

```dart
// lib/domain/entities/creature_species.dart
@freezed
class CreatureSpecies with _$CreatureSpecies {
  const factory CreatureSpecies({
    required int id,
    required String name,               // localizado
    required List<PokeType> types,
    required Stats baseStats,
    required List<String> abilityIds,
    String? hiddenAbilityId,
    required int evolutionChainId,
    required Rarity rarity,
    required int captureRate,           // 3..255 (PokéAPI capture_rate)
    required int generation,            // 1..9
    required String region,
    required String spriteUrl,          // PNG estático
    String? spriteAnimatedUrl,          // GIF animado retro
    @Default(false) bool isLegendary,
    @Default(false) bool isMythical,
    @Default(70) int baseFriendship,
  }) = _CreatureSpecies;
}

// lib/domain/entities/creature_instance.dart
@freezed
class CreatureInstance with _$CreatureInstance {
  const factory CreatureInstance({
    required String uid,                // uuid v4
    required int speciesId,
    @Default('') String nickname,
    required int level,
    required int exp,
    required Ivs ivs,
    required Evs evs,
    required Nature nature,
    required String abilityId,
    required List<String> moveIds,      // máx. 4
    String? heldItemId,
    @Default(false) bool shiny,
    @Default(70) int friendship,
    @Default(false) bool favorite,
    required DateTime capturedAt,
    required StorageSlot slot,          // team(0..5) | pc | daycare
    int? currentHp,                     // null = HP máximo
    @Default(StatusCondition.none) StatusCondition status,
  }) = _CreatureInstance;
}

sealed class StorageSlot {
  const StorageSlot();
}
class TeamSlot extends StorageSlot { const TeamSlot(this.index); final int index; }
class PcSlot extends StorageSlot { const PcSlot(); }
class DaycareSlot extends StorageSlot { const DaycareSlot(this.index); final int index; }

// lib/domain/entities/move.dart
@freezed
class Move with _$Move {
  const factory Move({
    required String id,
    required String name,
    required PokeType type,
    required MoveCategory category,
    int? power,
    int? accuracy,                       // null = nunca falla
    required int pp,
    @Default(0) int priority,            // -7..+5
    required MoveEffect effect,
    String? description,
  }) = _Move;
}

@freezed
class MoveEffect with _$MoveEffect {
  const factory MoveEffect({
    StatusCondition? inflictStatus,
    @Default(0) int statusChance,        // 0..100
    @Default({}) Map<String, int> statStages, // {'atk': +1} propio o rival
    @Default(false) bool targetsSelf,
    @Default(0) int healPercent,
    @Default(0) int recoilPercent,
    @Default(1.0) double critRatioBonus,
  }) = _MoveEffect;
}

// lib/domain/entities/card_action.dart  (carta jugable en combate)
@freezed
class CardAction with _$CardAction {
  const factory CardAction({
    required String id,
    required String name,
    required CardKind kind,              // attack | status | item | defense
    required int energyCost,             // 0..4
    required Rarity rarity,
    String? moveId,                      // si kind == attack/status
    String? itemId,                      // si kind == item
    @Default(0) int priority,
    @Default(1) int usesPerBattle,       // equivalente al PP
    String? artUrl,                      // arte TCG opcional
    String? tcgCardId,                   // vínculo a TCGdex
    @Default(1) int level,               // mejorable con polvo
  }) = _CardAction;
}
enum CardKind { attack, status, item, defense }

// lib/domain/entities/deck.dart
@freezed
class Deck with _$Deck {
  const factory Deck({
    required String id,
    required String creatureUid,
    required String name,
    required List<String> cardIds,       // 15..20, repetibles según regla
    required DateTime updatedAt,
  }) = _Deck;
}

// lib/domain/entities/item.dart
@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required ItemCategory category,
    required String description,
    required int price,                  // monedas
    int? gemPrice,
    required ItemEffect effect,
    @Default(99) int maxStack,
  }) = _Item;
}

// lib/domain/entities/player_profile.dart
@freezed
class PlayerProfile with _$PlayerProfile {
  const factory PlayerProfile({
    required String id,
    required String name,
    required String avatarId,
    required int level,
    required int exp,
    required int coins,
    required int gems,
    required int tokens,                 // fichas de tragaperras
    required int tickets,                // boletos especiales
    required int elo,
    required int maxDepth,
    required List<String> badges,
    required DateTime createdAt,
  }) = _PlayerProfile;
}

// lib/domain/entities/maze.dart
@freezed
class MazeNode with _$MazeNode {
  const factory MazeNode({
    required String id,
    required int depth,
    required int lane,                   // 0..4 (columna visual)
    required NodeType type,
    required Biome biome,
    required List<String> nextIds,
    @Default(false) bool revealed,
    @Default(false) bool visited,
    String? secretTargetId,              // atajo secreto
  }) = _MazeNode;
}

@freezed
class MazeRun with _$MazeRun {
  const factory MazeRun({
    required String id,
    required int seed,
    required int currentDepth,
    required String currentNodeId,
    required List<String> visitedNodeIds,
    required List<String> discoveredSecretIds,
    required RunResources resources,     // lo ganado en esta run
    required RunStatus status,           // active | finished | abandoned
  }) = _MazeRun;
}
```

### 7.4 Interfaz `Rng` (azar auditable)

```dart
// lib/core/random/rng.dart
abstract interface class Rng {
  int nextInt(int max);                 // [0, max)
  double nextDouble();                  // [0, 1)
  bool chance(double p) => nextDouble() < p;
  T pick<T>(List<T> items) => items[nextInt(items.length)];
  T weighted<T>(Map<T, num> weights);
  Rng fork(int salt);                   // sub-generador determinista
}

class SecureRng implements Rng {
  final _r = Random.secure();
  @override int nextInt(int max) => _r.nextInt(max);
  @override double nextDouble() => _r.nextDouble();
  @override bool chance(double p) => nextDouble() < p;
  @override T pick<T>(List<T> items) => items[nextInt(items.length)];
  @override T weighted<T>(Map<T, num> weights) => _weighted(this, weights);
  @override Rng fork(int salt) => SeededRng(_r.nextInt(1 << 31) ^ salt);
}

class SeededRng implements Rng {
  SeededRng(int seed) : _r = Random(seed);
  final Random _r;
  @override int nextInt(int max) => _r.nextInt(max);
  @override double nextDouble() => _r.nextDouble();
  @override bool chance(double p) => nextDouble() < p;
  @override T pick<T>(List<T> items) => items[nextInt(items.length)];
  @override T weighted<T>(Map<T, num> weights) => _weighted(this, weights);
  @override Rng fork(int salt) => SeededRng(_r.nextInt(1 << 31) ^ salt);
}

T _weighted<T>(Rng rng, Map<T, num> weights) {
  final total = weights.values.fold<num>(0, (a, b) => a + b);
  var roll = rng.nextDouble() * total;
  for (final e in weights.entries) {
    roll -= e.value;
    if (roll < 0) return e.key;
  }
  return weights.keys.last;
}
```

---

## 8. Reglas puras del juego (código de referencia)

Todas viven en `lib/domain/rules/` y se prueban con miles de simulaciones.

### 8.1 Tabla de tipos

```dart
// lib/domain/rules/type_chart.dart
import '../value_objects/enums.dart';

/// Multiplicador del ataque [atk] contra defensor [def].
/// Se construye desde PokéAPI (/type/{id} → damage_relations) y se guarda en assets/data/type_chart.json
class TypeChart {
  TypeChart(this._table);
  final Map<PokeType, Map<PokeType, double>> _table;

  double multiplier(PokeType atk, PokeType def) => _table[atk]?[def] ?? 1.0;

  double against(PokeType atk, List<PokeType> defTypes) =>
      defTypes.fold(1.0, (m, d) => m * multiplier(atk, d));

  /// Para la pista visual de la carta: 'super', 'resisted', 'immune', 'neutral'
  EffectLabel label(PokeType atk, List<PokeType> defTypes) {
    final m = against(atk, defTypes);
    if (m == 0) return EffectLabel.immune;
    if (m >= 2) return EffectLabel.superEffective;
    if (m < 1) return EffectLabel.resisted;
    return EffectLabel.neutral;
  }
}
enum EffectLabel { superEffective, resisted, immune, neutral }
```

Los datos de la tabla se generan **una vez** con un script (`tool/build_type_chart.dart`) que lee PokéAPI y escribe `assets/data/type_chart.json`; en tiempo de juego no hay llamadas.

### 8.2 Estadísticas finales

```dart
// lib/domain/rules/stat_calculator.dart
class StatCalculator {
  /// Fórmula clásica (generaciones 3+).
  static int hp(int base, int iv, int ev, int level) =>
      ((2 * base + iv + (ev ~/ 4)) * level ~/ 100) + level + 10;

  static int other(int base, int iv, int ev, int level, double natureMod) =>
      ((((2 * base + iv + (ev ~/ 4)) * level ~/ 100) + 5) * natureMod).floor();

  static Stats compute(CreatureSpecies s, CreatureInstance c) {
    double nm(String stat) => natureModifier(c.nature, stat);
    return Stats(
      hp: hp(s.baseStats.hp, c.ivs.hp, c.evs.hp, c.level),
      atk: other(s.baseStats.atk, c.ivs.atk, c.evs.atk, c.level, nm('atk')),
      def: other(s.baseStats.def, c.ivs.def, c.evs.def, c.level, nm('def')),
      spa: other(s.baseStats.spa, c.ivs.spa, c.evs.spa, c.level, nm('spa')),
      spd: other(s.baseStats.spd, c.ivs.spd, c.evs.spd, c.level, nm('spd')),
      spe: other(s.baseStats.spe, c.ivs.spe, c.evs.spe, c.level, nm('spe')),
    );
  }
}
```

### 8.3 Cálculo de daño

```dart
// lib/domain/rules/damage_calculator.dart
class DamageInput {
  DamageInput({
    required this.attackerLevel, required this.power,
    required this.attack, required this.defense,
    required this.moveType, required this.attackerTypes,
    required this.defenderTypes, this.critical = false,
    this.burnedPhysical = false, this.weather = 1.0, this.other = 1.0,
  });
  final int attackerLevel, power, attack, defense;
  final PokeType moveType;
  final List<PokeType> attackerTypes, defenderTypes;
  final bool critical, burnedPhysical;
  final double weather, other;
}

class DamageResult {
  const DamageResult(this.damage, this.multiplier, this.critical);
  final int damage;
  final double multiplier;
  final bool critical;
}

class DamageCalculator {
  DamageCalculator(this.chart, this.rng);
  final TypeChart chart;
  final Rng rng;

  DamageResult calculate(DamageInput i) {
    final base = ((((2 * i.attackerLevel) ~/ 5 + 2) * i.power * i.attack ~/ i.defense) ~/ 50) + 2;
    final stab = i.attackerTypes.contains(i.moveType) ? 1.5 : 1.0;
    final eff = chart.against(i.moveType, i.defenderTypes);
    final crit = i.critical ? 1.5 : 1.0;
    final burn = i.burnedPhysical ? 0.5 : 1.0;
    final rand = 0.85 + rng.nextDouble() * 0.15;       // 0.85..1.00
    final total = base * i.weather * crit * rand * stab * eff * burn * i.other;
    return DamageResult(eff == 0 ? 0 : total.floor().clamp(1, 1 << 30), eff, i.critical);
  }
}
```

Variante TCG/cartas: el daño de una carta se calcula con la misma función; el **nivel de la carta** (mejorable con polvo) suma un `other` de `1 + 0.05 × (cardLevel − 1)`.

### 8.4 Probabilidad de captura

Basada en la fórmula de la generación 3/4, simplificada y legible:

```dart
// lib/domain/rules/capture_calculator.dart
class CaptureInput {
  CaptureInput({
    required this.maxHp, required this.currentHp,
    required this.captureRate, required this.ballMultiplier,
    this.status = StatusCondition.none, this.timingBonus = 0.0,
    this.isLegendary = false,
  });
  final int maxHp, currentHp, captureRate;
  final double ballMultiplier, timingBonus;
  final StatusCondition status;
  final bool isLegendary;
}

class CaptureResult {
  const CaptureResult({required this.probability, required this.shakes, required this.caught});
  final double probability;   // 0..1 por "intento completo"
  final int shakes;           // 0..3 animaciones
  final bool caught;
}

class CaptureCalculator {
  CaptureCalculator(this.rng);
  final Rng rng;

  double statusBonus(StatusCondition s) => switch (s) {
        StatusCondition.sleep || StatusCondition.freeze => 2.0,
        StatusCondition.paralysis || StatusCondition.poison || StatusCondition.burn => 1.5,
        _ => 1.0,
      };

  /// a = ((3*max - 2*cur) * rate * ball) / (3*max) * status
  double modifiedRate(CaptureInput i) {
    final a = ((3 * i.maxHp - 2 * i.currentHp) * i.captureRate * i.ballMultiplier) /
        (3 * i.maxHp) * statusBonus(i.status);
    return a.clamp(1.0, 255.0);
  }

  CaptureResult attempt(CaptureInput i, {bool masterBall = false}) {
    if (masterBall) return const CaptureResult(probability: 1, shakes: 3, caught: true);
    final a = modifiedRate(i);
    // probabilidad por sacudida (formula gen 3/4) b = 1048560 / sqrt(sqrt(16711680 / a))
    final b = 1048560 / sqrt(sqrt(16711680 / a));
    var p = (b / 65536).clamp(0.0, 1.0);          // por sacudida
    p = (p + i.timingBonus).clamp(0.0, 1.0);       // bonus del minijuego (+0.10..+0.25 al total por sacudida)
    var shakes = 0;
    for (var k = 0; k < 4; k++) {
      if (rng.chance(p)) { shakes++; } else { break; }
    }
    return CaptureResult(probability: pow(p, 4).toDouble(), shakes: shakes.clamp(0, 3), caught: shakes >= 4);
  }
}
```

Multiplicadores de bola:

| Bola | Multiplicador | Condición especial |
|---|---|---|
| Poké Ball | ×1 | — |
| Super Ball | ×1.5 | — |
| Ultra Ball | ×2 | — |
| Master Ball | 100 % | Siempre captura (rara; ver economía) |
| Luna Ball | ×4 | Solo criaturas de tipo hada/psíquico (o con evolución por piedra lunar) |
| Honor Ball | ×1 | Cura felicidad inicial (+) |
| Peso Ball | +bonus por peso | Más probabilidad en criaturas pesadas |
| Veloz Ball | ×4 | Solo en el primer turno del combate |

Aceptación: con HP al 100 % y Poké Ball sobre una especie con `captureRate = 45`, la probabilidad total debe quedar entre 3 % y 8 %; con HP al 5 % y estado dormido, por encima del 60 %. Se valida en tests (sección 21).

### 8.5 Experiencia y niveles

```dart
// lib/domain/rules/experience_curve.dart
enum GrowthRate { fast, mediumFast, mediumSlow, slow }

class ExperienceCurve {
  static int expForLevel(GrowthRate g, int n) => switch (g) {
        GrowthRate.fast => (4 * n * n * n) ~/ 5,
        GrowthRate.mediumFast => n * n * n,
        GrowthRate.mediumSlow => ((6 * n * n * n) ~/ 5) - 15 * n * n + 100 * n - 140,
        GrowthRate.slow => (5 * n * n * n) ~/ 4,
      };

  static int levelForExp(GrowthRate g, int exp) {
    var lvl = 1;
    while (lvl < 100 && expForLevel(g, lvl + 1) <= exp) { lvl++; }
    return lvl;
  }

  /// EXP ganada al derrotar (gen 5 simplificada)
  static int battleExp({
    required int enemyBaseExp, required int enemyLevel,
    required int winnerLevel, required bool wild, int participants = 1,
  }) {
    final a = wild ? 1.0 : 1.5;
    final raw = (a * enemyBaseExp * enemyLevel) / (5 * participants);
    final scale = pow((2 * enemyLevel + 10) / (enemyLevel + winnerLevel + 10), 2.5);
    return (raw * scale + 1).floor();
  }
}
```

### 8.6 Evolución

```dart
// lib/domain/rules/evolution_checker.dart
sealed class EvolutionCondition { const EvolutionCondition(); }
class ByLevel extends EvolutionCondition { const ByLevel(this.level); final int level; }
class ByStone extends EvolutionCondition { const ByStone(this.itemId); final String itemId; }
class ByFriendship extends EvolutionCondition { const ByFriendship(this.min, {this.timeOfDay}); final int min; final String? timeOfDay; }
class ByHeldItem extends EvolutionCondition { const ByHeldItem(this.itemId); final String itemId; }
class ByTrade extends EvolutionCondition { const ByTrade({this.withItemId}); final String? withItemId; }
class ByMove extends EvolutionCondition { const ByMove(this.moveId); final String moveId; }
class Special extends EvolutionCondition { const Special(this.key); final String key; }

class EvolutionLink {
  const EvolutionLink(this.fromSpeciesId, this.toSpeciesId, this.condition);
  final int fromSpeciesId, toSpeciesId;
  final EvolutionCondition condition;
}

class EvolutionChecker {
  EvolutionChecker(this.links);
  final List<EvolutionLink> links;

  List<EvolutionOption> optionsFor(CreatureInstance c, {String? usedItemId, bool justTraded = false}) {
    return [
      for (final l in links.where((l) => l.fromSpeciesId == c.speciesId))
        if (_eligible(l.condition, c, usedItemId, justTraded))
          EvolutionOption(l.toSpeciesId, l.condition),
    ];
  }

  bool _eligible(EvolutionCondition cond, CreatureInstance c, String? item, bool traded) =>
      switch (cond) {
        ByLevel(:final level) => c.level >= level,
        ByStone(:final itemId) => item == itemId,
        ByFriendship(:final min) => c.friendship >= min,
        ByHeldItem(:final itemId) => c.heldItemId == itemId && traded,
        ByTrade(:final withItemId) => traded && (withItemId == null || c.heldItemId == withItemId),
        ByMove(:final moveId) => c.moveIds.contains(moveId),
        Special() => false, // se resuelve con reglas ad-hoc
      };
}
class EvolutionOption { const EvolutionOption(this.toSpeciesId, this.condition); final int toSpeciesId; final EvolutionCondition condition; }
```

Al evolucionar: se conservan IVs/EVs/naturaleza; se recalculan stats; se **actualiza la Pokédex** (entrada de la nueva especie); se ofrece aprender movimientos nuevos; se conservan las cartas de mazo válidas y se marcan las no válidas para reemplazo.

---

## 9. Persistencia local (Drift) y repositorios

### 9.1 Esquema

```dart
// lib/data/db/tables/tables.dart
class PlayerProfileTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get avatarId => text().withDefault(const Constant('a01'))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get exp => integer().withDefault(const Constant(0))();
  IntColumn get coins => integer().withDefault(const Constant(500))();
  IntColumn get gems => integer().withDefault(const Constant(0))();
  IntColumn get tokens => integer().withDefault(const Constant(10))();
  IntColumn get tickets => integer().withDefault(const Constant(0))();
  IntColumn get elo => integer().withDefault(const Constant(1000))();
  IntColumn get maxDepth => integer().withDefault(const Constant(0))();
  TextColumn get badges => text().withDefault(const Constant('[]'))(); // json
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override Set<Column> get primaryKey => {id};
}

class SpeciesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get typesJson => text()();            // ["fire","flying"]
  TextColumn get baseStatsJson => text()();
  TextColumn get abilitiesJson => text()();
  TextColumn get hiddenAbility => text().nullable()();
  IntColumn get evolutionChainId => integer()();
  IntColumn get rarity => integer()();
  IntColumn get captureRate => integer()();
  IntColumn get generation => integer()();
  TextColumn get region => text()();
  TextColumn get spriteUrl => text()();
  TextColumn get spriteAnimatedUrl => text().nullable()();
  BoolColumn get isLegendary => boolean().withDefault(const Constant(false))();
  IntColumn get growthRate => integer().withDefault(const Constant(1))();
  IntColumn get baseExp => integer().withDefault(const Constant(60))();
  @override Set<Column> get primaryKey => {id};
}

class CreatureOwnedTable extends Table {
  TextColumn get uid => text()();
  IntColumn get speciesId => integer().references(SpeciesTable, #id)();
  TextColumn get nickname => text().withDefault(const Constant(''))();
  IntColumn get level => integer()();
  IntColumn get exp => integer()();
  IntColumn get ivHp => integer()(); IntColumn get ivAtk => integer()(); IntColumn get ivDef => integer()();
  IntColumn get ivSpa => integer()(); IntColumn get ivSpd => integer()(); IntColumn get ivSpe => integer()();
  IntColumn get evHp => integer().withDefault(const Constant(0))();
  IntColumn get evAtk => integer().withDefault(const Constant(0))();
  IntColumn get evDef => integer().withDefault(const Constant(0))();
  IntColumn get evSpa => integer().withDefault(const Constant(0))();
  IntColumn get evSpd => integer().withDefault(const Constant(0))();
  IntColumn get evSpe => integer().withDefault(const Constant(0))();
  IntColumn get nature => integer()();
  TextColumn get abilityId => text()();
  TextColumn get movesJson => text()();             // ["ember","scratch"]
  TextColumn get heldItemId => text().nullable()();
  BoolColumn get shiny => boolean().withDefault(const Constant(false))();
  IntColumn get friendship => integer().withDefault(const Constant(70))();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  TextColumn get slotKind => text().withDefault(const Constant('pc'))();  // team|pc|daycare
  IntColumn get slotIndex => integer().nullable()();
  IntColumn get currentHp => integer().nullable()();
  IntColumn get status => integer().withDefault(const Constant(0))();
  DateTimeColumn get capturedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))(); // soft delete para sync
  @override Set<Column> get primaryKey => {uid};
}

class PokedexTable extends Table {
  IntColumn get speciesId => integer()();
  BoolColumn get seen => boolean().withDefault(const Constant(false))();
  BoolColumn get caught => boolean().withDefault(const Constant(false))();
  BoolColumn get shinySeen => boolean().withDefault(const Constant(false))();
  BoolColumn get shinyCaught => boolean().withDefault(const Constant(false))();
  DateTimeColumn get firstSeenAt => dateTime().nullable()();
  @override Set<Column> get primaryKey => {speciesId};
}

class InventoryTable extends Table {
  TextColumn get itemId => text()();
  IntColumn get quantity => integer()();
  @override Set<Column> get primaryKey => {itemId};
}

class CardsOwnedTable extends Table {
  TextColumn get cardId => text()();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  @override Set<Column> get primaryKey => {cardId};
}

class DecksTable extends Table {
  TextColumn get id => text()();
  TextColumn get creatureUid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get cardIdsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  @override Set<Column> get primaryKey => {id};
}

class MazeRunsTable extends Table {
  TextColumn get id => text()();
  IntColumn get seed => integer()();
  IntColumn get currentDepth => integer().withDefault(const Constant(0))();
  TextColumn get currentNodeId => text()();
  TextColumn get visitedJson => text().withDefault(const Constant('[]'))();
  TextColumn get secretsJson => text().withDefault(const Constant('[]'))();
  TextColumn get resourcesJson => text().withDefault(const Constant('{}'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override Set<Column> get primaryKey => {id};
}

class SyncQueueTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entity => text()();       // 'creature' | 'deck' | 'inventory' ...
  TextColumn get entityId => text()();
  TextColumn get op => text()();           // upsert | delete
  TextColumn get payloadJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
}

class SettingsTable extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  @override Set<Column> get primaryKey => {key};
}

class QuestsTable extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()();         // daily | weekly | achievement
  IntColumn get progress => integer().withDefault(const Constant(0))();
  IntColumn get target => integer()();
  BoolColumn get claimed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  @override Set<Column> get primaryKey => {id};
}
```

Tablas de catálogo adicionales (`MovesTable`, `ItemsTable`, `CardActionsTable`, `EvolutionLinksTable`, `TypeChartTable`) se **pueblan desde assets precompilados** (JSON generado por scripts `tool/`), no desde la red en tiempo de juego.

### 9.2 Base de datos y migraciones

```dart
// lib/data/db/app_database.dart
@DriftDatabase(tables: [
  PlayerProfileTable, SpeciesTable, CreatureOwnedTable, PokedexTable, InventoryTable,
  CardsOwnedTable, DecksTable, MazeRunsTable, SyncQueueTable, SettingsTable, QuestsTable,
  // catálogos...
], daos: [CreatureDao, InventoryDao, DeckDao, PokedexDao, RunDao, ProfileDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());
  @override int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement('CREATE INDEX idx_creature_slot ON creature_owned_table(slot_kind, slot_index)');
          await customStatement('CREATE INDEX idx_creature_species ON creature_owned_table(species_id)');
        },
        onUpgrade: (m, from, to) async {
          // if (from < 2) { await m.addColumn(creatureOwnedTable, creatureOwnedTable.favorite); }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _open() => LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      return NativeDatabase.createInBackground(File(p.join(dir.path, 'game.sqlite')));
    });
```

Reglas de migración: cada cambio de esquema = incremento de `schemaVersion` + paso en `onUpgrade` + test de migración con `drift_dev schema` (archivos `drift_schemas/`).

### 9.3 DAO de ejemplo (CRUD de criaturas)

```dart
@DriftAccessor(tables: [CreatureOwnedTable, PokedexTable])
class CreatureDao extends DatabaseAccessor<AppDatabase> with _$CreatureDaoMixin {
  CreatureDao(super.db);

  // CREATE
  Future<void> insertCaptured(CreatureOwnedTableCompanion row) => transaction(() async {
        await into(creatureOwnedTable).insert(row);
        await _markCaught(row.speciesId.value, shiny: row.shiny.value);
      });

  // READ
  Stream<List<CreatureOwnedTableData>> watchTeam() => (select(creatureOwnedTable)
        ..where((c) => c.slotKind.equals('team') & c.deleted.equals(false))
        ..orderBy([(c) => OrderingTerm.asc(c.slotIndex)]))
      .watch();

  Stream<List<CreatureOwnedTableData>> watchPc({String? query, int? typeId}) {
    final q = select(creatureOwnedTable)
      ..where((c) => c.slotKind.equals('pc') & c.deleted.equals(false));
    return q.watch();
  }

  Future<CreatureOwnedTableData?> byUid(String uid) =>
      (select(creatureOwnedTable)..where((c) => c.uid.equals(uid))).getSingleOrNull();

  // UPDATE
  Future<void> updateRow(String uid, CreatureOwnedTableCompanion patch) =>
      (update(creatureOwnedTable)..where((c) => c.uid.equals(uid)))
          .write(patch.copyWith(updatedAt: Value(DateTime.now())));

  Future<void> swapTeamSlots(String uidA, String uidB) => transaction(() async {
        final a = await byUid(uidA); final b = await byUid(uidB);
        if (a == null || b == null) return;
        await updateRow(uidA, CreatureOwnedTableCompanion(slotIndex: Value(b.slotIndex)));
        await updateRow(uidB, CreatureOwnedTableCompanion(slotIndex: Value(a.slotIndex)));
      });

  // DELETE (soft, para poder sincronizar y deshacer)
  Future<void> softDelete(String uid) => updateRow(uid, const CreatureOwnedTableCompanion(deleted: Value(true)));
  Future<void> restore(String uid) => updateRow(uid, const CreatureOwnedTableCompanion(deleted: Value(false)));

  Future<void> _markCaught(int speciesId, {required bool shiny}) =>
      into(pokedexTable).insertOnConflictUpdate(PokedexTableCompanion(
        speciesId: Value(speciesId), seen: const Value(true), caught: const Value(true),
        shinyCaught: Value(shiny), shinySeen: Value(shiny), firstSeenAt: Value(DateTime.now()),
      ));
}
```

### 9.4 Repositorio (interfaz + implementación)

```dart
// domain/repositories/creature_repository.dart
abstract interface class CreatureRepository {
  Stream<List<CreatureInstance>> watchTeam();
  Stream<List<CreatureInstance>> watchPc({PcFilter? filter});
  Future<CreatureInstance?> get(String uid);
  Future<Result<CreatureInstance>> addCaptured(CreatureInstance c);
  Future<Result<void>> setMoves(String uid, List<String> moveIds);
  Future<Result<void>> moveToTeam(String uid, int index);
  Future<Result<void>> moveToPc(String uid);
  Future<Result<void>> release(String uid);                 // soft delete + sync
  Future<Result<void>> restore(String uid);                 // undo release
  Future<Result<CreatureInstance>> evolve(String uid, int toSpeciesId);
}
```

Reglas de negocio dentro del repositorio/caso de uso (no en la UI):

- El equipo nunca supera 6 ni baja de 1 criatura apta para combate.
- No se puede liberar la última criatura del equipo.
- Liberar → `softDelete`; la UI ofrece «Deshacer» 8 s; pasado el plazo se encola `delete` para sync.
- Cada mutación se registra en `sync_queue`.

---

## 10. APIs externas

### 10.1 Resumen y comparativa

| API | Base | Datos | Imagen | Idioma | Notas |
|---|---|---|---|---|---|
| **PokéAPI** | `https://pokeapi.co/api/v2` | Especies, stats, movimientos, tipos, evoluciones, sprites | Sprites PNG/GIF retro y artwork oficial (URLs) | Nombres multi-idioma (`names[]`) | Gratis, sin clave; pide cachear; sin SLA |
| **TCGdex** | `https://api.tcgdex.net/v2/es` | Cartas, sets, series, ataques, habilidades, HP, tipos | `image` base + `/{quality}.{ext}`; WebP/PNG/JPG; `low`/`high` | **Español** completo | REST y GraphQL; SDKs; incluye TCG Pocket |
| **apitcg / TCGGraph** | `https://www.apitcg.com` / `https://tcggraph.com` | Multijuego; ediciones japonesas vinculadas | CDN global de alta resolución | EN/JP (según set) | Agregador, útil como **fallback** |
| **pokemontcg.io** | `https://api.pokemontcg.io/v2` | Cartas con precios (TCGplayer/Cardmarket) | `images.small` / `images.large` | Inglés | Clave gratuita (`X-Api-Key`) recomendada |

**Decisión:** TCGdex = fuente principal de cartas (español, HD). PokéAPI = fuente de datos de combate y sprites. apitcg/TCGGraph y pokemontcg.io = fallbacks.

### 10.2 PokéAPI — endpoints y mapeo

| Necesidad | Endpoint | Campos clave |
|---|---|---|
| Lista de especies | `GET /pokemon-species?limit=2000` | `results[].name,url` |
| Especie | `GET /pokemon-species/{id}` | `capture_rate`, `is_legendary`, `is_mythical`, `growth_rate`, `evolution_chain`, `generation`, `names[]`, `base_happiness` |
| Pokémon (stats, sprites) | `GET /pokemon/{id}` | `stats[]`, `types[]`, `abilities[]`, `moves[]`, `sprites`, `base_experience`, `weight` |
| Movimiento | `GET /move/{id}` | `power`, `accuracy`, `pp`, `priority`, `damage_class`, `type`, `meta`, `effect_entries` |
| Tipo | `GET /type/{id}` | `damage_relations` (double/half/no damage to/from) |
| Cadena de evolución | `GET /evolution-chain/{id}` | `chain.evolves_to[].evolution_details[]` |
| Habilidad | `GET /ability/{id}` | `effect_entries`, `names` |
| Objeto | `GET /item/{id}` | `cost`, `category`, `sprites`, `effect_entries` |

Sprites (rutas habituales en el JSON de `/pokemon/{id}`):

```
sprites.front_default                                              // PNG 96x96
sprites.front_shiny                                                // shiny
sprites.other['official-artwork'].front_default                    // arte grande
sprites.versions['generation-v']['black-white'].animated.front_default   // GIF animado retro
sprites.versions['generation-v']['black-white'].animated.back_default    // espalda (para el jugador)
```

Regla: **no llamar a PokéAPI durante partidas.** Un script `tool/seed_catalog.dart` descarga especies, movimientos, tipos y evoluciones, y genera:

```
assets/data/species.json        // ~1000 entradas, lo mínimo necesario
assets/data/moves.json
assets/data/type_chart.json
assets/data/evolutions.json
assets/data/items.json          // catálogo propio (precios y efectos del juego)
```

Los sprites se descargan **bajo demanda** y se cachean (10.7); el sprite animado se precarga solo para el equipo y la criatura del encuentro.

Cliente de referencia:

```dart
// lib/data/api/pokeapi/pokeapi_client.dart
class PokeApiClient {
  PokeApiClient(this._dio);
  final Dio _dio;
  static const base = 'https://pokeapi.co/api/v2';

  Future<Map<String, dynamic>> pokemon(int id) async =>
      (await _dio.get('$base/pokemon/$id')).data as Map<String, dynamic>;

  Future<Map<String, dynamic>> species(int id) async =>
      (await _dio.get('$base/pokemon-species/$id')).data as Map<String, dynamic>;

  Future<Map<String, dynamic>> move(String idOrName) async =>
      (await _dio.get('$base/move/$idOrName')).data as Map<String, dynamic>;

  Future<Map<String, dynamic>> type(int id) async =>
      (await _dio.get('$base/type/$id')).data as Map<String, dynamic>;

  Future<Map<String, dynamic>> evolutionChain(int id) async =>
      (await _dio.get('$base/evolution-chain/$id')).data as Map<String, dynamic>;
}
```

Mapper (JSON → entidad), con nombre localizado:

```dart
CreatureSpecies mapSpecies(Map<String, dynamic> p, Map<String, dynamic> s, {String lang = 'es'}) {
  String localName() {
    final names = (s['names'] as List).cast<Map<String, dynamic>>();
    final hit = names.firstWhere((n) => n['language']['name'] == lang, orElse: () => names.first);
    return hit['name'] as String;
  }
  int stat(String n) => (p['stats'] as List).firstWhere((e) => e['stat']['name'] == n)['base_stat'] as int;

  final anim = p['sprites']?['versions']?['generation-v']?['black-white']?['animated']?['front_default'];
  return CreatureSpecies(
    id: p['id'] as int,
    name: localName(),
    types: (p['types'] as List).map((t) => PokeType.values.byName(t['type']['name'] as String)).toList(),
    baseStats: Stats(hp: stat('hp'), atk: stat('attack'), def: stat('defense'),
        spa: stat('special-attack'), spd: stat('special-defense'), spe: stat('speed')),
    abilityIds: (p['abilities'] as List).where((a) => a['is_hidden'] == false)
        .map((a) => a['ability']['name'] as String).toList(),
    hiddenAbilityId: (p['abilities'] as List).where((a) => a['is_hidden'] == true)
        .map((a) => a['ability']['name'] as String).firstOrNull,
    evolutionChainId: int.parse((s['evolution_chain']['url'] as String).split('/').reversed.skip(1).first),
    rarity: rarityFromSpecies(s),
    captureRate: s['capture_rate'] as int,
    generation: generationFromName(s['generation']['name'] as String),
    region: regionForGeneration(generationFromName(s['generation']['name'] as String)),
    spriteUrl: p['sprites']['front_default'] as String,
    spriteAnimatedUrl: anim as String?,
    isLegendary: s['is_legendary'] as bool,
    isMythical: s['is_mythical'] as bool,
    baseFriendship: (s['base_happiness'] as int?) ?? 70,
  );
}

Rarity rarityFromSpecies(Map<String, dynamic> s) {
  if (s['is_legendary'] == true || s['is_mythical'] == true) return Rarity.legendary;
  final rate = s['capture_rate'] as int;
  if (rate <= 45) return Rarity.epic;
  if (rate <= 100) return Rarity.rare;
  if (rate <= 190) return Rarity.uncommon;
  return Rarity.common;
}
```

### 10.3 TCGdex — endpoints y uso

Base en español: `https://api.tcgdex.net/v2/es`

| Necesidad | Endpoint | Notas |
|---|---|---|
| Listado de cartas (resumen) | `GET /cards` | Soporta filtros y paginación por query (por ejemplo `?name=pikachu`) |
| Detalle de carta | `GET /cards/{id}` | `id` con formato `{setId}-{localId}` (ej. `swsh3-136`) |
| Sets | `GET /sets` / `GET /sets/{id}` | Incluye lista de cartas del set |
| Series | `GET /series` | Agrupa sets |
| Tipos, rarezas, etc. | `GET /types`, `GET /rarities` | Para filtros |

**Imagen:** el JSON de carta trae `image` como URL **base sin extensión**. Se completa con calidad y formato:

```
{card.image}/high.webp      // alta resolución, optimizada (recomendada)
{card.image}/low.webp       // miniatura para listas
{card.image}/high.png       // máxima calidad, más pesada
```

> En el GDD de partida aparecía `{lang}/{set}/{localId}/{quality}.{ext}`. La ruta real incluye también la serie (`{lang}/{serie}/{set}/{localId}`). Por eso **no construyas la URL a mano**: usa siempre el campo `image` del JSON y añade `/{quality}.{ext}`.

Campos útiles de una carta Pokémon: `name`, `hp`, `types[]`, `stage`, `evolveFrom`, `attacks[] {name, cost[], damage, effect}`, `abilities[]`, `weaknesses[]`, `resistances[]`, `retreat`, `rarity`, `illustrator`, `set`, `localId`.

Cliente con el SDK oficial o REST puro (REST puro para minimizar dependencias):

```dart
// lib/data/api/tcgdex/tcgdex_client.dart
class TcgdexClient {
  TcgdexClient(this._dio, {this.lang = 'es'});
  final Dio _dio;
  final String lang;
  String get _base => 'https://api.tcgdex.net/v2/$lang';

  Future<List<TcgCardBrief>> searchByName(String name, {int page = 1, int perPage = 30}) async {
    final res = await _dio.get('$_base/cards', queryParameters: {
      'name': name,
      'pagination:page': page,
      'pagination:itemsPerPage': perPage,
    });
    return (res.data as List).map((e) => TcgCardBrief.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<TcgCard> card(String id) async =>
      TcgCard.fromJson((await _dio.get('$_base/cards/$id')).data as Map<String, dynamic>);

  String imageUrl(String base, {ImageQuality q = ImageQuality.high, ImageFormat f = ImageFormat.webp}) =>
      '$base/${q.name}.${f.name}';
}
enum ImageQuality { low, high }
enum ImageFormat { webp, png, jpg }
```

> Verifica en la documentación vigente de TCGdex los nombres exactos de los parámetros de filtro y paginación antes de cerrar el cliente; si cambian, solo se toca esta clase.

**Cómo se usa TCGdex en el juego (sin copiar las reglas del TCG real):**

| Uso | Detalle |
|---|---|
| Arte de las cartas de ataque | Cada `CardAction` de tipo ataque puede enlazar `tcgCardId` y mostrar el arte HD |
| Álbum de cartas | Muestra cartas coleccionadas con arte; las no obtenidas, silueta |
| Textos en español | Nombres de ataques y efectos como flavor text |
| Cartas de entrenador/energía | Arte para cartas de objeto y de energía |

Las **reglas de combate son propias** (energía, mano, turnos); TCGdex aporta arte y texto, no reglas.

### 10.4 apitcg / TCGGraph (fallback)

- Solo se consulta si TCGdex no devuelve imagen o carta (por ejemplo ediciones japonesas).
- Interfaz común para poder intercambiar fuentes:

```dart
abstract interface class CardSource {
  Future<List<CardInfo>> search(String query);
  Future<CardInfo?> byId(String id);
  String? imageOf(CardInfo c, {bool large = true});
}

class CardRepositoryImpl {
  CardRepositoryImpl(this.primary, this.fallbacks);
  final CardSource primary;
  final List<CardSource> fallbacks;

  Future<CardInfo?> find(String id) async {
    final r = await _safe(() => primary.byId(id));
    if (r != null) return r;
    for (final f in fallbacks) {
      final x = await _safe(() => f.byId(id));
      if (x != null) return x;
    }
    return null;
  }
  Future<T?> _safe<T>(Future<T?> Function() fn) async { try { return await fn(); } catch (_) { return null; } }
}
```

### 10.5 pokemontcg.io (fallback con precios)

- Cabecera `X-Api-Key: <tu_clave>` (guardar en `--dart-define`, nunca en el repositorio).
- `images.small` para listas, `images.large` para detalle.
- Útil si más adelante se muestra «valor de colección» (precios TCGplayer/Cardmarket).

### 10.6 Cliente HTTP común (Dio)

```dart
Dio buildDio(Env env) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 12),
    headers: {'Accept': 'application/json'},
  ));
  dio.interceptors.addAll([
    RetryInterceptor(dio, retries: 3, delays: const [
      Duration(milliseconds: 500), Duration(seconds: 1), Duration(seconds: 3),
    ]),
    if (env.isDev) LogInterceptor(requestBody: false, responseBody: false),
  ]);
  return dio;
}
```

Política de errores: timeouts y 5xx → reintento con backoff; 429 → respetar `Retry-After`; 404 → `Failure.notFound`; sin red → servir desde cache o mostrar `EmptyState` con «Reintentar».

### 10.7 Caché de imágenes (clave para la experiencia)

Dos tamaños, dos políticas:

| Recurso | Peso aprox. | Política |
|---|---|---|
| Sprite pixel (PNG 96×96) | ~2–5 KB | Cache largo (90 días), precarga de especies vistas |
| Sprite animado (GIF) | ~20–80 KB | Solo equipo y encuentro actual |
| Carta `low.webp` | ~15–40 KB | Listas del álbum, 30 días |
| Carta `high.webp` | ~80–250 KB | Solo al abrir detalle, 30 días |

```dart
// lib/core/cache/app_cache_manager.dart
class AppCacheManager {
  static final cards = CacheManager(Config(
    'cardsCache',
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 600,
  ));
  static final sprites = CacheManager(Config(
    'spritesCache',
    stalePeriod: const Duration(days: 90),
    maxNrOfCacheObjects: 2000,
  ));
}

// lib/core/cache/game_image.dart
class GameImage extends StatelessWidget {
  const GameImage({super.key, required this.url, this.cache = ImageKind.sprite, this.fit = BoxFit.contain, this.pixelArt = false});
  final String url;
  final ImageKind cache;
  final BoxFit fit;
  final bool pixelArt;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      cacheManager: cache == ImageKind.card ? AppCacheManager.cards : AppCacheManager.sprites,
      fit: fit,
      filterQuality: pixelArt ? FilterQuality.none : FilterQuality.medium, // pixel art nítido
      fadeInDuration: const Duration(milliseconds: 120),
      placeholder: (_, __) => const _ShimmerBox(),
      errorWidget: (_, __, ___) => const Icon(Icons.broken_image_outlined, color: AppColors.textDisabled),
      memCacheWidth: cache == ImageKind.card ? 600 : null,
    );
  }
}
enum ImageKind { sprite, card }
```

Precarga (`precacheImage`) durante el slot: mientras giran los carretes se precargan los sprites de las criaturas candidatas y el del resultado, de modo que al aparecer el enemigo **no hay parpadeo**.

Limpieza: `AppCacheManager.cards.emptyCache()` desde Ajustes («Liberar espacio») y rutina semanal en segundo plano.

### 10.8 Atribución y cumplimiento

- Pantalla «Créditos»: PokéAPI, TCGdex, (apitcg/TCGGraph, pokemontcg.io si se usan).
- No redistribuir imágenes en el repositorio ni en el paquete de la app; se cargan desde las URLs oficiales de cada servicio.
- Si se publica con criaturas propias (`OriginalCatalog`), esta sección queda reducida a assets propios.

---

## 11. Interfaces (pantallas): especificación

Plantilla de cada interfaz: **Objetivo · Wireframe · Estado y datos · Widgets · Flujos · CRUD · Aceptación · Tareas**.

### 11.0 ★ Splash, onboarding y tutorial

**Objetivo:** que el jugador capture su primera criatura en menos de 3 minutos.

**Splash (`/splash`):** logo, barra de progreso real (migración DB, carga de `assets/data/*.json`, precarga de 12 sprites). Máximo 3 s; si algo falla, reintentar sin bloquear.

**Onboarding (`/onboarding`) en 5 pasos:**

1. Elegir inicial entre 3 criaturas (sin cuenta; perfil «invitado»).
2. Primera casilla guiada: la tragaperras gira y **siempre** sale match x2 favorable (resultado forzado por `TutorialRng`).
3. Combate tutorial de 3 turnos con mano fija (el juego resalta qué carta tocar).
4. Captura guiada con una Poké Ball regalada (probabilidad forzada ≥ 90 %).
5. Resumen y oferta de crear cuenta («guardar progreso en la nube»), saltable.

```
┌─────────────────────────┐
│   Elige tu compañero    │
│  ┌────┐ ┌────┐ ┌────┐   │
│  │ 🔥 │ │ 💧 │ │ 🌿 │   │
│  └────┘ └────┘ └────┘   │
│  Fuego  Agua  Planta     │
│                         │
│    [   Continuar   ]    │
└─────────────────────────┘
```

**Estado:** `OnboardingController` (`step`, `starterSpeciesId`, `tutorialFlags`). Se guarda `onboarding_done` en `settings`.

**Aceptación:** el tutorial se puede omitir tras completarlo una vez; no se repite al reinstalar si hay cuenta.

**Tareas:** `T-ONB-01` splash y precarga · `T-ONB-02` selector de inicial · `T-ONB-03` `TutorialRng` y overlays · `T-ONB-04` pantalla final.

---

### 11.1 Home Hub

**Objetivo:** acceso rápido a todo con carga cognitiva mínima.

```
┌──────────────────────────────────────┐
│ (avatar) Nombre  Nv 12     🪙1250 💎3 🎟2 │
├──────────────────────────────────────┤
│ ┌──────────────────────────────────┐ │
│ │  Continuar laberinto · Nivel 42  │ │  ← tarjeta grande (acción principal)
│ │  Bosque profundo     [ Jugar ▶ ] │ │
│ └──────────────────────────────────┘ │
│ ┌─────────┐ ┌─────────┐ ┌─────────┐ │
│ │ Equipo  │ │ Pokédex │ │ Mazos   │ │
│ │ 6/6     │ │ 84/151  │ │ 3       │ │
│ └─────────┘ └─────────┘ └─────────┘ │
│ ┌─────────┐ ┌─────────┐ ┌─────────┐ │
│ │Evolución│ │ Arena   │ │Misiones │ │
│ │ ● 2     │ │ 1120 ELO│ │ 2/3     │ │
│ └─────────┘ └─────────┘ └─────────┘ │
├──────────────────────────────────────┤
│ Inicio Colección  ( ⚔ )  Tienda Perfil │
└──────────────────────────────────────┘
```

**Estado:** `homeSummaryProvider` agrega streams: perfil, equipo, progreso de Pokédex, run activa, misiones pendientes, huevos listos, guardería lista. Cada card muestra **un dato vivo** (contador o badge).

**Widgets:** `ResourceBar`, `ContinueRunCard`, `HomeCard` (icono, título, métrica, badge), grid adaptativo (`SliverGrid` con `maxCrossAxisExtent: 180`).

**Flujos:** tocar card → push a ruta; mantener pulsado en «Equipo» → vista rápida de HP de los 6.

**Aceptación:** abre en < 1 s con datos locales; los badges se actualizan en tiempo real (streams Drift); funciona sin conexión.

**Tareas:** `T-HOME-01` layout · `T-HOME-02` provider agregador · `T-HOME-03` badges · `T-HOME-04` vista rápida del equipo.

---

### 11.2 Pokédex

**Objetivo:** mostrar progreso de colección y servir de enciclopedia.

```
┌──────────────────────────────────────┐
│ Pokédex   84/151 capturados  (55%)   │
│ [🔎 Buscar...]   [Filtros ▾]         │
├──────────────────────────────────────┤
│ #001 ● Bulbasaur   🌿☠   ✔ capturado │
│ #002 ● Ivysaur     🌿☠   ✔           │
│ #003 ○ ???         ?     visto       │
│ #004 ▫ ---                 no visto  │
└──────────────────────────────────────┘
```

**Datos:** `pokedex_table` + `species_table`. Estados: no visto (silueta oculta, «???»), visto (silueta + tipos), capturado (todo), shiny capturado (estrella).

**Filtros:** tipo (multi), región, generación, estado (visto/capturado/shiny), orden (id, nombre, rareza). Búsqueda con *debounce* de 250 ms.

**Detalle (`/pokedex/:speciesId`):** sprite animado, tipos, stats base (barras), habilidades (y oculta), cadena de evolución con condiciones, ubicación (biomas donde aparece), tasa de captura (en palabras: «Difícil»), cartas TCG relacionadas.

**Widgets:** `PokedexList` (`SliverList` con `itemExtent` fijo), `PokedexFilterSheet`, `SpeciesDetail`, `EvolutionTree` (nodos conectados con `CustomPainter`), `BaseStatBars`.

**Aceptación:** lista de 1000+ entradas con scroll a 60 fps (itemExtent + `RepaintBoundary`); búsqueda < 100 ms sobre datos locales; las especies no vistas no revelan nombre ni sprite real.

**Tareas:** `T-DEX-01` consulta paginada · `T-DEX-02` filtros · `T-DEX-03` detalle · `T-DEX-04` árbol de evolución · `T-DEX-05` registro automático de visto/capturado.

---

### 11.3 Equipo, PC y detalle de criatura

**Objetivo:** gestionar el equipo (6), el almacenamiento y editar cada criatura.

```
┌──────────────────────────────────────┐
│ Equipo (6/6)                 [PC ▸]  │
│ ┌────┐ ┌────┐ ┌────┐                 │
│ │ 1  │ │ 2  │ │ 3  │  arrastra para  │
│ └────┘ └────┘ └────┘  reordenar      │
│ ┌────┐ ┌────┐ ┌────┐                 │
│ │ 4  │ │ 5  │ │ 6  │                 │
│ └────┘ └────┘ └────┘                 │
│ [ Comparar stats ]                   │
└──────────────────────────────────────┘
```

**Detalle de criatura (`/creature/:uid`)** con pestañas:

| Pestaña | Contenido | Acciones |
|---|---|---|
| Resumen | Sprite, nivel, EXP, tipos, naturaleza, habilidad, objeto equipado | Apodo, favorito, equipar/quitar objeto |
| Stats | Stats finales, radar chart vs base, IVs/EVs (barras) | Usar vitaminas (suman EV) |
| Ataques | Hasta 4 movimientos aprendidos + lista de movimientos disponibles | **Cambiar / olvidar / aprender** |
| Mazo | Resumen del mazo asociado | Ir al constructor de mazo |
| Evolución | Condiciones y estado | Evolucionar |

**CRUD / acciones:**

| Operación | Reglas |
|---|---|
| Reordenar | Drag & drop con `ReorderableGridView`/`Draggable`; intercambio atómico en transacción |
| Mover a PC / al equipo | No dejar equipo vacío; máximo 6 |
| Liberar | Confirmación con texto («¿Liberar a Pikachu?»), `ConfirmSheet`, deshacer 8 s, **recompensa** pequeña de monedas |
| Cambiar ataque | `MovePickerSheet`: lista con tipo, categoría, poder, precisión, PP; pide confirmación si olvida uno |
| Apodo | 1–12 caracteres, filtro de palabras ofensivas local |

**PC (`/team/pc`):** grid paginado, filtros (tipo, nivel, shiny, favorito), orden, **selección múltiple** para reciclar o liberar en lote (con resumen de lo que se va a perder).

**Aceptación:** reordenar no pierde datos aunque se cierre la app a mitad (transacción); radar chart responde en < 16 ms por frame; deshacer restaura posición original.

**Tareas:** `T-TEAM-01` grid equipo · `T-TEAM-02` drag & drop · `T-TEAM-03` detalle con tabs · `T-TEAM-04` selector de movimientos · `T-TEAM-05` PC con filtros · `T-TEAM-06` liberar con deshacer · `T-TEAM-07` radar chart.

---

### 11.4 Constructor de mazo (Deck Builder)

**Objetivo:** armar el mazo de **15–20 cartas de acción** de cada criatura.

```
┌──────────────────────────────────────┐
│ Mazo de Charizard      17/20  ⚡ ~1.8 │
├───────────────┬──────────────────────┤
│ Disponibles   │ Mazo actual          │
│ [filtros]     │ Lanzallamas ×3       │
│ Lanzallamas   │ Garra Dragón ×2      │
│ Poción        │ Poción ×2            │
│ Esquivar      │ ...                  │
├───────────────┴──────────────────────┤
│ [Guardar]  [Plantillas ▾]  [Auto-armar]│
└──────────────────────────────────────┘
```

**Reglas de validación (en `DeckValidator`, dominio puro):**

| Regla | Valor |
|---|---|
| Tamaño | 15 a 20 cartas |
| Copias máximas por carta | 4 (comunes), 2 (raras), 1 (épicas/legendarias) |
| Cartas de ataque | Solo movimientos que la criatura puede aprender o tiene |
| Mínimo de ataques | 6 |
| Máximo de cartas de objeto | 4 |
| Coste medio de energía | Mostrado como indicador (curva de energía); aviso si > 2.4 |

**★ Auto-armar:** sugerencia con heurística (cubrir tipos, curva de energía baja, 2 de curación). Es **ayuda**, no obligatoria.

**★ Plantillas:** guardar y cargar mazos (hasta 5 por criatura) y duplicar.

**Widgets:** `CardPoolList`, `DeckList`, `EnergyCurveChart` (barras 0–4), `DeckValidationBanner`.

**Aceptación:** guardar impide mazos inválidos mostrando **qué regla falla**; el cambio persiste al instante; arrastrar o tocar «+» añade carta con animación breve.

**Tareas:** `T-DECK-01` validador · `T-DECK-02` UI de dos paneles · `T-DECK-03` curva de energía · `T-DECK-04` plantillas · `T-DECK-05` auto-armar.

---

### 11.4b ★ Álbum de cartas

**Objetivo:** ver y presumir la colección de cartas con arte TCG.

- Grid de cartas (`low.webp`), las no obtenidas en silueta.
- Filtros: tipo, rareza, set, obtenidas/faltantes, favoritas.
- Detalle con zoom (`InteractiveViewer`), **efecto holográfico** (shader/gradiente que sigue el giroscopio o el dedo), nivel de carta y botón «Mejorar» (cuesta polvo).
- Progreso por set (barra) y recompensas al completar sets.

**Aceptación:** abrir el detalle muestra primero `low` y reemplaza por `high` sin salto; el efecto holo se desactiva con «Reducir animaciones».

**Tareas:** `T-ALB-01` grid · `T-ALB-02` detalle y zoom · `T-ALB-03` efecto holo · `T-ALB-04` mejora de cartas.

---

### 11.5 Evolución e incubadora

**Objetivo:** evolucionar criaturas y eclosionar huevos.

**Evolución:**

- Lista de criaturas **elegibles** con la condición visible («Nivel 36», «Piedra Fuego», «Amistad 220», «Intercambio»).
- Si falta algo, la card muestra **qué falta** y un atajo («Comprar en la tienda»).
- Animación de evolución: silueta blanca pulsando, partículas, flash, nueva criatura (Rive o Lottie; sección 19).
- Tras evolucionar: opción de **aprender movimientos nuevos**, y revisión de mazo (cartas que ya no aplican se marcan).
- Cancelar: mantener pulsado «B» (como en los juegos originales), si no es evolución forzada.

**Incubadora ★:**

- 3 slots de huevo; cada huevo tiene **pasos** objetivo (por ejemplo 2000) que se llenan al **avanzar nodos del laberinto**.
- Aceleradores (objeto «Incubadora rápida»).
- Al eclosionar: pequeña tragaperras de rareza (usa el motor de la sección 12) o reveal directo.

**Aceptación:** la condición de evolución se evalúa con `EvolutionChecker` (sin lógica en la UI); la evolución es una transacción (si falla, nada cambia).

**Tareas:** `T-EVO-01` lista elegible · `T-EVO-02` animación · `T-EVO-03` revisión de mazo · `T-EVO-04` huevos · `T-EVO-05` eclosión.

---

### 11.6 Tienda

**Objetivo:** gastar monedas/gemas de forma clara y sin presión.

```
┌──────────────────────────────────────┐
│ Tienda            🪙1250  💎3        │
│ [Bolas][Curación][Mejoras][Cartas]...│
├──────────────────────────────────────┤
│ Poké Ball     🪙 100  [-1+] [Comprar]│
│ Super Ball    🪙 300  [-1+] [Comprar]│
│ ★ Oferta del día: Ultra Ball -30%    │
└──────────────────────────────────────┘
```

**Categorías:** Poké Balls · Curación · Vitaminas · X-stats · Equipables · Piedras · Cartas (packs, no aleatorios con dinero real) · Mapas de atajo · Boletos y fichas · Cosméticos (gemas).

**Reglas:**

- Selector de cantidad con máximo según monedas y `maxStack`.
- Confirmación solo para compras > 25 % de tus monedas.
- **Ofertas rotativas** diarias (3 objetos, semilla por fecha).
- Venta de objetos en la misma pantalla (pestaña «Vender», 50 % del precio).
- **Sin** venta directa de tiradas ni cajas aleatorias con dinero real.

**Aceptación:** la compra es transaccional (monedas y objeto en una sola transacción); no se puede comprar sin fondos; el precio dinámico por profundidad se muestra con el cálculo («+10 % por profundidad»).

**Tareas:** `T-SHOP-01` catálogo · `T-SHOP-02` compra/venta transaccional · `T-SHOP-03` ofertas diarias · `T-SHOP-04` selector de cantidad.

---

### 11.7 Inventario / Mochila

- Pestañas: Objetos · Bolas · Cartas · Materiales.
- **Uso rápido:** tocar un objeto abre hoja con acción (usar en criatura, equipar, descartar).
- Usar vitaminas: elegir criatura y ver el cambio de stat previsto antes de confirmar.
- Descartar: confirmación si la cantidad ≥ 5.
- Orden: reciente, nombre, cantidad; búsqueda.
- Banner si el objeto solo se puede usar en el laberinto o en combate.

**Aceptación:** cantidad nunca negativa (constraint + validación); el uso de objeto en combate descuenta el inventario y se refleja en el HUD al instante.

**Tareas:** `T-INV-01` lista y tabs · `T-INV-02` usar/equipar · `T-INV-03` vista previa de vitaminas.

---

### 11.8 Overworld (laberinto)

Ver sección 13 para el motor. La pantalla incluye:

```
┌──────────────────────────────────────┐
│ Nv 42 · Bosque profundo   🪙 1250 ⚪×15│
│                                      │
│          ·  (secreto ✨)             │
│         /                            │
│      (boss)                          │
│      /    \                          │
│   (⚔)      (🎁)                      │
│      \    /                          │
│       (⚔)                            │
│        ●  ← jugador                  │
│                                      │
│ [Equipo ❤ ❤ ❤ ❤ ❤ ❤] [Mochila] [⏸] │
└──────────────────────────────────────┘
```

HUD: profundidad, bioma, monedas, bolas, **barra de vida del equipo** (6 corazones o barra única), botón de pausa y de retirada (solo en nodos de descanso).

**Tareas:** ver `T-MAZE-*` en sección 13.

---

### 11.9 Tragaperras / Gachapon

Ver sección 12. Es un **modal** sobre el overworld: baja desde arriba, el mapa se desenfoca.

**Tareas:** ver `T-SLOT-*` en sección 12.

---

### 11.10 Batalla contra B-Bot

Ver sección 14. Pantalla completa, orientación vertical. Incluye: sprites, barras de vida, estados, mano de cartas, energía, registro, botones (cambiar, objeto, huir).

---

### 11.11 Captura

Ver sección 15. Modal sobre la batalla; selector de bola, medidor de probabilidad, minijuego de timing, animación de sacudidas.

---

### 11.11b ★ Resumen de run

**Objetivo:** cierre satisfactorio y razón para «una más».

```
┌──────────────────────────────────────┐
│          Run terminada               │
│ Profundidad máxima: 42  (récord ★)   │
│ Capturas: 3   Combates: 21           │
│ 🪙 +840   ⚪ +6   🎁 2 cofres        │
│ [Nuevas capturas: miniaturas]        │
│ [  Otra vez ▶  ]  [ Inicio ]         │
└──────────────────────────────────────┘
```

- Cuenta animada de recompensas (contador que sube).
- Si la run terminó por derrota: se conserva el 50 % de lo ganado; en descanso/retirada, 100 %.
- Muestra progreso de misiones y de Pokédex en esa run.

**Tareas:** `T-RUN-01` pantalla · `T-RUN-02` cálculo de conservación · `T-RUN-03` animaciones de conteo.

---

### 11.12 PvP online y social

Ver sección 18 para protocolo. Pantallas:

| Pantalla | Contenido |
|---|---|
| Lobby (`/pvp`) | ELO, rango, botón «Buscar partida», amigos en línea, temporada y recompensas |
| Emparejando | Animación, temporizador, cancelar |
| Combate PvP | Igual que batalla, con temporizador de 30 s por turno, emotes rápidos (6 predefinidos) |
| Resultado | Cambio de ELO, recompensas, revancha, añadir amigo |
| ★ Amigos (`/friends`) | Lista, solicitudes, retar, estado en línea, código de amigo |
| ★ Intercambios (`/trades`) | Crear oferta, ver ofertas, confirmación doble, historial |
| ★ Clasificaciones | Profundidad del laberinto, colección, ELO (global y amigos) |

**Aceptación:** reconexión automática en 30 s sin perder el combate; el servidor es autoridad; ninguna acción de PvP depende solo del cliente.

**Tareas:** `T-PVP-*` en sección 18.

---

### 11.13 Reciclador / Fusión

**Objetivo:** dar valor a las criaturas repetidas.

- Seleccionar repetidos (excluye favoritos y las del equipo).
- Vista previa de **salida**: monedas, boletos, piedras o polvo según rareza y nivel.
- Confirmación con lista exacta de lo que se pierde.
- **Fusión ★:** 3 criaturas iguales + monedas → 1 con IVs mejorados (reroll del mejor IV de los tres).

Tabla de rendimiento orientativa:

| Rareza reciclada | Monedas | Polvo | Probabilidad de boleto |
|---|---|---|---|
| Común | 20 | 5 | 2 % |
| Poco común | 50 | 12 | 5 % |
| Rara | 120 | 30 | 12 % |
| Épica | 400 | 90 | 30 % |
| Legendaria | 2000 | 400 | 100 % (1 boleto) |

**Tareas:** `T-REC-01` selección · `T-REC-02` previsualización · `T-REC-03` fusión · `T-REC-04` transacción atómica.

---

### 11.14 Guardería (auto-farm)

- 2 slots (ampliables con gemas).
- Rendimiento por hora: XP = `nivelCriatura × 2`, monedas = `rareza × 3`; **tope de 8 horas** acumulables.
- Notificación local al llenarse (`flutter_local_notifications`).
- Cálculo con **hora del servidor** (o monotónica local con verificación) para evitar trampas cambiando el reloj.

**Tareas:** `T-DAY-01` slots · `T-DAY-02` cálculo offline · `T-DAY-03` notificación local.

---

### 11.15 Gimnasios / Torre del desafío

- Cada 50 niveles el laberinto genera una **sala de gimnasio** con 3 B-Bots y un líder.
- Regla especial (ejemplos): «Solo cartas de Fuego», «Sin objetos», «Clima de lluvia», «Energía máxima 2».
- Recompensa: medalla (bonus pasivo permanente pequeño) + cofre épico garantizado.
- Fallo: se puede reintentar tras un nodo de descanso.

**Tareas:** `T-GYM-01` generador de reglas · `T-GYM-02` IA de líder · `T-GYM-03` medallas.

---

### 11.16 ★ Misiones y logros

- Diarias (3), semanales (3), logros permanentes (con niveles bronce/plata/oro).
- Ejemplos: «Gira la tragaperras 5 veces», «Captura 2 criaturas tipo agua», «Llega a profundidad 30».
- Reclamar manualmente (feedback y dopamina) con `RewardToast` animado.
- Racha diaria: recompensa creciente **sin castigo duro** si se pierde un día (se guarda 1 día de gracia).

**Tareas:** `T-QST-01` generador por semilla de día · `T-QST-02` progreso por eventos · `T-QST-03` UI y reclamo.

### 11.17 ★ Perfil

Avatar, nombre, nivel, medallas, estadísticas de vida (capturas, combates, profundidad máxima, tiempo jugado), vitrina de 3 criaturas favoritas, código de amigo, botón de compartir.

### 11.18 ★ Ajustes

| Grupo | Opciones |
|---|---|
| Sonido | Música, efectos, vibración |
| Gráficos | Reducir animaciones, calidad de partículas |
| Accesibilidad | Captura automática, modo daltónico (formas), tamaño de texto, alto contraste |
| Idioma | Español / Inglés |
| Datos | Liberar caché, descargar sprites para uso offline, exportar datos |
| Cuenta | Vincular, cerrar sesión, **borrar cuenta y datos** |
| Legal | Privacidad, términos, créditos, probabilidades |

### 11.19 ★ Probabilidades (`/odds`)

Tablas de probabilidad de la tragaperras (por contexto y profundidad), de captura por bola y de shiny. Se lee de la **misma configuración** que usa el motor (una sola fuente de verdad), nunca de texto escrito a mano.

---

## 12. Motor de la tragaperras (Slot/Gachapon)

### 12.1 Principios de diseño

1. **El resultado se decide antes de animar.** Una tabla ponderada elige el resultado; la animación lo *representa*. Así el azar es auditable y testeable.
2. **Mismo motor, cuatro contextos** (encuentro, cofre, secreto, tienda), cambiando solo la tabla de símbolos.
3. **Control del jugador:** Hold (fijar un carrete), Nudge (empujón de 1 posición) y re-spin.
4. **Compasión del sistema:** garantías (pity) para evitar rachas frustrantes.

### 12.2 Configuración

```dart
// lib/features/slot/domain/slot_config.dart
class SlotSymbol {
  const SlotSymbol({required this.id, required this.rarity, required this.weight, this.payload});
  final String id;            // 'creature:25' | 'item:masterball' | 'coin' | 'mystery'
  final Rarity rarity;
  final double weight;
  final Object? payload;
}

class SlotConfig {
  const SlotConfig({
    this.reelCount = 3,
    this.symbolsPerReel = 10,
    this.visibleRows = 3,
    required this.outcomeWeights,      // {x2, x3, miss}
    required this.symbols,             // por contexto y bioma
    this.pityShinyAfter = 10,
    this.pityRareAfter = 30,
  });
  final int reelCount, symbolsPerReel, visibleRows;
  final Map<SlotOutcome, double> outcomeWeights;
  final List<SlotSymbol> symbols;
  final int pityShinyAfter, pityRareAfter;
}

enum SlotOutcome { match2, match3, miss }
```

Tabla de resultados por defecto (editable remotamente):

| Resultado | Probabilidad |
|---|---|
| Match x2 | 70 % |
| Match x3 (jackpot) | 8 % |
| Sin match | 22 % (primer re-spin gratis) |

Pesos de rareza **dentro** del match:

| Rareza | Peso base |
|---|---|
| Común | 60 % |
| Poco común | 28 % |
| Rara | 10 % |
| Épica | 1.8 % |
| Legendaria | 0.2 % |

Con la profundidad: `pesoRareza' = pesoRareza × (1 + 0.01 × profundidad)` para rarezas ≥ rara, renormalizado.

### 12.3 Resultado determinado (el motor)

```dart
// lib/features/slot/domain/slot_engine.dart
class SlotSpin {
  const SlotSpin({
    required this.outcome, required this.centerLine, required this.reels,
    required this.winningSymbol, this.shiny = false,
  });
  final SlotOutcome outcome;
  final List<SlotSymbol> centerLine;      // símbolos en la línea activa
  final List<List<SlotSymbol>> reels;     // banda completa por carrete (para animar)
  final SlotSymbol? winningSymbol;
  final bool shiny;
}

class SlotEngine {
  SlotEngine(this.config, this.rng);
  final SlotConfig config;
  final Rng rng;

  SlotSpin spin({required SlotPity pity, int depth = 0, Set<int> heldReels = const {}, SlotSpin? previous}) {
    // 1) Elegir resultado
    var outcome = rng.weighted(config.outcomeWeights);

    // 2) Garantías
    if (pity.sinceShiny >= config.pityShinyAfter && outcome == SlotOutcome.match2) {
      outcome = SlotOutcome.match3;
    }

    // 3) Elegir símbolo ganador por pesos (ajustados a profundidad)
    final weights = {
      for (final s in config.symbols) s: _depthWeight(s, depth),
    };
    final winner = rng.weighted(weights);

    // 4) Construir línea central
    final center = switch (outcome) {
      SlotOutcome.match3 => [winner, winner, winner],
      SlotOutcome.match2 => _twoOfAKind(winner),
      SlotOutcome.miss => _allDifferent(),
    };

    // 5) Respetar carretes retenidos (Hold)
    if (previous != null) {
      for (final i in heldReels) { center[i] = previous.centerLine[i]; }
      // si el Hold fuerza otro resultado, recalcular outcome real
      outcome = _classify(center);
    }

    // 6) Construir bandas para animación (símbolos de relleno al azar)
    final reels = List.generate(config.reelCount, (i) => _buildBand(center[i]));

    return SlotSpin(
      outcome: outcome,
      centerLine: center,
      reels: reels,
      winningSymbol: outcome == SlotOutcome.miss ? null : _majority(center),
      shiny: outcome == SlotOutcome.match3,
    );
  }

  double _depthWeight(SlotSymbol s, int depth) =>
      s.rarity.index >= Rarity.rare.index ? s.weight * (1 + 0.01 * depth) : s.weight;

  List<SlotSymbol> _twoOfAKind(SlotSymbol w) {
    final other = _pickDifferent(w);
    final pos = rng.nextInt(3);          // qué carrete es el "distinto"
    return List.generate(3, (i) => i == pos ? other : w);
  }

  List<SlotSymbol> _allDifferent() {
    final a = rng.pick(config.symbols);
    final b = _pickDifferent(a);
    final c = config.symbols.firstWhere((s) => s != a && s != b, orElse: () => a);
    return [a, b, c];
  }

  SlotSymbol _pickDifferent(SlotSymbol s) =>
      rng.pick(config.symbols.where((x) => x.id != s.id).toList());

  SlotOutcome _classify(List<SlotSymbol> c) {
    final counts = <String, int>{};
    for (final s in c) { counts[s.id] = (counts[s.id] ?? 0) + 1; }
    final top = counts.values.fold(0, max);
    return top >= 3 ? SlotOutcome.match3 : top == 2 ? SlotOutcome.match2 : SlotOutcome.miss;
  }

  SlotSymbol _majority(List<SlotSymbol> c) {
    final counts = <String, int>{};
    for (final s in c) { counts[s.id] = (counts[s.id] ?? 0) + 1; }
    final id = counts.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
    return c.firstWhere((s) => s.id == id);
  }

  List<SlotSymbol> _buildBand(SlotSymbol center) {
    final band = List.generate(config.symbolsPerReel, (_) => rng.pick(config.symbols));
    band[config.symbolsPerReel ~/ 2] = center;   // el símbolo central queda en la posición de parada
    return band;
  }
}

class SlotPity {
  const SlotPity({this.sinceShiny = 0, this.sinceRare = 0});
  final int sinceShiny, sinceRare;
  SlotPity afterSpin(SlotSpin s) => SlotPity(
        sinceShiny: s.shiny ? 0 : sinceShiny + 1,
        sinceRare: (s.winningSymbol?.rarity.index ?? 0) >= Rarity.rare.index ? 0 : sinceRare + 1,
      );
}
```

### 12.4 Variantes por contexto

| Contexto | Símbolos | Match x2 | Match x3 |
|---|---|---|---|
| **Encuentro** | Criaturas del bioma actual (10 por bioma, mezcla de rarezas) | Encuentro normal | Shiny o bonus de captura +15 % |
| **Cofre** | Monedas, Poké Ball, Super Ball, Poción, Vitamina, Ficha | Objeto del símbolo (cantidad ×1) | Objeto ×3 (jackpot) |
| **Secreto** | Silueta misteriosa, cofre épico, Ultra Ball, Master Ball (rara), Piedra evolutiva | Épico garantizado | **Legendario** (si hay silueta ×3) |
| **Tienda ambulante** | Descuento 10/20/30 %, objeto raro, boleto | Oferta del símbolo | Oferta + regalo |

### 12.5 Interacción y control

- **Girar:** botón grande «Girar» o **palanca** (arrastrar hacia abajo; háptica al final).
- **Hold:** antes del primer giro, tocar un carrete lo fija; máximo 1 por giro.
- **Nudge:** si la fila inferior o superior de un carrete completaría un match, aparece el botón «Empujar (1 ficha)».
- **Re-spin:** gratis una vez por casilla; después 1 ficha.
- **Saltar animación:** disponible desde el tercer giro del día (y siempre con «Reducir animaciones»).

Costes orientativos: encuentro, giro inicial gratis; cofre, gratis; secreto, requiere «llave de arbusto» (objeto) o criatura Planta/Bicho en el equipo; re-spin = 1 ficha; nudge = 1 ficha.

### 12.6 Animación (Flame o Flutter puro)

Dos opciones; se recomienda **Flutter puro** para la tragaperras (más simple de mantener) y Flame para el mapa:

```dart
// lib/features/slot/presentation/reel.dart
class Reel extends StatefulWidget {
  const Reel({super.key, required this.band, required this.stopIndex, required this.delay, required this.spinning, required this.onStopped});
  final List<SlotSymbol> band;
  final int stopIndex;
  final Duration delay;
  final bool spinning;
  final VoidCallback onStopped;
  @override State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));
  static const itemH = 88.0;

  @override
  void didUpdateWidget(covariant Reel old) {
    super.didUpdateWidget(old);
    if (widget.spinning && !old.spinning) {
      Future.delayed(widget.delay, () {
        if (!mounted) return;
        _c.forward(from: 0).whenComplete(widget.onStopped);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.band.length;
    final curved = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    return SizedBox(
      height: itemH * 3,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: curved,
          builder: (_, __) {
            // 5 vueltas completas + posición final
            final totalItems = 5 * n + widget.stopIndex;
            final offset = totalItems * itemH * curved.value;
            return Stack(children: [
              for (var k = -1; k <= 3; k++) _item(k, offset, n),
            ]);
          },
        ),
      ),
    );
  }

  Widget _item(int slot, double offset, int n) {
    final base = (offset / itemH);
    final idx = (base.floor() + slot) % n;
    final dy = (slot * itemH) - (offset % itemH);
    return Positioned(top: dy, left: 0, right: 0, height: itemH,
        child: SymbolTile(symbol: widget.band[idx % n]));
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
}
```

Secuencia de la máquina completa:

1. Entrada (300 ms): máquina baja con rebote, fondo se desenfoca.
2. Pulsar giro: sonido de palanca + `HapticFeedback.mediumImpact`.
3. Carrete 1 se detiene a 1.4 s, carrete 2 a 1.9 s, carrete 3 a 2.6 s (**suspense creciente**; si ya hay 2 iguales, el 3º tarda +0.6 s y suena un «latido»).
4. Resultado: luces del marco **verde** (x2) o **doradas con confeti** (x3), sonido acorde.
5. Panel de resultado con el encuentro/premio y botón de continuar.
6. Salida: la máquina se pliega hacia arriba; aparece la escena siguiente.

Tiempo total objetivo: **≤ 3.5 s** (≤ 1 s con «saltar»).

### 12.7 Estado y proveedor

```dart
@riverpod
class SlotController extends _$SlotController {
  @override
  SlotState build(SlotContext ctx) => SlotState.idle(pity: ref.read(pityStoreProvider));

  Future<void> spin() async {
    if (state is! SlotIdle && state is! SlotResult) return;
    final engine = ref.read(slotEngineProvider(ctx));
    final result = engine.spin(pity: state.pity, depth: ref.read(runProvider).currentDepth);
    state = SlotState.spinning(result);
    // precarga de sprites del resultado mientras gira
    unawaited(ref.read(preloaderProvider).precache(result.centerLine));
  }

  void onAllReelsStopped() {
    final s = state as SlotSpinning;
    ref.read(pityStoreProvider.notifier).save(s.pity.afterSpin(s.result));
    state = SlotState.result(s.result);
  }
}
```

### 12.8 Pruebas del motor

- 100 000 giros con `SeededRng`: la frecuencia observada de x2/x3/miss debe estar a ±1 % de la tabla.
- Pity: tras 10 combates sin shiny, el siguiente match x2 se convierte en x3 en el 100 % de los casos.
- Determinismo: misma semilla → misma secuencia de resultados.
- `Hold` nunca produce un resultado inconsistente con `_classify`.
- La tabla `/odds` se genera desde `SlotConfig` (test: ambos coinciden).

### 12.9 Tareas

`T-SLOT-01` modelos y config · `T-SLOT-02` motor y pity · `T-SLOT-03` tablas por contexto y bioma · `T-SLOT-04` widget Reel · `T-SLOT-05` máquina completa (marco, luces, palanca) · `T-SLOT-06` Hold / Nudge / Re-spin · `T-SLOT-07` audio y háptica · `T-SLOT-08` precarga · `T-SLOT-09` tests estadísticos · `T-SLOT-10` pantalla de probabilidades.

---

## 13. Overworld procedural con Flame

### 13.1 Objetivo y sensación

Un mapa de bosque estilo **Super Mario World**: puntos (nodos) que se encienden al avanzar, unidos por caminos de arbustos, con bifurcaciones A/B y atajos secretos. **Nunca termina.** Cada decisión de ruta tiene riesgo y recompensa.

### 13.2 Modelo del mundo

- El mundo se genera por **segmentos de 10 niveles** (`segmentIndex = depth ~/ 10`).
- Cada segmento se genera con `SeededRng(hash(runSeed, segmentIndex))`: **determinista**, no hace falta guardar el mapa, solo la semilla, los nodos visitados y los secretos descubiertos.
- Se generan 2 segmentos por delante del jugador (precarga) y se descarta lo antiguo.

Estructura por capa (nivel):

| Parámetro | Valor |
|---|---|
| Nodos por capa | 1 a 3 (hasta 5 en áreas amplias de profundidad alta) |
| Conexiones por nodo | 1 o 2 hacia la capa siguiente |
| Garantía | Siempre existe al menos un camino válido de la capa N a la N+1 |
| Jefe | Cada 10 niveles (nodo único, sin bifurcación) |
| Gimnasio | Cada 50 niveles (sala especial) |
| Descanso | Mínimo 1 cada 7 capas (asegurado por el generador) |

Distribución por tipo de nodo (excluyendo jefe/gimnasio):

| Tipo | Frecuencia |
|---|---|
| Combate | 50 % |
| Cofre | 15 % |
| Descanso | 10 % |
| Evento | 10 % |
| Tienda ambulante | 8 % |
| Élite (combate difícil con mejor premio) | 7 % |

Atajos secretos: **3–6 %** de los nodos tienen un arbusto sospechoso (dependiendo de la profundidad y de las criaturas Planta/Bicho en el equipo, que aumentan la detección).

Biomas por profundidad: Bosque (1–25), Cueva (26–50), Pantano (51–75), Volcán (76–100), Océano (101–125), Montaña (126–150), Desierto (151–175), luego **ciclo con variantes** (modificadores como «niebla», «tormenta»).

### 13.3 Generador (dominio puro)

```dart
// lib/domain/rules/procedural_map_generator.dart
class ProceduralMapGenerator {
  ProceduralMapGenerator({this.layersPerSegment = 10});
  final int layersPerSegment;

  List<MazeNode> generateSegment({required int runSeed, required int segment}) {
    final rng = SeededRng(Object.hash(runSeed, segment));
    final startDepth = segment * layersPerSegment;
    final nodes = <MazeNode>[];
    var previous = <MazeNode>[];

    for (var layer = 0; layer < layersPerSegment; layer++) {
      final depth = startDepth + layer;
      final isBoss = (depth + 1) % 10 == 0;
      final isGym = (depth + 1) % 50 == 0;
      final width = (isBoss || isGym) ? 1 : 1 + rng.nextInt(3);          // 1..3
      final biome = biomeForDepth(depth);

      final current = <MazeNode>[
        for (var lane = 0; lane < width; lane++)
          MazeNode(
            id: 'n${depth}_$lane',
            depth: depth,
            lane: _laneFor(lane, width),                                   // columnas 0..4 visuales
            type: isGym ? NodeType.gym
                : isBoss ? NodeType.boss
                : _pickType(rng, depth, forceRest: _needsRest(layer, nodes)),
            biome: biome,
            nextIds: const [],
          ),
      ];

      // Conectar capa anterior -> actual, garantizando alcanzabilidad
      if (previous.isNotEmpty) {
        final updated = _connect(previous, current, rng);
        nodes
          ..removeRange(nodes.length - previous.length, nodes.length)
          ..addAll(updated);
      }

      // Atajos secretos
      final withSecrets = [
        for (final n in current)
          (n.type != NodeType.boss && n.type != NodeType.gym && rng.chance(_secretChance(depth)))
              ? n.copyWith(secretTargetId: 'secret_${n.id}')
              : n,
      ];
      nodes.addAll(withSecrets);
      previous = withSecrets;
    }
    return nodes;
  }

  /// Cada nodo previo conecta con 1..2 nodos actuales; cada nodo actual recibe >= 1 entrada.
  List<MazeNode> _connect(List<MazeNode> prev, List<MazeNode> cur, Rng rng) {
    final links = {for (final p in prev) p.id: <String>{}};
    for (final p in prev) {
      final targets = {cur[rng.nextInt(cur.length)].id};
      if (cur.length > 1 && rng.chance(0.45)) targets.add(cur[rng.nextInt(cur.length)].id);
      links[p.id]!.addAll(targets);
    }
    // asegurar entrada para todo nodo actual
    for (final c in cur) {
      final hasInput = links.values.any((s) => s.contains(c.id));
      if (!hasInput) links[prev[rng.nextInt(prev.length)].id]!.add(c.id);
    }
    return [for (final p in prev) p.copyWith(nextIds: links[p.id]!.toList())];
  }

  NodeType _pickType(Rng rng, int depth, {bool forceRest = false}) {
    if (forceRest) return NodeType.rest;
    return rng.weighted({
      NodeType.battle: 50, NodeType.chest: 15, NodeType.rest: 10,
      NodeType.event: 10, NodeType.shop: 8, NodeType.cave: 7,  // cave = élite
    });
  }

  bool _needsRest(int layer, List<MazeNode> nodes) {
    final lastRest = nodes.lastIndexWhere((n) => n.type == NodeType.rest);
    if (lastRest == -1) return layer >= 6;
    return nodes.last.depth - nodes[lastRest].depth >= 7;
  }

  double _secretChance(int depth) => (0.03 + (depth / 1000)).clamp(0.03, 0.06);
  int _laneFor(int i, int width) => switch (width) { 1 => 2, 2 => i == 0 ? 1 : 3, _ => i * 2 };
}
```

### 13.4 Atajos secretos: reglas

1. Se ven como **arbustos con partículas de hojas brillantes** (sutiles).
2. Al tocar: costo de **1 llave de arbusto** (o gratis con ciertas criaturas en el equipo, que así tienen valor estratégico).
3. Efecto: la cámara se desplaza rápido (0.6 s) saltando 3–8 niveles hacia una **casilla secreta**.
4. **Siempre** hay una tragaperras de contexto `secret`: garantiza al menos un premio único (épico/legendario, cofre raro, objeto especial, Master Ball con baja probabilidad).
5. Un atajo descubierto queda **revelado** en la run (persistido en `secretsJson`).
6. Una casilla secreta nunca vuelve a aparecer en el mismo nodo.

### 13.5 Implementación en Flame

Componentes:

| Componente | Responsabilidad |
|---|---|
| `MazeGame extends FlameGame` | Cámara, carga de segmentos, entrada táctil |
| `MazeWorld` | Contiene nodos, caminos y decoración |
| `NodeComponent` | Sprite del nodo según tipo, estado (bloqueado/disponible/visitado), pulso si disponible |
| `PathComponent` | Línea con arbustos entre nodos (sprite repetido a lo largo de una curva) |
| `PlayerMarker` | Sprite del jugador que **camina** de nodo a nodo (MoveEffect) |
| `SecretBush` | Arbusto con `ParticleSystemComponent` de hojas |
| `FogLayer` | Niebla sobre nodos no alcanzables (shader o sprite con opacidad) |
| `MazeCamera` | `CameraComponent` con seguimiento vertical suave |

```dart
// lib/features/overworld/game/maze_game.dart
class MazeGame extends FlameGame with TapCallbacks {
  MazeGame({required this.run, required this.generator, required this.onNodeSelected});
  final MazeRun run;
  final ProceduralMapGenerator generator;
  final void Function(MazeNode node) onNodeSelected;

  late final MazeWorldComponent mazeWorld;
  late final PlayerMarker player;
  final Map<int, List<MazeNode>> _segments = {};

  @override
  Future<void> onLoad() async {
    mazeWorld = MazeWorldComponent();
    world.add(mazeWorld);
    camera.viewfinder.anchor = const Anchor(0.5, 0.75);   // jugador en el tercio inferior
    await _ensureSegments(run.currentDepth);
    player = PlayerMarker()..position = _positionOf(run.currentNodeId);
    world.add(player);
    camera.follow(player, snap: true, maxSpeed: 400);
  }

  Future<void> _ensureSegments(int depth) async {
    final seg = depth ~/ 10;
    for (final s in [seg, seg + 1]) {
      if (_segments.containsKey(s)) continue;
      final nodes = generator.generateSegment(runSeed: run.seed, segment: s);
      _segments[s] = nodes;
      mazeWorld.addSegment(nodes, revealed: run.visitedNodeIds.toSet());
    }
    _segments.removeWhere((k, _) => k < seg - 1);      // liberar memoria
    mazeWorld.pruneBefore((seg - 1) * 10);
  }

  Future<void> walkTo(MazeNode node) async {
    final target = _positionOf(node.id);
    await player.walkAlong(mazeWorld.pathPoints(from: run.currentNodeId, to: node.id));
    await _ensureSegments(node.depth);
    onNodeSelected(node);       // la UI abre slot/cofre/tienda...
  }

  @override
  void onTapDown(TapDownEvent event) {
    final tapped = mazeWorld.nodeAt(event.localPosition);
    if (tapped != null && tapped.isAvailableFrom(run.currentNodeId)) walkTo(tapped.node);
  }
}
```

Rendimiento (objetivos):

- 60 FPS en gama media con **≤ 150 componentes visibles**.
- **Object pooling** de sprites de arbusto y partículas; reutilizar al reciclar segmentos.
- Atlas de sprites (`TexturePacker` o `flame_texturepacker`) para minimizar *draw calls*.
- Partículas con límite (por ejemplo ≤ 40 simultáneas) y reducción con «Reducir animaciones».

### 13.6 Flujo de un nodo

```
Tocar nodo disponible
 → jugador camina (400–700 ms)
 → según tipo:
     battle  → slot(encounter) → batalla → captura (opcional) → vuelta al mapa
     chest   → slot(chest) → reward toast
     shop    → tienda ambulante (slot de ofertas)
     rest    → curar equipo, restaurar PP/usos, opción de retirarse con 100 %
     event   → evento aleatorio (ver 13.7)
     secret  → slot(secret) → premio único
     boss    → batalla de jefe → cofre épico
     gym     → sala de gimnasio (11.15)
 → guardar progreso (run) → encender nodos siguientes
```

### 13.7 Eventos (nodo `event`)

Tabla de eventos con 2 opciones (decisiones con riesgo/recompensa):

| Evento | Opción A | Opción B |
|---|---|---|
| Estatua antigua | Rezar: +1 ficha | Tocar: 30 % cofre raro / 20 % pierde 10 % vida |
| Comerciante herido | Ayudar (−1 poción): objeto raro | Ignorar: nada |
| Charco brillante | Beber: cura 30 % | Examinar: 25 % de encontrar piedra |
| Entrenador errante | Retar: combate con bonus | Pasar |

### 13.8 Reglas de derrota, retirada y persistencia

- Si **todo el equipo cae**, la run termina; se conserva **50 %** de monedas/objetos ganados en la run (los capturados **se conservan siempre**).
- En nodo de descanso se puede **retirar** con el 100 %.
- La run se guarda **tras cada nodo** (`MazeRunsTable`), no durante la animación; reanudar siempre vuelve al último nodo completado.
- Una run abandonada > 7 días se archiva automáticamente.

### 13.9 Tareas

`T-MAZE-01` generador + tests de alcanzabilidad · `T-MAZE-02` `MazeGame` y cámara · `T-MAZE-03` nodos y caminos con sprites · `T-MAZE-04` jugador y movimiento · `T-MAZE-05` niebla y revelado · `T-MAZE-06` atajos secretos y partículas · `T-MAZE-07` flujo por tipo de nodo · `T-MAZE-08` eventos · `T-MAZE-09` guardado/reanudar · `T-MAZE-10` pooling y perfilado · `T-MAZE-11` biomas y transición visual.

---

## 14. Motor de combate por cartas

### 14.1 Reglas de la mesa

| Concepto | Regla |
|---|---|
| Mazo | 15–20 cartas por criatura (sección 11.4) |
| Mano | Se roban **5** al inicio del turno (mano máx. 7) |
| Energía | **3** al inicio de cada turno, acumulable hasta 6 |
| Coste de carta | 0–4 de energía |
| Usos por combate | Cartas potentes limitadas por `usesPerBattle` (sustituye al PP) |
| Descarte | Las usadas van al descarte; al vaciar el mazo se baraja el descarte |
| Turno | Fase del jugador (jugar cartas) → fase del enemigo (IA) → resolución |
| Iniciativa | Velocidad de la criatura activa; cartas con prioridad alta actúan primero |
| Cambio de criatura | Cuesta 1 de energía y consume la acción principal del turno |
| Huir | Posible en encuentros salvajes (no en jefes ni gimnasios), con probabilidad por velocidad |

### 14.2 Estados alterados (en cartas y efectos sostenidos)

| Estado | Efecto | Duración típica | Representación |
|---|---|---|---|
| Quemado | 1/16 HP por turno; ataque físico ×0.5 | Hasta curar | Chip rojo con llama |
| Envenenado | 1/8 HP por turno | Hasta curar | Chip morado |
| Paralizado | 25 % de no actuar; velocidad ×0.5 | Hasta curar | Chip amarillo |
| Congelado | No actúa; 20 % de descongelar por turno | Hasta descongelar | Chip celeste |
| Dormido | No actúa 1–3 turnos | 1–3 turnos | Chip azul con «z» |
| Confundido | 33 % de golpearse a sí mismo | 1–4 turnos | Chip rosa |

Solo un estado principal a la vez (excepto confusión). Los tipos pueden ser inmunes (por ejemplo, tipo Fuego no se quema).

### 14.3 Estado del combate (inmutable)

```dart
@freezed
class BattleState with _$BattleState {
  const factory BattleState({
    required String id,
    required BattleSide player,
    required BattleSide enemy,
    required int turn,
    required BattlePhase phase,
    required List<BattleLogEntry> log,
    required BattleRules rules,         // reglas especiales (gimnasio)
    BattleResult? result,
  }) = _BattleState;
}

@freezed
class BattleSide with _$BattleSide {
  const factory BattleSide({
    required List<Combatant> party,
    required int activeIndex,
    required List<String> drawPile,
    required List<String> hand,
    required List<String> discard,
    required int energy,
    required Map<String, int> usesLeft,
  }) = _BattleSide;
}

@freezed
class Combatant with _$Combatant {
  const factory Combatant({
    required CreatureInstance creature,
    required CreatureSpecies species,
    required Stats stats,
    required int hp,
    required StatusCondition status,
    required int statusTurns,
    required Map<String, int> stages,   // atk, def, spa, spd, spe, acc, eva (−6..+6)
  }) = _Combatant;
}

enum BattlePhase { start, playerTurn, enemyTurn, resolving, switching, ended }
```

### 14.4 Acciones y reductor

```dart
sealed class BattleAction { const BattleAction(); }
class PlayCard extends BattleAction { const PlayCard(this.cardId); final String cardId; }
class SwitchTo extends BattleAction { const SwitchTo(this.index); final int index; }
class UseItem extends BattleAction { const UseItem(this.itemId, this.targetIndex); final String itemId; final int targetIndex; }
class EndTurn extends BattleAction { const EndTurn(); }
class Flee extends BattleAction { const Flee(); }

class BattleEngine {
  BattleEngine(this.calc, this.rng, this.cards, this.moves, this.chart);
  final DamageCalculator calc;
  final Rng rng;
  final CardCatalog cards;
  final MoveCatalog moves;
  final TypeChart chart;

  /// Puro: recibe estado + acción y devuelve nuevo estado + eventos para animar.
  BattleStep apply(BattleState s, BattleAction a, {required bool byPlayer}) {
    return switch (a) {
      PlayCard(:final cardId) => _playCard(s, cardId, byPlayer),
      SwitchTo(:final index) => _switch(s, index, byPlayer),
      UseItem(:final itemId, :final targetIndex) => _useItem(s, itemId, targetIndex, byPlayer),
      EndTurn() => _endTurn(s),
      Flee() => _flee(s),
    };
  }
  // ...
}

class BattleStep {
  const BattleStep(this.state, this.events);
  final BattleState state;
  final List<BattleEvent> events;   // DamageDealt, StatusApplied, CardDrawn, Fainted, ...
}
```

La **UI no calcula nada**: consume `BattleEvent`s y los anima en orden (cada evento = una animación corta). Esto desacopla lógica y presentación y permite repetir combates (replays) y validar en servidor (PvP).

### 14.5 Resolución de una carta de ataque

1. Validar: energía suficiente, usos restantes, carta en mano.
2. Descontar energía y uso; mover carta a descarte.
3. Comprobar estado del atacante (¿dormido? ¿paralizado falla? ¿confundido se golpea?).
4. Comprobar precisión: `accuracy × stageAcc / stageEva`; si falla → evento `Missed`.
5. Calcular daño con `DamageCalculator` (críticos: 1/16 base, mejorable con cartas).
6. Aplicar daño y efectos secundarios (estado con `statusChance`, cambios de etapa, curación, retroceso).
7. Emitir eventos: `CardPlayed`, `DamageDealt(mult)`, `StatusApplied`, `Fainted`.
8. Si el activo enemigo cae: si hay más → siguiente; si no → `BattleEnded(win)`.

### 14.6 Interfaz de batalla

```
┌──────────────────────────────────────┐
│ Enemigo: Rattata Nv14  ▓▓▓▓▓░░ 62%   │
│                  [sprite enemigo]    │
│                                      │
│ [sprite jugador]                     │
│ Charmander Nv16  ▓▓▓▓▓▓▓ 100%  🔥    │
├──────────────────────────────────────┤
│ Energía ⚡⚡⚡ (3/6)     Turno 2  [Fin]│
│ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐       │
│ │ 1 │ │ 2 │ │ 1 │ │ 0 │ │ 2 │ ←mano │
│ └───┘ └───┘ └───┘ └───┘ └───┘       │
│ [Cambiar] [Objeto] [Huir]            │
└──────────────────────────────────────┘
```

Interacciones:

- **Tocar una carta**: la levanta y muestra pista de efectividad (flecha verde ▲ súper efectivo, roja ▼ resistido, ⊘ inmune) y daño estimado (rango).
- **Arrastrar hacia el enemigo** (o doble toque): jugar la carta. Animación de ataque (embestida, proyectil, flash).
- **Números de daño** flotantes; crítico con sacudida de cámara breve.
- **Registro** colapsable de eventos; el último mensaje siempre visible (accesibilidad).
- **Barra de vida** animada con retardo (la «sombra» de daño baja después).

### 14.7 IA de los B-Bots

| Nivel | Comportamiento | Dónde aparece |
|---|---|---|
| Básico | Elige carta aleatoria ponderada por coste | Nodos 1–10 |
| Táctico | Prefiere ventaja de tipo; remata con poca vida; cura si HP < 30 % | Nodos 11+ |
| Élite | Planifica 2 turnos (simula 2 jugadas con `BattleEngine`) y gasta toda la energía | Élites |
| Jefe | Patrones fijos con **telegrafía** (muestra intención del siguiente turno) | Jefes y líderes |

Escalado por profundidad (`d`): `nivel_enemigo = nivel_medio_jugador + (d ~/ 5) ± 2`; stats base con multiplicador `1 + 0.015·d` (tope 3×).

**Telegrafía de intención** (muy recomendable para sentir justicia): un icono sobre el enemigo indica qué hará (ataque, defensa, estado, cura). Reduce frustración y añade decisión táctica.

### 14.8 Recompensas del combate

- EXP (fórmula 8.5, repartida entre participantes), monedas = `10 + profundidad × 2`.
- Posible **drop de carta** (4 % común, mayor en élite/jefe).
- Tras la victoria sobre una criatura salvaje: transición a **captura** (sección 15).

### 14.9 Tareas

`T-BTL-01` modelos y estado · `T-BTL-02` motor puro y reductor · `T-BTL-03` eventos de batalla · `T-BTL-04` UI base (escena, barras, HUD) · `T-BTL-05` mano y arrastre de cartas · `T-BTL-06` pistas de efectividad · `T-BTL-07` estados alterados · `T-BTL-08` cambio de criatura/objeto/huir · `T-BTL-09` IA por niveles · `T-BTL-10` telegrafía de intención · `T-BTL-11` animaciones de ataque · `T-BTL-12` recompensas · `T-BTL-13` simulaciones masivas de balance.

---

## 15. Captura

### 15.1 Flujo

```
Victoria sobre criatura salvaje (o debilitada si se activa captura anticipada)
 → Modal de captura
 → elegir bola (inventario)
 → ver probabilidad (medidor con texto: Baja / Media / Alta / Muy alta)
 → minijuego de timing (opcional)
 → lanzamiento + 1–3 sacudidas
 → resultado: capturada (registro Pokédex, apodo opcional) o escapó
```

Regla de diseño: **se puede capturar tras vencer** (garantiza progreso), pero capturar **debilitando sin vencer** da probabilidad mucho mayor. Mejor decisión táctica = bajar la vida sin noquear.

Para evitar frustración: si el combate se gana por noqueo directo, la criatura tiene un **40 % de «huida»** y un 60 % de quedar capturable con penalización; el jugador lo ve claramente antes de rematar (icono de «posible captura»).

### 15.2 Minijuego de timing (opcional)

- Un anillo concéntrico se cierra sobre la criatura; tocar cuando entra en la zona verde.
- Resultados: *Perfecto* (+0.25), *Bueno* (+0.15), *Normal* (+0.05), *Fallo* (0).
- «Captura automática» en accesibilidad sustituye por un bonus fijo (+0.08).

### 15.3 Animación de sacudidas

Secuencia (≈ 2.5 s): arco de lanzamiento (`Curve`), bola abre/absorbe con destello, cae al suelo con rebote, **3 sacudidas** con pausas (1 s total, con háptica ligera en cada una), resolución: estrellas y sonido de éxito, o la bola se abre y la criatura sale.

```dart
Future<void> playCaptureSequence(CaptureResult r) async {
  await _throwArc();
  await _absorb();
  for (var i = 0; i < r.shakes; i++) {
    await _shake();                // 350 ms
    await HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 250));
  }
  r.caught ? await _success() : await _breakFree();
}
```

### 15.4 Efectos de la captura

- Se crea `CreatureInstance` con IVs aleatorios (rango según rareza: legendarios mínimo 15), naturaleza aleatoria, habilidad (probabilidad de oculta 5 %), shiny según resultado del slot (x3) o 1/512 base.
- Se actualiza la Pokédex.
- Si el equipo está lleno, va al PC con aviso.
- Primer captura de una especie: **animación especial** y recompensa pequeña.

### 15.5 Tareas

`T-CAP-01` calculadora + tests · `T-CAP-02` selector de bola y medidor · `T-CAP-03` minijuego de timing · `T-CAP-04` animación de lanzamiento y sacudidas · `T-CAP-05` creación de instancia y Pokédex · `T-CAP-06` captura legendaria (3 intentos garantizados).

---

## 16. Economía y balance

### 16.1 Monedas y recursos

| Recurso | Fuente | Sumidero | Tope |
|---|---|---|---|
| **Monedas** | Combates, cofres, reciclaje, misiones, venta | Tienda, mejora de cartas, re-spin avanzado | Sin tope (sumideros escalan) |
| **Fichas** | Misiones, descansos, logros, 3 por día gratuito | Re-spin, nudge, hold extra | 99 |
| **Boletos** | Reciclar legendarios, hitos, jefes | Tirada garantizada de rareza alta | 30 |
| **Polvo** | Reciclar cartas y criaturas | Mejora de cartas | 9999 |
| **Llaves de arbusto** | Cofres, tienda, misiones | Abrir atajos | 20 |
| **Gemas** | Logros, eventos, IAP opcional | Cosméticos, ranuras extra, aceleradores | — |

### 16.2 Precios base y escala

| Objeto | Precio | Efecto |
|---|---|---|
| Poké Ball | 100 | ×1 |
| Super Ball | 300 | ×1.5 |
| Ultra Ball | 600 | ×2 |
| Master Ball | No se vende (solo premio raro) | 100 % |
| Poción | 80 | +30 HP |
| Superpoción | 200 | +80 HP |
| Hiperpoción | 450 | +200 HP |
| Máxima Poción | 800 | HP completo |
| Revivir | 600 | 50 % HP |
| Vitamina | 1500 | +10 EV (límite 100 por stat con vitaminas) |
| X-Stat | 250 | +1 etapa en el combate actual |
| Piedra evolutiva | 2000 | Evolución |

Precio dinámico por profundidad: `precio' = precio × (1 + 0.002 × profundidad)` con tope ×1.5 (solo tienda ambulante).

### 16.3 Ganancia esperada por run (referencia de diseño)

| Profundidad | Monedas por run | Capturas esperadas | Duración |
|---|---|---|---|
| 1–10 | 300–500 | 2–3 | 4–6 min |
| 11–30 | 700–1500 | 3–5 | 8–12 min |
| 31–60 | 1800–3500 | 4–6 | 12–18 min |

**Objetivo:** un jugador casual debería poder comprar una Ultra Ball tras 1 run, y una piedra evolutiva tras 3–4 runs.

### 16.4 Reglas anti-inflación

- Ofertas rotativas y mejoras de cartas escalan 1.35× por nivel.
- Reciclaje rinde menos si se recicla en masa el mismo día (rendimiento decreciente: −10 % tras 20 reciclados).
- Guardería con tope diario.

### 16.5 Telemetría para balance

Registrar: distribución real de resultados del slot, tasa de captura por bola, profundidad media de abandono, tiempo hasta primera evolución, monedas ganadas vs gastadas por día. Los parámetros viven en **tablas remotas** (Supabase) para ajustar sin publicar versión.

---

## 17. Backend Supabase (SQL, RLS, Edge Functions)

### 17.1 Qué va en la nube

| Dato | Local (Drift) | Nube |
|---|---|---|
| Colección, equipo, mazos, inventario, runs | Fuente principal | **Copia** (cloud save) |
| Perfil y ELO | Caché | **Fuente de verdad** |
| Rankings, amigos, intercambios, partidas | — | Fuente de verdad |
| Tablas de balance (probabilidades, precios) | Caché | Fuente de verdad (editable) |

### 17.2 Esquema SQL (migración inicial)

```sql
-- supabase/migrations/0001_init.sql
create extension if not exists "pgcrypto";

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  name text not null check (char_length(name) between 3 and 16),
  avatar_id text not null default 'a01',
  level int not null default 1,
  exp int not null default 0,
  coins int not null default 0 check (coins >= 0),
  gems int not null default 0 check (gems >= 0),
  tokens int not null default 0 check (tokens >= 0),
  tickets int not null default 0 check (tickets >= 0),
  elo int not null default 1000,
  max_depth int not null default 0,
  friend_code text unique not null default substr(encode(gen_random_bytes(5), 'hex'), 1, 8),
  badges jsonb not null default '[]',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.creatures (
  uid uuid primary key,
  user_id uuid not null references public.profiles(id) on delete cascade,
  species_id int not null,
  data jsonb not null,                     -- IVs, EVs, moves, etc. (versión del esquema en data.v)
  slot_kind text not null default 'pc',
  slot_index int,
  deleted boolean not null default false,
  updated_at timestamptz not null default now()
);
create index on public.creatures (user_id, updated_at);

create table public.decks (
  id uuid primary key,
  user_id uuid not null references public.profiles(id) on delete cascade,
  creature_uid uuid,
  name text not null,
  card_ids jsonb not null,
  deleted boolean not null default false,
  updated_at timestamptz not null default now()
);

create table public.inventory (
  user_id uuid not null references public.profiles(id) on delete cascade,
  item_id text not null,
  quantity int not null check (quantity >= 0),
  updated_at timestamptz not null default now(),
  primary key (user_id, item_id)
);

create table public.friends (
  user_id uuid not null references public.profiles(id) on delete cascade,
  friend_id uuid not null references public.profiles(id) on delete cascade,
  status text not null check (status in ('pending','accepted','blocked')),
  created_at timestamptz not null default now(),
  primary key (user_id, friend_id)
);

create table public.trades (
  id uuid primary key default gen_random_uuid(),
  from_user uuid not null references public.profiles(id),
  to_user uuid not null references public.profiles(id),
  offered_uid uuid not null,
  requested_uid uuid,
  status text not null default 'open' check (status in ('open','accepted','cancelled','completed')),
  from_confirmed boolean not null default false,
  to_confirmed boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.matches (
  id uuid primary key default gen_random_uuid(),
  player_a uuid not null references public.profiles(id),
  player_b uuid not null references public.profiles(id),
  state jsonb not null,                    -- BattleState serializado
  turn int not null default 0,
  deadline timestamptz,
  status text not null default 'active' check (status in ('active','finished','abandoned')),
  winner uuid,
  elo_delta_a int, elo_delta_b int,
  created_at timestamptz not null default now()
);

create table public.matchmaking_queue (
  user_id uuid primary key references public.profiles(id) on delete cascade,
  elo int not null,
  deck_hash text not null,
  joined_at timestamptz not null default now()
);

create table public.balance_config (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

create table public.reports (
  id uuid primary key default gen_random_uuid(),
  reporter uuid not null references public.profiles(id),
  target uuid not null,
  reason text not null,
  created_at timestamptz not null default now()
);
```

### 17.3 Row Level Security

```sql
alter table public.profiles enable row level security;
alter table public.creatures enable row level security;
alter table public.decks enable row level security;
alter table public.inventory enable row level security;
alter table public.friends enable row level security;
alter table public.trades enable row level security;
alter table public.matches enable row level security;
alter table public.matchmaking_queue enable row level security;
alter table public.balance_config enable row level security;
alter table public.reports enable row level security;

-- Perfil: lectura pública limitada (ranking), escritura solo propia y SOLO de campos no sensibles
create policy profiles_read on public.profiles for select using (true);
create policy profiles_update_self on public.profiles for update using (auth.uid() = id);

-- Datos propios
create policy creatures_own on public.creatures for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy decks_own on public.decks for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy inventory_own on public.inventory for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Amigos: ver propios y los que me solicitan
create policy friends_read on public.friends for select using (auth.uid() in (user_id, friend_id));
create policy friends_insert on public.friends for insert with check (auth.uid() = user_id);
create policy friends_update on public.friends for update using (auth.uid() in (user_id, friend_id));

-- Intercambios y partidas: solo los participantes ven; los cambios críticos van por Edge Functions
create policy trades_read on public.trades for select using (auth.uid() in (from_user, to_user));
create policy matches_read on public.matches for select using (auth.uid() in (player_a, player_b));

-- Config de balance: lectura para todos, sin escritura de cliente
create policy balance_read on public.balance_config for select using (true);

-- Reportes: solo insertar
create policy reports_insert on public.reports for insert with check (auth.uid() = reporter);
```

> **Importante de seguridad:** `coins`, `gems`, `elo` y similares **no deben ser editables libremente por el cliente** en el modo con cuenta. Dos enfoques: (a) restringir columnas con una vista o trigger que bloquee cambios de esas columnas desde `anon/authenticated` y modificarlas solo con Edge Functions (`service_role`), o (b) aceptar que el progreso es personal y solo proteger ELO/rankings. Para un juego con PvP y rankings, usar (a) al menos para `elo`, `max_depth` y `gems`.

### 17.4 Edge Functions (Deno/TypeScript)

| Función | Qué hace |
|---|---|
| `sync-push` | Recibe lote de cambios (`sync_queue`), valida esquema y límites, aplica con `upsert` |
| `sync-pull` | Devuelve cambios desde `since` (timestamp) |
| `matchmake` | Empareja por ELO (ventana creciente), crea `matches`, notifica por Realtime |
| `submit-action` | Valida una acción de PvP con el **mismo motor** (portado a TS o llamado vía WASM), actualiza estado |
| `finish-match` | Calcula ELO (Elo estándar, K=32), reparte recompensas |
| `trade-confirm` | Verifica propiedad, confirmación doble y **transfiere atómicamente** |
| `daily-quests` | Genera misiones del día (cron) |
| `season-rollover` | Cierra temporada, reparte premios (cron) |

Ejemplo de esqueleto (`submit-action`):

```ts
// supabase/functions/submit-action/index.ts
import { serve } from "https://deno.land/std/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

serve(async (req) => {
  const auth = req.headers.get("Authorization")!;
  const supabase = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_ANON_KEY")!, {
    global: { headers: { Authorization: auth } },
  });
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return new Response("unauthorized", { status: 401 });

  const { matchId, action, clientTurn } = await req.json();
  const admin = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SERVICE_ROLE_KEY")!);

  const { data: match } = await admin.from("matches").select("*").eq("id", matchId).single();
  if (!match || ![match.player_a, match.player_b].includes(user.id)) return new Response("forbidden", { status: 403 });
  if (match.turn !== clientTurn) return new Response("stale", { status: 409 });

  const result = applyAction(match.state, action, user.id);   // motor de reglas en TS
  if (!result.ok) return new Response(JSON.stringify({ error: result.error }), { status: 422 });

  await admin.from("matches").update({
    state: result.state, turn: match.turn + 1,
    deadline: new Date(Date.now() + 30_000).toISOString(),
  }).eq("id", matchId);

  return new Response(JSON.stringify({ ok: true, events: result.events }), { headers: { "Content-Type": "application/json" } });
});
```

### 17.5 Sincronización (cliente)

1. Cada mutación local escribe en `sync_queue` (entidad, id, op, payload).
2. `SyncService` corre al abrir, al recuperar conexión (`connectivity_plus`) y cada 60 s en primer plano.
3. Envía lotes de hasta 50 cambios a `sync-push`; elimina de la cola los confirmados; reintenta con *backoff* los fallidos.
4. `sync-pull` con `since = lastSyncAt`; aplica con reglas de fusión.

Reglas de fusión:

| Entidad | Regla |
|---|---|
| Perfil | Servidor gana en `elo`, `gems`; cliente en cosmética; resto *last-write-wins* |
| Criaturas | Unión por `uid`; si hay conflicto, gana `updated_at` más reciente; `deleted` prevalece si es posterior |
| Inventario | Merge por **deltas** (se guarda la operación, no el valor) para no perder compras en dos dispositivos |
| Mazos | *Last-write-wins* por mazo |
| Run activa | Una sola run activa; la más reciente gana y se avisa al jugador |

### 17.6 Autenticación

- Invitado (sesión anónima de Supabase) → vinculación posterior a correo/Google/Apple **sin perder datos** (`linkIdentity`).
- Borrar cuenta: Edge Function que elimina `auth.users` (cascada) y datos.
- Cumplir: política de privacidad accesible, consentimiento de analítica, edad mínima.

### 17.7 Tareas

`T-BE-01` proyecto y migraciones · `T-BE-02` RLS y pruebas de políticas · `T-BE-03` sync push/pull · `T-BE-04` autenticación y vinculación · `T-BE-05` balance remoto · `T-BE-06` borrado de cuenta · `T-BE-07` funciones cron.

---

## 18. PvP online

### 18.1 Modelo

- **Servidor autoritativo**: el cliente envía *intenciones* (`PlayCard`, `Switch`, `EndTurn`); el servidor valida con el mismo motor, aplica y emite el nuevo estado y los eventos.
- **Realtime**: canal por partida (`match:{id}`); ambos clientes escuchan cambios en `matches` y eventos de *broadcast* (emotes, «escribiendo…»).
- **Información oculta**: la mano del rival **no se envía** al cliente. El estado enviado a cada jugador se filtra (`viewFor(userId)`).

### 18.2 Flujo

```
1. Entrar a la cola (matchmaking_queue) con elo y deck_hash
2. Función matchmake: ventana de ELO ±50, +25 cada 10 s hasta ±300; si no hay → bot de práctica
3. Se crea match; ambos reciben notificación Realtime
4. Fase de preparación (10 s): confirmar mazo/equipo (hash verificado)
5. Turnos simultáneos o alternos* con límite de 30 s
6. Fin: finish-match calcula ELO y recompensas
7. Pantalla de resultado: revancha, amigo, reportar
```

\* Recomendación: **turnos alternos con iniciativa por velocidad** al inicio; más simples de sincronizar.

### 18.3 Validación y anti-trampas

| Amenaza | Medida |
|---|---|
| Mazo ilegal | `deck_hash` + validación completa de `DeckValidator` en servidor |
| Acciones imposibles | Re-ejecución de la acción en servidor; rechazo 422 |
| Turno repetido / desfase | Campo `turn` con control optimista (409) |
| Tiempo agotado | Cron/función marca pérdida de turno; 3 consecutivos → derrota |
| Desconexión | Reconexión 30 s; luego derrota, con ELO reducido a la mitad |
| Manipulación de RNG | El RNG del combate vive **solo** en servidor (semilla por partida) |
| Spam / abuso | Rate limit por usuario, reportes, bloqueo |
| Emulación de recompensas | Recompensas entregadas por servidor |

### 18.4 ELO y temporadas

```
esperado = 1 / (1 + 10^((eloRival - elo) / 400))
nuevoElo = elo + K * (resultado - esperado)        // K = 32 (24 sobre 1800)
```

Rangos: Bronce < 1100, Plata 1100–1299, Oro 1300–1499, Platino 1500–1699, Diamante 1700+. Temporadas de 4 semanas con **reinicio suave** (`elo' = 1000 + (elo - 1000) × 0.5`) y premios por rango.

### 18.5 Equilibrio competitivo

- Formato inicial: **equipo de 3** criaturas con nivel normalizado (50) y mazos validados; sin ventaja por nivel o EVs en rankings (opcional: «Liga libre» con todo permitido).
- Cartas con **ban list** actualizable por `balance_config`.

### 18.6 Interfaz de partida

Reutiliza `BattleScreen` con tres diferencias: no hay IA local (estados vienen del servidor), temporizador visible, panel de emotes. La reproducción de eventos es **idéntica** a la del modo B-Bot, lo que reduce trabajo y errores.

### 18.7 Tareas

`T-PVP-01` cola y matchmaking · `T-PVP-02` motor en servidor (portado) · `T-PVP-03` vista filtrada del estado · `T-PVP-04` pantalla de lobby · `T-PVP-05` reutilizar `BattleScreen` con eventos remotos · `T-PVP-06` temporizador y desconexión · `T-PVP-07` ELO y recompensas · `T-PVP-08` temporadas · `T-PVP-09` amigos y retos · `T-PVP-10` intercambios con confirmación doble · `T-PVP-11` reportes y moderación.

---

## 19. Animación, audio y librerías avanzadas

### 19.1 Qué librería para qué

| Necesidad | Herramienta | Dónde se usa | Notas |
|---|---|---|---|
| Microanimaciones de UI (fade, slide, escala, shake) | `flutter_animate` | Botones, toasts, listas, tarjetas | Sintaxis encadenada `.animate().fadeIn().slideY()` |
| Listas con entrada escalonada | `flutter_staggered_animations` | Pokédex, tienda, inventario | Limitar a los primeros 12 elementos |
| Esqueletos de carga | `shimmer` | Cualquier lista asíncrona | Sustituye a spinners |
| Animaciones vectoriales complejas | `lottie` | Confeti, estrellas de captura, iconos animados | Exportar de After Effects/LottieFiles, < 100 KB |
| Animaciones interactivas con estados | `rive` | **Evolución**, mascota del onboarding, palanca de la tragaperras | State machines con inputs (`isShiny`, `spin`) |
| Confeti y celebración | `confetti` | Jackpot x3, primera captura, subida de nivel | `ConfettiController` + partículas |
| Motor 2D, partículas, cámara, sprites | `flame` | Overworld, partículas de hojas, destellos | `ParticleSystemComponent` |
| Atlas de sprites | `flame_texturepacker` o sprite sheets propias | Nodos, arbustos, jugador | Menos draw calls |
| Shaders (holográfico, niebla) | `FragmentProgram` (SDK) | Cartas holo, niebla del mapa | Archivos `.frag` en `shaders:` del pubspec |
| Gráficos de datos | `fl_chart` | Radar de stats, curva de energía | |
| Audio | `flame_audio` (SFX + BGM) | Todo el juego | Precargar SFX críticos |
| Háptica | `HapticFeedback` | Palanca, sacudidas, daño | Respetar ajuste del usuario |
| Transiciones de página | `animations` (Material motion) | Contenedor transformado de carta a detalle | `OpenContainer` |

### 19.2 Catálogo de animaciones del juego

| Momento | Duración | Técnica | Reducción de movimiento |
|---|---|---|---|
| Cambio de pestaña | 200 ms | Fade + desplazamiento 8 px | Fade simple |
| Abrir detalle de carta | 350 ms | `OpenContainer` (hero) | Corte directo |
| Entrada de tragaperras | 400 ms | Slide + rebote + desenfoque del fondo | Fade 150 ms |
| Giro de carretes | 1.4–2.6 s | `AnimationController` por carrete | Resultado instantáneo |
| Jackpot | 1.5 s | Confeti + luces doradas + vibración | Solo luces |
| Ataque | 300–600 ms | Embestida/proyectil (Flame o `Transform`) | Parpadeo del objetivo |
| Daño | 400 ms | Número flotante + barra con sombra | Número fijo |
| Evolución | 4–5 s | Rive: silueta pulsante → flash → revelado | Fundido a blanco 1 s |
| Lanzamiento de bola | 2.5 s | Arco + sacudidas | Salto a resultado |
| Subida de nivel | 1.2 s | Lottie + contador | Texto resaltado |
| Contador de recompensas | 800 ms | `TweenAnimationBuilder<int>` | Valor final |

### 19.3 Reglas de rendimiento de animación

1. Todo lo animado dentro de `RepaintBoundary`.
2. No animar `Opacity` de árboles grandes; usar `FadeTransition`.
3. Limitar partículas y usar *pooling*.
4. Precargar (`precacheImage`, `FragmentProgram.fromAsset`, `Lottie.cache`) en el splash o durante el slot.
5. Perfilar con DevTools en un dispositivo de **gama baja** desde la fase 1.
6. Objetivo: **0 frames > 16 ms** en transiciones principales.

### 19.4 Audio

| Tipo | Archivos | Formato | Reglas |
|---|---|---|---|
| Música | Menú, laberinto (uno por bioma), combate, jefe, victoria | OGG/AAC en loop | Una pista a la vez con *crossfade* 600 ms |
| SFX UI | Toque, confirmar, error, compra | WAV corto o OGG | < 50 KB cada uno |
| SFX slot | Palanca, carrete girando, parada, luz, jackpot | WAV/OGG | Pitch creciente por carrete |
| SFX combate | Golpes por tipo, crítico, estado, KO | OGG | 18 variantes mínimas por tipo (opcional, empezar con 6) |
| SFX captura | Lanzamiento, sacudida, éxito, fallo | OGG | |

```dart
// lib/core/audio/audio_service.dart
class AudioService {
  AudioService(this._settings);
  final AudioSettings _settings;

  Future<void> preload() => FlameAudio.audioCache.loadAll([
        'sfx/tap.ogg', 'sfx/lever.ogg', 'sfx/reel_stop.ogg', 'sfx/jackpot.ogg',
        'sfx/hit.ogg', 'sfx/throw.ogg', 'sfx/shake.ogg', 'sfx/caught.ogg',
      ]);

  void sfx(String name, {double volume = 1}) {
    if (!_settings.sfxOn) return;
    FlameAudio.play('sfx/$name.ogg', volume: volume * _settings.sfxVolume);
  }

  Future<void> bgm(String name) async {
    if (!_settings.musicOn) return;
    await FlameAudio.bgm.play('music/$name.ogg', volume: _settings.musicVolume);
  }
}
```

Audio también como **accesibilidad**: cada evento clave tiene señal sonora distinta (efectivo, resistido, crítico, KO).

### 19.5 Shader holográfico de carta (idea)

```glsl
// shaders/holo.frag
#include <flutter/runtime_effect.glsl>
uniform vec2 uSize;
uniform vec2 uTilt;      // -1..1 (giroscopio o dedo)
uniform sampler2D uTex;
out vec4 fragColor;
void main() {
  vec2 uv = FlutterFragCoord().xy / uSize;
  vec4 base = texture(uTex, uv);
  float band = sin((uv.x + uv.y) * 12.0 + uTilt.x * 6.0) * 0.5 + 0.5;
  vec3 rainbow = 0.5 + 0.5 * cos(6.2831 * (band + vec3(0.0, 0.33, 0.67)));
  fragColor = vec4(mix(base.rgb, base.rgb + rainbow * 0.25, step(0.55, base.a)), base.a);
}
```

---

## 20. CRUD completo por entidad

Cada operación indica **pantalla**, **regla** y **sincronización**.

| Entidad | C (crear) | R (leer) | U (actualizar) | D (eliminar) | Sync |
|---|---|---|---|---|---|
| **Perfil** | Onboarding (nombre, avatar) | Perfil, HUD, rankings | Cambiar nombre (1/semana), avatar, idioma | Borrar cuenta y datos (Ajustes) | Servidor gana en ELO/gemas |
| **Criatura** | Captura, eclosión, intercambio, fusión | Equipo, PC, detalle, Pokédex | Nivel/EXP, apodo, movimientos, objeto, favorito, evolución, posición | Liberar (con deshacer), reciclar, intercambiar | Upsert + soft delete |
| **Equipo** | Autocreado (6 slots) | Equipo, vista rápida | Reordenar, sustituir | — (vaciar un slot = mover a PC) | Con criaturas |
| **Movimiento (de criatura)** | Aprender (nivel, MT) | Pestaña Ataques | Cambiar entre aprendidos | Olvidar (mín. 1 movimiento) | Con criatura |
| **Carta (propiedad)** | Premios, tienda, reciclaje | Álbum, inventario | Mejorar nivel, favorita | Reciclar por polvo | Upsert |
| **Mazo** | Constructor (crear/duplicar/plantilla) | Lista de mazos, detalle | Añadir/quitar cartas, renombrar | Eliminar (confirmación) | LWW |
| **Objeto (inventario)** | Comprar, premios | Inventario | Usar, equipar, apilar | Vender, descartar | Deltas |
| **Catálogo tienda** | Panel admin / `balance_config` | Tienda | Admin: precios, stock, fechas | Admin: retirar | Remoto |
| **Run del laberinto** | Iniciar run (semilla) | Reanudar, resumen | Avance por nodo (autoguardado) | Abandonar | Última gana |
| **Pokédex** | Automático (visto/capturado) | Pokédex | Automático | Solo con reinicio de cuenta | Unión |
| **Huevo** | Premios/cofres | Incubadora | Pasos acumulados | Eclosionar (consume) | Upsert |
| **Misión/Logro** | Generadas por semilla diaria | Misiones | Progreso por eventos; reclamar | Caducidad automática | Servidor valida |
| **Amigo** | Enviar solicitud (código o búsqueda) | Lista | Aceptar/rechazar, apodo | Eliminar/bloquear | Servidor |
| **Intercambio** | Crear oferta | Ofertas, historial | Contraoferta, confirmar | Cancelar | Servidor (atómico) |
| **Partida PvP** | Matchmaking/reto | Historial | Acciones (servidor) | Borrar historial propio | Servidor |
| **Guardería** | Depositar | Estado/rendimiento | — | Retirar y cobrar | Upsert |
| **Ajustes** | Valores por defecto | Pantalla | Cambiar | Restablecer | Local (+nube opcional) |
| **Reporte** | Reportar jugador/error | — (solo admin) | Admin: estado | Admin | Servidor |

### 20.1 Reglas transversales de CRUD

1. **Eliminar** siempre es *soft delete* con **Deshacer** de 8 s antes de encolar el borrado real.
2. Acciones destructivas en lote muestran un **resumen** («Vas a liberar 7 criaturas, 0 favoritas»).
3. Toda escritura es **transaccional** (por ejemplo comprar = descontar monedas + sumar objeto).
4. Todo formulario valida **en cliente y en dominio** y muestra errores junto al campo.
5. Las listas tienen **estado vacío**, **estado de error con reintentar** y **carga con skeleton**.
6. Todo cambio emite un evento de analítica (sin datos personales).

### 20.2 Panel de administración (web, mínimo)

- Tecnología sugerida: Next.js/Flutter Web + Supabase (roles `admin` por claim).
- Módulos: catálogo de objetos y precios, tablas de probabilidad del slot, ofertas diarias, eventos con fechas, reportes de jugadores, baneos, métricas básicas.
- Cada cambio guarda **versión y autor** en `balance_config_history` (auditoría y reversión).

---

## 21. Testing

### 21.1 Pirámide

| Nivel | Cantidad objetivo | Qué cubre |
|---|---|---|
| Unitarias (dominio) | 70 % | Reglas puras: daño, captura, slot, generador, evolución, validador de mazo |
| Widget / golden | 20 % | Pantallas clave, componentes, accesibilidad |
| Integración | 10 % | Flujos completos en dispositivo |

### 21.2 Pruebas de dominio imprescindibles

| Módulo | Pruebas |
|---|---|
| `TypeChart` | Tabla completa 18×18 verificada contra datos de referencia; inmunidades (0) correctas |
| `DamageCalculator` | Valores conocidos de ejemplo; STAB ×1.5; crítico ×1.5; inmune = 0; mínimo 1 si no inmune |
| `CaptureCalculator` | Rango de probabilidad con HP 100 % y 5 % por bola; Master Ball = 100 %; estado dormido mejora |
| `ExperienceCurve` | Nivel ↔ EXP coherente y monótono para las 4 curvas |
| `EvolutionChecker` | Cada tipo de condición (nivel, piedra, amistad, intercambio, objeto) |
| `SlotEngine` | 100 000 giros ≈ tabla (±1 %); pity; Hold coherente; determinismo con semilla |
| `ProceduralMapGenerator` | **Alcanzabilidad** (siempre hay camino de capa N a N+1), determinismo por semilla, descanso cada ≤ 7 capas, jefe cada 10 |
| `DeckValidator` | Límites de tamaño, copias, ataques legales |
| `BattleEngine` | Casos de turno (orden por velocidad/prioridad), estados, KO y cambio forzado |
| Economía | Simulación de 1000 runs: ganancia de monedas dentro de rangos de 16.3 |

Ejemplo:

```dart
void main() {
  test('el generador siempre produce un camino válido por 200 semillas', () {
    final gen = ProceduralMapGenerator();
    for (var seed = 0; seed < 200; seed++) {
      final nodes = gen.generateSegment(runSeed: seed, segment: 0);
      final byDepth = <int, List<MazeNode>>{};
      for (final n in nodes) { byDepth.putIfAbsent(n.depth, () => []).add(n); }
      var reachable = {byDepth[0]!.first.id};
      for (var d = 0; d < 9; d++) {
        final next = byDepth[d]!.where((n) => reachable.contains(n.id)).expand((n) => n.nextIds).toSet();
        expect(next, isNotEmpty, reason: 'seed $seed depth $d sin salida');
        reachable = next;
      }
    }
  });

  test('slot: distribución cercana a la tabla', () {
    final engine = SlotEngine(defaultConfig, SeededRng(42));
    final counts = <SlotOutcome, int>{};
    var pity = const SlotPity();
    for (var i = 0; i < 100000; i++) {
      final s = engine.spin(pity: pity);
      counts[s.outcome] = (counts[s.outcome] ?? 0) + 1;
      pity = pity.afterSpin(s);
    }
    expect(counts[SlotOutcome.match3]! / 100000, closeTo(0.08, 0.015)); // pity eleva ligeramente
    expect(counts[SlotOutcome.miss]! / 100000, closeTo(0.22, 0.01));
  });
}
```

### 21.3 Widget y golden

- Goldens de: `HomeCard`, `CreatureTile`, `CardTile` (3 rarezas), `HpBar` (verde, ámbar, rojo), `StatusChip` (6 estados), pantalla de tienda.
- Pruebas con `textScaler: 1.3` y tema alto contraste.
- Semantics: cada botón de icono con etiqueta.

### 21.4 Integración (dispositivo/emulador)

1. **Flujo núcleo:** onboarding → mapa → slot (forzado) → batalla → captura → equipo (la criatura aparece).
2. **Compra:** tienda → comprar → inventario actualizado → usar en criatura.
3. **Persistencia:** cerrar y reabrir la app a mitad de una run → reanuda en el último nodo.
4. **Offline:** modo avión durante toda una run sin errores.
5. **Sync:** dos sesiones simuladas, conflicto de inventario resuelto por deltas.

### 21.5 Rendimiento y calidad

| Métrica | Objetivo |
|---|---|
| FPS overworld | 60 estables en gama media; ≥ 45 en gama baja |
| Arranque en frío | < 3 s |
| Memoria | < 200 MB en pico |
| Tamaño APK/AAB inicial | < 60 MB (assets pesados descargados bajo demanda) |
| Imagen desde caché | < 200 ms |
| Error-free sessions | > 99.5 % |

### 21.6 Playtests

- Fase 1: 10 personas externas, 10 minutos; pregunta clave «¿jugarías otra run?» (≥ 7 de 10 sí).
- Fase 3: 5 personas por interfaz nueva; medir tiempo hasta la primera captura y errores de navegación.
- Registrar sesiones (con permiso) para detectar confusión en los primeros 3 minutos.

---

## 22. CI/CD y entornos

### 22.1 Entornos (flavors)

| Entorno | Backend | Uso |
|---|---|---|
| `dev` | Supabase dev; probabilidades «fáciles» opcionales | Desarrollo |
| `staging` | Supabase staging | QA, beta interna |
| `prod` | Supabase prod | Tiendas |

Claves por `--dart-define-from-file=env/dev.json` (sin comitear secretos):

```json
{ "SUPABASE_URL": "https://xxxx.supabase.co", "SUPABASE_ANON_KEY": "***", "POKEMONTCG_KEY": "***", "ENV": "dev" }
```

### 22.2 GitHub Actions

```yaml
# .github/workflows/ci.yml
name: ci
on:
  pull_request:
  push: { branches: [main] }

jobs:
  checks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with: { channel: stable, cache: true }
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: dart format --set-exit-if-changed .
      - run: flutter analyze --fatal-infos
      - run: flutter test --coverage
      - name: Cobertura mínima del dominio
        run: |
          sudo apt-get install -y lcov
          lcov --extract coverage/lcov.info 'lib/domain/*' -o coverage/domain.info
          lcov --summary coverage/domain.info | tee cov.txt
          python3 - <<'PY'
          import re,sys
          t=open('cov.txt').read()
          p=float(re.search(r'lines\.*: ([\d.]+)%',t).group(1))
          sys.exit(0 if p>=85 else 1)
          PY

  android:
    needs: checks
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with: { distribution: temurin, java-version: 17 }
      - uses: subosito/flutter-action@v2
        with: { channel: stable, cache: true }
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: flutter build appbundle --release --dart-define-from-file=env/staging.json
      - uses: actions/upload-artifact@v4
        with: { name: aab, path: build/app/outputs/bundle/release/*.aab }
```

iOS: usar runner `macos-latest` o Codemagic/Fastlane (firma y TestFlight).

### 22.3 Calidad de rama

- Rama `main` protegida; PRs con 1 revisión y CI verde.
- Convención de commits (Conventional Commits) y *changelog* automático.
- *Feature flags* (remotos) para PvP, intercambios y eventos: se pueden apagar sin publicar versión.

### 22.4 Lanzamiento

1. Beta cerrada: TestFlight / pruebas internas de Google Play.
2. Lanzamiento gradual (5 % → 20 % → 100 %) vigilando *crash-free sessions*.
3. Ficha de tienda: capturas de overworld, slot y batalla; video corto de 15 s.
4. Cumplimiento: clasificación por edad, política de privacidad, **divulgación de probabilidades**, política de borrado de cuenta.

---

## 23. Telemetría, accesibilidad e i18n

### 23.1 Eventos de analítica (sin datos personales)

| Evento | Parámetros |
|---|---|
| `onboarding_step` | `step`, `skipped` |
| `run_start` / `run_end` | `seed_hash`, `depth`, `reason`, `duration_s`, `coins_gained` |
| `slot_spin` | `context`, `outcome`, `winning_rarity`, `pity_active`, `held`, `nudged` |
| `battle_end` | `result`, `turns`, `enemy_level`, `ai_level`, `cards_played` |
| `capture_attempt` | `ball`, `hp_pct`, `status`, `timing`, `success` |
| `shop_purchase` | `item`, `qty`, `currency` |
| `evolve` | `species_from`, `species_to`, `method` |
| `sync_error` | `entity`, `code` |
| `ui_error` | `screen`, `code` |

Reglas: consentimiento explícito donde sea requerido; sin identificadores personales; datos agregados para ajustar balance.

### 23.2 Embudos clave a vigilar

1. Instalación → primera captura (objetivo > 80 %, < 3 min).
2. Primera run → segunda run (objetivo > 55 %).
3. Run → compra en tienda (objetivo > 40 % en la primera semana).
4. Día 1 / 7 / 30 de retención (objetivos 40 % / 15 % / 6 %).

### 23.3 Accesibilidad (checklist)

- [ ] Contraste AA en todo el texto.
- [ ] Objetivos táctiles ≥ 48 dp.
- [ ] `Semantics` en iconos, barras de vida, cartas y estados.
- [ ] Tipos con **forma + color**.
- [ ] Texto escalable a 1.5× sin romper layouts.
- [ ] «Reducir animaciones» respetado en **todas** las animaciones largas.
- [ ] «Captura automática» y «saltar animaciones del slot».
- [ ] Mensaje de resultado de turno siempre en texto.
- [ ] Soporte de lector de pantalla en navegación principal.
- [ ] Modo una mano (acciones principales en el tercio inferior).

### 23.4 i18n

- `l10n.yaml` + `app_es.arb` (base) y `app_en.arb`.
- Texto de criaturas, movimientos y cartas **localizado desde los datos** (PokéAPI `names`, TCGdex `/es`).
- Formatos de número y fecha con `intl`.
- Prohibido concatenar cadenas; usar parámetros ICU (`{count, plural, one{...} other{...}}`).

```yaml
# l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_es.arb
output-localization-file: app_localizations.dart
```

---

## 24. Roadmap por sprints con tareas

Sprints de 2 semanas. Estimación para equipo de 2–4 personas; en solitario multiplicar por 2–2.5.

### 24.1 Visión general

| Fase | Sprints | Resultado |
|---|---|---|
| 0. Preparación | S0 (1–2 sem) | Prototipo clicable, repositorio, CI, decisión legal |
| 1. Núcleo jugable | S1–S3 | Slot + batalla + captura + datos (sin laberinto) |
| 2. Laberinto y progreso | S4–S6 | Run completa, equipo, Pokédex |
| 3. Colección, tienda y CRUD | S7–S9 | Mazo, tienda, inventario, evolución, onboarding → **MVP interno** |
| 4. Cuenta y backend | S10–S11 | Auth, sync, balance remoto |
| 5. Metajuego | S12–S14 | Misiones, guardería, reciclador, gimnasios, biomas, audio |
| 6. Online | S15–S17 | Amigos, intercambios, PvP, rankings |
| 7. Pulido y lanzamiento | S18–S20 | Rendimiento, accesibilidad, i18n, beta, tiendas |

**MVP publicable (sin PvP):** semana ~24 (S12).

### 24.2 Detalle por sprint

**S0 — Preparación**
- `T-PREP-01` decisión Pokémon vs criaturas propias (ADR)
- `T-PREP-02` wireframes Figma de 8 pantallas núcleo + prototipo
- `T-PREP-03` repositorio, estructura, lints, `AGENTS.md`
- `T-PREP-04` CI inicial (analyze + test)
- `T-PREP-05` design tokens y tema
- `T-PREP-06` script `tool/seed_catalog.dart` (especies, movimientos, tipos)
- *Hecho cuando:* app vacía arranca con tema, router y CI verde; catálogo JSON generado.

**S1 — Dominio base**
- `T-DOM-01` entidades freezed, enums, value objects
- `T-DOM-02` `Rng` y pruebas
- `T-DOM-03` `TypeChart`, `StatCalculator`, `DamageCalculator` + tests
- `T-DOM-04` `CaptureCalculator`, `ExperienceCurve` + tests
- `T-DOM-05` Drift: tablas núcleo y DAOs de criatura/perfil/inventario
- *Hecho cuando:* cobertura de dominio ≥ 85 %.

**S2 — Slot**
- `T-SLOT-01…06`, `T-SLOT-09`
- Pantalla de prueba aislada («laboratorio de slot») para ajustar sensación.
- *Hecho cuando:* 100 000 giros ≈ tabla; animación fluida a 60 FPS.

**S3 — Batalla y captura**
- `T-BTL-01…06`, `T-BTL-09` (IA básica), `T-CAP-01…05`
- Datos de 50 criaturas y 40 cartas de acción cacheados.
- *Hecho cuando:* **hito de decisión 1**: ¿es divertido slot + combate? 10 playtesters.

**S4 — Generador y mapa**
- `T-MAZE-01…04`
- *Hecho cuando:* caminar 20 nodos con persistencia de semilla.

**S5 — Flujo de nodos**
- `T-MAZE-05…09`, `T-RUN-01…03`
- Integración: nodo → slot → batalla → captura → vuelta al mapa.
- *Hecho cuando:* una run completa de 20 niveles sin errores.

**S6 — Equipo y Pokédex**
- `T-TEAM-01…07`, `T-DEX-01…05`
- *Hecho cuando:* capturar → aparece en equipo/PC y Pokédex en tiempo real.

**S7 — Mazo y cartas**
- `T-DECK-01…05`, `T-ALB-01…04`
- Integración TCGdex y caché de imágenes (`T-API-01…04`).
- *Hecho cuando:* mazo inválido se rechaza con motivo; álbum fluido con 200 cartas.

**S8 — Tienda e inventario**
- `T-SHOP-01…04`, `T-INV-01…03`
- *Hecho cuando:* compra transaccional y uso de objetos en equipo/combate.

**S9 — Evolución, onboarding y pulido de MVP**
- `T-EVO-01…05`, `T-ONB-01…04`, `T-HOME-01…04`
- *Hecho cuando:* **hito de decisión 2**: retención de runs (segunda run > 55 % en playtest).

**S10 — Cuenta**
- `T-BE-01…04`
- **S11 — Sync y balance remoto:** `T-BE-05…07`, panel admin mínimo (20.2).

**S12 — Misiones, ajustes, probabilidades:** `T-QST-01…03`, ajustes, `T-SLOT-10`. **→ MVP publicable.**

**S13 — Guardería, reciclador:** `T-DAY-01…03`, `T-REC-01…04`.
**S14 — Gimnasios, biomas, audio:** `T-GYM-01…03`, `T-MAZE-10…11`, música y SFX completos.

**S15 — Social:** amigos, código de amigo, retos (`T-PVP-09`).
**S16 — PvP:** `T-PVP-01…07` (asíncrono primero; tiempo real después).
**S17 — Intercambios, temporadas, moderación:** `T-PVP-08, 10, 11`.

**S18 — Rendimiento y accesibilidad:** perfilado en gama baja, checklist 23.3.
**S19 — i18n, tutorial final, beta cerrada.**
**S20 — Corrección, ficha de tienda, lanzamiento gradual.**

### 24.3 Definición de «hecho» (por tarea)

1. Cumple los criterios de aceptación de su interfaz.
2. Tests (unitarios/widget) añadidos o actualizados.
3. `flutter analyze` sin avisos.
4. Textos en `.arb`.
5. Accesibilidad básica comprobada (semantics + escala de texto).
6. Capturas o clip adjuntos al PR si hay UI.
7. README del feature actualizado si cambia el contrato.

### 24.4 Puntos de decisión (stop/go)

| Punto | Pregunta | Si la respuesta es no |
|---|---|---|
| Fin S3 | ¿Divierte slot + combate? | Rediseñar probabilidades, ritmo y recompensas antes de seguir |
| Fin S9 | ¿Retiene el bucle de run? | Revisar duración, premios y progresión; reducir alcance meta |
| Fin S12 | ¿Retención D1/D7 aceptable en beta? | Posponer PvP; invertir en contenido del laberinto |
| Antes de S15 | ¿Vale la pena PvP ahora? | Priorizar eventos y contenido PvE |

---

## 25. Guía para agentes de código (OpenCode) y prompts por módulo

### 25.1 Cómo trabajar con agentes

Los agentes de código (OpenCode, Claude Code u otros) rinden mejor con **contexto estable, tareas pequeñas y criterios verificables**. Estrategia:

1. **Un archivo de contexto raíz** (`AGENTS.md`) con reglas de arquitectura y comandos.
2. **Este documento como fuente de verdad**; cada prompt referencia una sección y un ID de tarea.
3. **Tareas de 1–3 horas**, una rama por tarea, con tests.
4. **Revisión humana** de cada PR (el agente propone, tú decides).
5. **Verificar siempre** versiones de paquetes y APIs con la documentación vigente: los agentes pueden proponer APIs desactualizadas.

> Consulta la documentación actual de OpenCode para la forma exacta de configurar reglas, comandos personalizados y agentes; los nombres de archivos y ajustes pueden cambiar entre versiones. El contenido de `AGENTS.md` de abajo es independiente de la herramienta.

### 25.2 `AGENTS.md` (plantilla)

```markdown
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
```

### 25.3 Estructura de prompt recomendada

```
Contexto: lee docs/GDD.md sección <N> y AGENTS.md.
Tarea: <ID> — <título>.
Alcance: <qué entra / qué NO entra>.
Entradas existentes: <archivos o providers disponibles>.
Entregables: <archivos a crear/modificar>.
Criterios de aceptación: <lista verificable>.
Pruebas: <qué tests escribir>.
Restricciones: <reglas del AGENTS.md relevantes>.
Al terminar: format + analyze + test, y resume cambios.
```

### 25.4 Prompts listos para usar (por módulo)

**P-01 · Scaffold del proyecto** (S0)
```
Contexto: GDD secciones 3 y 4. Tarea T-PREP-03.
Crea el proyecto Flutter con la estructura de carpetas de 4.3 (carpetas vacías con .gitkeep),
pubspec.yaml con las dependencias de 3.3 (usa `flutter pub add` para versiones actuales),
analysis_options.yaml (flutter_lints), main.dart con ProviderScope y MaterialApp.router,
tema de 5.4 y tokens de 5.2. No implementes features todavía.
Criterios: `flutter run` muestra una pantalla vacía con el tema; analyze y test pasan.
```

**P-02 · Dominio base y reglas** (S1)
```
Contexto: GDD secciones 7 y 8. Tareas T-DOM-01..04.
Implementa entidades freezed, enums, value objects, Rng (Secure/Seeded) y las reglas
TypeChart, StatCalculator, DamageCalculator, CaptureCalculator, ExperienceCurve.
Sin importar Flutter en lib/domain.
Pruebas: casos de 21.2 para cada regla; cobertura de dominio >= 85%.
No toques UI ni base de datos.
```

**P-03 · Base de datos local** (S1)
```
Contexto: GDD sección 9. Tarea T-DOM-05.
Crea las tablas Drift de 9.1, AppDatabase con migración inicial y DAOs
(CreatureDao con CRUD completo y soft delete, InventoryDao con operaciones transaccionales,
ProfileDao, PokedexDao). Repositorios con interfaces en domain/repositories.
Pruebas con base en memoria: swap de slots atómico, compra transaccional, soft delete + restore.
```

**P-04 · Catálogo desde PokéAPI** (S0–S3)
```
Contexto: GDD 10.1, 10.2. Tarea T-PREP-06.
Escribe tool/seed_catalog.dart que descargue especies (primeras N generaciones), movimientos,
tipos y evoluciones de PokéAPI con reintentos y pausas, y genere assets/data/*.json con el
esquema mínimo del GDD (nombres en español cuando existan). Idempotente y reanudable.
Incluye test del mapper con JSON de ejemplo guardado en test/fixtures.
No llames a PokéAPI desde la app en tiempo de ejecución.
```

**P-05 · Motor de tragaperras** (S2)
```
Contexto: GDD sección 12. Tareas T-SLOT-01..03, 09.
Implementa SlotConfig, SlotEngine, SlotPity y tablas por contexto en dominio puro.
Pruebas: distribución a 100 000 giros (±1.5%), pity, determinismo con semilla, Hold coherente.
La pantalla de probabilidades debe poder generarse leyendo SlotConfig (deja el método
`OddsTable fromConfig(SlotConfig)`), sin escribir números a mano.
```

**P-06 · UI de la tragaperras** (S2)
```
Contexto: GDD 12.5, 12.6, 5.x. Tareas T-SLOT-04..08.
Implementa Reel, SlotMachineView (marco con luces, palanca, botón Girar, Hold, Nudge),
secuencia de paradas escalonadas con suspense, confeti en x3 (paquete confetti),
SFX y háptica por AudioService, y opción "reducir animaciones" (resultado inmediato).
Pantalla de laboratorio /dev/slot para ajustar tiempos. 60 FPS en dispositivo de gama media.
```

**P-07 · Motor de batalla** (S3)
```
Contexto: GDD sección 14 (14.1–14.5, 14.7). Tareas T-BTL-01..03, 09.
Implementa BattleState, BattleAction, BattleEngine.apply (puro) que devuelve BattleStep
(estado + eventos), IA básica y táctica. Sin UI.
Pruebas: orden por velocidad y prioridad, estados alterados, robo/descarte/barajado,
cambio de criatura, fin de combate. Incluye un simulador de 10 000 combates que reporte
win-rate por tipo y turnos medios.
```

**P-08 · UI de batalla** (S3)
```
Contexto: GDD 14.6. Tareas T-BTL-04..08, 11.
Construye BattleScreen que consume BattleEvent en cola y los anima en orden.
Mano con arrastre hacia el enemigo, pistas de efectividad, barras de vida con sombra,
estados con StatusChip, registro colapsable, cambiar/objeto/huir con confirmación.
La pantalla NO calcula daño ni reglas: solo reproduce eventos.
```

**P-09 · Captura** (S3)
```
Contexto: GDD sección 15. Tareas T-CAP-02..05.
Modal de captura: selector de bola desde inventario, medidor de probabilidad en texto,
minijuego de timing opcional (respeta accesibilidad), animación de lanzamiento y sacudidas
con háptica, creación de CreatureInstance (IVs, naturaleza, habilidad, shiny), registro en
Pokédex y envío al PC si el equipo está lleno.
```

**P-10 · Generador de laberinto** (S4)
```
Contexto: GDD 13.2, 13.3, 13.4. Tarea T-MAZE-01.
Implementa ProceduralMapGenerator en dominio puro con las reglas del GDD.
Pruebas: alcanzabilidad en 1000 semillas, determinismo, jefe cada 10 capas, descanso
cada <= 7 capas, secretos 3–6%. Entrega también un visor ASCII para depurar semillas.
```

**P-11 · Overworld en Flame** (S4–S5)
```
Contexto: GDD 13.5–13.8. Tareas T-MAZE-02..09.
Implementa MazeGame con cámara que sigue al jugador, componentes de nodo/camino/arbusto,
niebla, arbustos secretos con partículas, caminata animada, carga de segmentos y
guardado tras cada nodo. Integra con Riverpod (callbacks hacia la UI) y navega al slot según
tipo de nodo. Pooling de sprites. Objetivo 60 FPS.
```

**P-12 · Equipo y PC** (S6)
```
Contexto: GDD 11.3. Tareas T-TEAM-01..07.
Implementa TeamScreen con drag & drop (intercambio atómico), detalle con pestañas,
selector de movimientos, PC con filtros y selección múltiple, liberar con Deshacer de 8 s,
radar chart (fl_chart). Reglas: máximo 6, no liberar la última, transacciones.
```

**P-13 · Pokédex** (S6)
```
Contexto: GDD 11.2. Tareas T-DEX-01..05.
Lista virtualizada con itemExtent, búsqueda con debounce, filtros (tipo, región, generación,
estado), detalle con árbol de evolución (CustomPainter). Las especies no vistas no revelan
nombre ni sprite. Registro automático de visto/capturado desde repositorios.
```

**P-14 · Cartas e imágenes** (S7)
```
Contexto: GDD 10.3–10.7, 11.4b. Tareas T-API-01..04, T-ALB-01..04.
Cliente TCGdex (REST, /v2/es) con mapeo a modelos, URL de imagen = campo `image` + /{quality}.{ext},
repositorio con fallback (CardSource), caché con CacheManager (límites y periodos de 10.7),
widget GameImage con placeholder shimmer y error. Álbum con grid, detalle con zoom y fundido
low→high.
```

**P-15 · Constructor de mazo** (S7)
```
Contexto: GDD 11.4. Tareas T-DECK-01..05.
DeckValidator (dominio) con las reglas de la tabla, UI de dos paneles, curva de energía,
plantillas y auto-armar (heurística). Guardar solo si es válido y mostrar la regla que falla.
```

**P-16 · Tienda e inventario** (S8)
```
Contexto: GDD 11.6, 11.7, 16. Tareas T-SHOP-*, T-INV-*.
Catálogo desde assets, compra/venta transaccional (monedas + objeto), ofertas diarias con
semilla de fecha, selector de cantidad, vista previa de vitaminas, uso de objetos en equipo
y en combate. Sin cajas aleatorias con dinero real.
```

**P-17 · Evolución e incubadora** (S9)
```
Contexto: GDD 8.6, 11.5. Tareas T-EVO-*.
Lista de elegibles con condición y atajo a tienda, animación con Rive (placeholder si no hay
archivo), transacción de evolución (conservar IVs/EVs/naturaleza, recalcular stats, Pokédex),
revisión de mazo, huevos que avanzan al recorrer nodos.
```

**P-18 · Onboarding** (S9)
```
Contexto: GDD 11.0. Tareas T-ONB-*.
Splash con precarga real, selector de inicial, TutorialRng que fuerza resultados favorables,
overlays que resaltan la acción esperada, tutorial omitible tras la primera vez.
```

**P-19 · Backend y sync** (S10–S11)
```
Contexto: GDD sección 17. Tareas T-BE-*.
Migraciones SQL, RLS con pruebas, Edge Functions sync-push/pull, SyncService con cola,
backoff y reglas de fusión de 17.5, autenticación con sesión anónima y vinculación posterior,
balance_config remoto con caché local. Columnas sensibles (elo, gems) solo modificables
por funciones de servidor.
```

**P-20 · PvP** (S15–S17)
```
Contexto: GDD sección 18. Tareas T-PVP-*.
Cola/matchmake por ELO, submit-action con el motor de reglas en el servidor, vista filtrada
(mano oculta), BattleScreen reutilizada con eventos remotos, temporizador de 30 s,
reconexión, ELO y recompensas, intercambios con confirmación doble atómica.
```

### 25.5 Skills / procedimientos reutilizables para el agente

Define, en el mecanismo de «skills», «comandos» o «reglas» de tu agente, estos procedimientos (el nombre exacto depende de la herramienta):

| Procedimiento | Qué hace el agente |
|---|---|
| `new-feature <nombre>` | Crea la estructura feature-first (presentation/application + README de contrato) y la ruta |
| `new-entity <Nombre>` | Crea entidad freezed + tabla Drift + DAO + repositorio + provider + tests de CRUD |
| `add-screen <ruta>` | Pantalla con `AppScaffold`, estados vacío/error/carga, semantics y entrada en el router |
| `balance-sim <módulo>` | Ejecuta simulaciones (slot, combate, economía) y reporta métricas contra las tablas del GDD |
| `golden-update` | Regenera goldens y lista diferencias para revisión |
| `release-check` | Ejecuta format, analyze, tests, build debug y comprueba el checklist 23.3 |

### 25.6 Errores comunes de agentes y cómo evitarlos

| Problema | Prevención |
|---|---|
| Versiones o APIs obsoletas de paquetes | Pedir que consulte la documentación vigente y use `flutter pub add` |
| Lógica de juego en widgets | Regla explícita en AGENTS.md y revisión de PR |
| Aleatoriedad no testeable | `Rng` inyectado; prohibir `Random()` en dominio |
| Llamadas a red durante partidas | Offline-first, catálogo precargado |
| Tareas enormes e imprecisas | Usar la estructura de prompt 25.3 y tareas de 1–3 h |
| «Inventar» reglas | Regla 7: detenerse y preguntar |
| Secretos en el repo | `--dart-define-from-file` y `.gitignore` de `env/` |

---

## 26. Riesgos, decisiones abiertas y glosario

### 26.1 Riesgos

| Riesgo | Prob. | Impacto | Mitigación |
|---|---|---|---|
| Propiedad intelectual de Pokémon | Alta | Crítico | Capa `CreatureCatalog`; criaturas propias para publicar; sin monetización en modo fan |
| Regulación de azar / loot boxes | Media | Alto | Solo moneda del juego, probabilidades visibles, sin venta de tiradas |
| Alcance excesivo (25+ interfaces) | Alta | Alto | MVP en S12; PvP, guardería y gimnasios después; puntos stop/go |
| Dependencia de APIs externas | Media | Medio | Catálogo precompilado, caché, fallbacks |
| Rendimiento del overworld | Media | Medio | Pooling, atlas, perfilado temprano en gama baja |
| Balance de economía/slot | Alta | Medio | Tablas remotas, simulaciones, telemetría |
| Trampas en PvP/intercambios | Media | Alto | Servidor autoritativo, RLS, transacciones atómicas |
| Complejidad de sync | Media | Medio | Deltas para inventario, LWW para resto, pruebas de conflicto |
| Fatiga de contenido | Media | Medio | Biomas, eventos, élites, temporadas |
| Dependencia de un solo desarrollador | Media | Alto | Documentación (este archivo), ADRs, tareas pequeñas |

### 26.2 Decisiones abiertas (resolver antes de S1 salvo indicación)

1. **¿Pokémon (fan, no publicable) o criaturas propias (publicable)?** — Crítica; antes de S0.
2. ¿Monetización? (ninguna, anuncios opcionales, gemas cosméticas) — antes de S12.
3. ¿Turnos alternos o simultáneos en PvP? (recomendado: alternos) — antes de S15.
4. ¿Mazos por criatura o un mazo global del equipo? (el GDD base dice por criatura; considerar mazo único de 20–30 cartas para simplificar y reducir carga de gestión) — antes de S7.
5. ¿Captura solo tras vencer o también «debilitando»? (recomendado: ambas, con ventaja a debilitar) — antes de S3.
6. ¿Rive o Lottie para evolución? (Rive si hay diseñador; Lottie si hay recursos de librería) — antes de S9.
7. ¿Backend: Supabase o Firebase? (el GDD asume Supabase por consultas relacionales y RLS) — antes de S10.
8. Cantidad de criaturas en el MVP (50 / 151 / todas) — antes de S3.

### 26.3 Glosario

| Término | Significado |
|---|---|
| **B-Bot** | Oponente controlado por IA en el laberinto |
| **Nodo** | Casilla del laberinto con un evento |
| **Capa / nivel / profundidad** | Distancia recorrida; cada capa tiene 1–3 nodos |
| **Run** | Una partida del laberinto, de inicio a retirada o derrota |
| **Slot / Gachapon / Tragaperras** | Máquina de 3 carretes que decide encuentros y premios |
| **Match x2 / x3 / jackpot** | Dos o tres símbolos iguales en la línea activa |
| **Pity** | Garantía tras una racha sin premio |
| **Hold / Nudge** | Fijar un carrete / empujar un carrete una posición |
| **STAB** | Bonus de 1.5× si el ataque coincide con el tipo del atacante |
| **IV / EV** | Valores individuales (0–31) / de esfuerzo (0–252) |
| **Offline-first** | La app funciona con datos locales y sincroniza después |
| **RLS** | Seguridad por filas en la base de datos |
| **Servidor autoritativo** | El servidor decide el resultado; el cliente solo envía intenciones |
| **LWW** | *Last-write-wins*: gana la escritura más reciente |
| **ADR** | Registro de decisión de arquitectura |
| **Soft delete** | Marcar como borrado sin eliminar de inmediato (permite deshacer y sincronizar) |

### 26.4 Checklist de arranque (primera semana)

- [ ] Resolver decisión 26.2 (1).
- [ ] Crear repositorio y estructura (P-01).
- [ ] Generar catálogo con `seed_catalog` (P-04).
- [ ] Implementar y probar reglas de dominio (P-02).
- [ ] Prototipo del slot funcionando en el laboratorio (P-05, P-06).
- [ ] Reunir a 5 personas para el primer playtest del slot + combate.
- [ ] Configurar CI y proteger `main`.

---

*Fin del documento. Mantenerlo vivo: cada decisión relevante se registra como ADR y se refleja aquí.*
