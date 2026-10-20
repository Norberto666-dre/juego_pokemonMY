import '../value_objects/enums.dart';

class TypeChart {
  TypeChart(this._table);
  final Map<PokeType, Map<PokeType, double>> _table;

  double multiplier(PokeType atk, PokeType def) => _table[atk]?[def] ?? 1.0;

  double against(PokeType atk, List<PokeType> defTypes) =>
      defTypes.fold(1.0, (m, d) => m * multiplier(atk, d));

  // La carga desde assets se hace en la capa de datos.
}
