import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_full_screen_map_header.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/get_directions_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsFullScreenMap extends StatefulWidget {
  final LatLng location;
  final String title;
  final String address;

  const DoctorDetailsFullScreenMap({
    super.key,
    required this.location,
    required this.title,
    required this.address,
  });

  @override
  State<DoctorDetailsFullScreenMap> createState() =>
      _DoctorDetailsFullScreenMapState();
}

class _DoctorDetailsFullScreenMapState
    extends State<DoctorDetailsFullScreenMap> {
  late GoogleMapController _mapController;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = {
      Marker(
        markerId: const MarkerId('doctor_location'),
        position: widget.location,
        infoWindow: InfoWindow(
          title: widget.title,
          snippet: widget.address,
        ),
      ),
    };
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.location,
              zoom: 15.0,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            mapToolbarEnabled: true,
            compassEnabled: true,
          ),
          DoctorFullScreenMapHeader(
            title: widget.title,
            address: widget.address,
            onBackPressed: () => Navigator.pop(context),
          ),
          GetDirectionsButton(location: widget.location),
        ],
      ),
    );
  }
}
