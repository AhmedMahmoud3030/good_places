import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../helpers/location_helpers.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );

    setState(() {
      _previewImageUrl = staticMapUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          child: _previewImageUrl == null
              ? Text(
                  'no location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: _getCurrentUserLocation,
              textColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            FlatButton.icon(
              onPressed: () {},
              textColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
