class FavoriteProverb {
  final int titleId;
  final int proverbId;

  FavoriteProverb(this.titleId, this.proverbId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoriteProverb &&
        other.titleId == titleId &&
        other.proverbId == proverbId;
  }

  @override
  int get hashCode => titleId.hashCode ^ proverbId.hashCode;
}
