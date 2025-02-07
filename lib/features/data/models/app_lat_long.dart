class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({required this.lat, required this.long});
}

class ToshkentLocation extends AppLatLong {
  const ToshkentLocation({super.lat = 40.0974331, super.long = 65.3870281});
}
