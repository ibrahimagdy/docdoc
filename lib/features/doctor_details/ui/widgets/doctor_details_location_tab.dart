import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/features/doctor_details/data/models/doctor_details_response.dart';
import 'package:doctors_app/features/doctor_details/ui/widgets/doctor_map_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsLocationTab extends StatefulWidget {
  final DoctorDetailsData doctorDetails;
  const DoctorDetailsLocationTab({super.key, required this.doctorDetails});

  @override
  State<DoctorDetailsLocationTab> createState() =>
      _DoctorDetailsLocationTabState();
}

class _DoctorDetailsLocationTabState extends State<DoctorDetailsLocationTab> {
  late GoogleMapController _mapController;
  late LatLng _doctorLocation;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _doctorLocation = LatLng(
      widget.doctorDetails.latitude,
      widget.doctorDetails.longitude,
    );
    _setMarker();
  }

  void _setMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('doctor_location'),
        position: _doctorLocation,
        infoWindow: InfoWindow(
          title: widget.doctorDetails.fullName,
          snippet: widget.doctorDetails.address,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _openFullScreenMap() {
    context.pushNamed(
      Routes.doctorDetailsFullScreenMap,
      arguments: {
        'location': _doctorLocation,
        'title': widget.doctorDetails.fullName,
        'address': widget.doctorDetails.address,
      },
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Practice Place',
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(12),
          Text(
            widget.doctorDetails.address,
            style: TextStyles.font14GreyRegular,
          ),
          verticalSpace(18),
          Text(
            'Location Map',
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(12),
          DoctorMapPreviewWidget(
            location: _doctorLocation,
            markers: _markers,
            onMapCreated: _onMapCreated,
            onTap: _openFullScreenMap,
          ),
        ],
      ),
    );
  }
}
