
enum GrowthRate2 { fast, mediumFast, mediumSlow, slow }

class ExperienceCurve {
  static int expForLevel(GrowthRate2 g, int n) => switch (g) {
        GrowthRate2.fast => (4 * n * n * n) ~/ 5,
        GrowthRate2.mediumFast => n * n * n,
        GrowthRate2.mediumSlow => ((6 * n * n * n) ~/ 5) - 15 * n * n + 100 * n - 140,
        GrowthRate2.slow => (5 * n * n * n) ~/ 4,
      };

  static int levelForExp(GrowthRate2 g, int exp) {
    var lvl = 1;
    while (lvl < 100 && expForLevel(g, lvl + 1) <= exp) {
      lvl++;
    }
    return lvl;
  }
}
