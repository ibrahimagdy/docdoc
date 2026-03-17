import 'dart:async';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:doctors_app/features/home/ui/widgets/find_nearby/doctor_map_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindNearbyMap extends StatefulWidget {
  final List<DoctorData> doctors;

  const FindNearbyMap({super.key, required this.doctors});

  @override
  State<FindNearbyMap> createState() => _FindNearbyMapState();
}

class _FindNearbyMapState extends State<FindNearbyMap> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  String? _selectedDoctorId;

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  Future<void> _createMarkers() async {
    for (var doctor in widget.doctors) {
      final marker = await _createDoctorMarker(doctor);
      if (mounted) {
        setState(() {
          _markers.add(marker);
        });
      }
    }
  }

  Future<Marker> _createDoctorMarker(DoctorData doctor) async {
    final isSelected = _selectedDoctorId == doctor.id;
    final icon = await _createCustomMarkerIcon(
      doctor.profileImage,
      isSelected: isSelected,
    );

    return Marker(
      markerId: MarkerId(doctor.id),
      position: LatLng(doctor.latitude, doctor.longitude),
      icon: icon,
      onTap: () => _onMarkerTapped(doctor),
      anchor: const Offset(0.5, 0.5),
    );
  }

  Future<BitmapDescriptor> _createCustomMarkerIcon(
    String imageUrl, {
    bool isSelected = false,
  }) async {
    // Square markers: 50x50 normal, 80x80 selected
    final size = isSelected ? 100.0 : 50.0;
    const borderWidth = 4.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..isAntiAlias = true;

    // Draw shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final shadowRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 2, size, size),
      Radius.circular(12.r),
    );
    canvas.drawRRect(shadowRect, shadowPaint);

    // Draw white border (rounded square)
    paint.color = Colors.white;
    final outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size, size),
      Radius.circular(12.r),
    );
    canvas.drawRRect(outerRect, paint);

    // Create rounded square clip for image
    final innerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth,
        borderWidth,
        size - (borderWidth * 2),
        size - (borderWidth * 2),
      ),
      Radius.circular(8.r),
    );

    canvas.clipRRect(innerRect);

    // Try to load and draw the image
    try {
      final imageProvider = CachedNetworkImageProvider(imageUrl);
      final imageStream = imageProvider.resolve(const ImageConfiguration());
      final completer = Completer<ui.Image>();

      imageStream.addListener(ImageStreamListener((info, _) {
        completer.complete(info.image);
      }));

      final image = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => throw Exception('Timeout'),
      );

      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(
          borderWidth,
          borderWidth,
          size - (borderWidth * 2),
          size - (borderWidth * 2),
        ),
        image: image,
        fit: BoxFit.cover,
      );
    } catch (e) {
      // If image fails to load, draw a placeholder
      paint.color = Colors.blue;
      canvas.drawRect(
        Rect.fromLTWH(
          borderWidth,
          borderWidth,
          size - (borderWidth * 2),
          size - (borderWidth * 2),
        ),
        paint,
      );
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt() + 4, size.toInt() + 4);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.bytes(bytes);
  }

  void _onMarkerTapped(DoctorData doctor) async {
    setState(() {
      _selectedDoctorId = doctor.id;
    });

    // Recreate markers with updated selection state
    _markers.clear();
    for (var doc in widget.doctors) {
      final marker = await _createDoctorMarker(doc);
      setState(() {
        _markers.add(marker);
      });
    }

    // Animate camera to selected doctor
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(doctor.latitude, doctor.longitude),
      ),
    );

    // Show bottom sheet
    if (mounted) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => DoctorMapBottomSheet(doctor: doctor),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (widget.doctors.isNotEmpty) {
      // Calculate bounds to show all doctors
      double minLat = widget.doctors.first.latitude;
      double maxLat = widget.doctors.first.latitude;
      double minLng = widget.doctors.first.longitude;
      double maxLng = widget.doctors.first.longitude;

      for (var doctor in widget.doctors) {
        if (doctor.latitude < minLat) minLat = doctor.latitude;
        if (doctor.latitude > maxLat) maxLat = doctor.latitude;
        if (doctor.longitude < minLng) minLng = doctor.longitude;
        if (doctor.longitude > maxLng) maxLng = doctor.longitude;
      }

      final bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );

      controller.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 50),
      );
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doctors.isEmpty) {
      return const Center(
        child: Text('No doctors found'),
      );
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.doctors.first.latitude,
          widget.doctors.first.longitude,
        ),
        zoom: 12,
      ),
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: true,
    );
  }
}
