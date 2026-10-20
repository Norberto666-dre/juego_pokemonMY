import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/pokedex/presentation/pokedex_screen.dart';
import '../../features/team/presentation/team_screen.dart';
import '../../features/deck/presentation/deck_screen.dart';
import '../../features/evolution/presentation/evolution_screen.dart';
import '../../features/shop/presentation/shop_screen.dart';
import '../../features/inventory/presentation/inventory_screen.dart';
import '../../features/overworld/presentation/overworld_screen.dart';
import '../../features/slot/presentation/slot_screen.dart';
import '../../features/battle/presentation/battle_screen.dart';
import '../../features/capture/presentation/capture_screen.dart';
import '../../features/pvp/presentation/pvp_screen.dart';
import '../../features/recycler/presentation/recycler_screen.dart';
import '../../features/daycare/presentation/daycare_screen.dart';
import '../../features/gyms/presentation/gyms_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
      GoRoute(path: '/pokedex', builder: (_, __) => const PokedexScreen()),
      GoRoute(path: '/team', builder: (_, __) => const TeamScreen()),
      GoRoute(path: '/deck', builder: (_, __) => const DeckScreen()),
      GoRoute(path: '/evolution', builder: (_, __) => const EvolutionScreen()),
      GoRoute(path: '/shop', builder: (_, __) => const ShopScreen()),
      GoRoute(path: '/inventory', builder: (_, __) => const InventoryScreen()),
      GoRoute(path: '/overworld', builder: (_, __) => const OverworldScreen()),
      GoRoute(path: '/slot', builder: (_, __) => const SlotScreen()),
      GoRoute(path: '/battle', builder: (_, __) => const BattleScreen()),
      GoRoute(path: '/capture', builder: (_, __) => const CaptureScreen()),
      GoRoute(path: '/pvp', builder: (_, __) => const PvpScreen()),
      GoRoute(path: '/recycler', builder: (_, __) => const RecyclerScreen()),
      GoRoute(path: '/daycare', builder: (_, __) => const DaycareScreen()),
      GoRoute(path: '/gyms', builder: (_, __) => const GymsScreen()),
      GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    ],
  );
});
