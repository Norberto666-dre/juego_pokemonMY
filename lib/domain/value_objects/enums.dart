enum PokeType {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

enum MoveCategory { physical, special, status }

enum StatusCondition { none, burn, poison, paralysis, freeze, sleep, confusion }

enum Rarity { common, uncommon, rare, epic, legendary }

enum ItemCategory {
  ball,
  healing,
  vitamin,
  xstat,
  held,
  evolution,
  shortcut,
  ticket,
  material
}

enum NodeType { battle, chest, shop, cave, boss, rest, secret, gym, event }

enum Biome { forest, cave, volcano, ocean, mountain, desert }

enum SlotContext { encounter, chest, secret, shop }

enum SlotOutcome { match2, match3, miss }

enum StorageKind { team, pc, daycare }

enum BattlePhase { start, playerTurn, enemyTurn, resolving, switching, ended }
