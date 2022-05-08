// ignore_for_file: constant_identifier_names

const MAP_BOX_API =
    'pk.eyJ1Ijoic2FtdXJhaXgiLCJhIjoiY2wydnRlYnhwMDZlbDNwcWw3ZXBkc2F1cCJ9.Jr076mUI_5wplzFTtYWKZg';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/dark-v10/static/$longitude,$latitude,9.00,0,00/300x200?access_token=$MAP_BOX_API';
  }
}
