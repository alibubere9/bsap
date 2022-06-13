class Distance {
  static String convertToDistanceString(num distance) {
    double distanceDouble = distance.toDouble() / 1000;
    int distanceInt = distance.toInt();
    if (distanceInt <= 1000) {
      return '${distanceInt}M';
    }
    return '${distanceDouble.toStringAsFixed(1)}KM';
  }
}
