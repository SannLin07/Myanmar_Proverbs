//!proverb Class
class Proverb {
  int titleId;
  int proverbId;
  String proverbName;
  String proverbDesp;
  bool isFavorite;

  Proverb({
    required this.titleId,
    required this.proverbId,
    required this.proverbName,
    required this.proverbDesp,
    this.isFavorite = false,
  });

   factory Proverb.fromJson(Map<String, dynamic> json) {
    return Proverb(
      titleId: json['TitleId'] ?? 0,
      proverbId: json['ProverbId'] ?? 0,
      proverbName: json['ProverbName'] ?? '',
      proverbDesp: json['ProverbDesp'] ?? '',
    );
  }
 
}

