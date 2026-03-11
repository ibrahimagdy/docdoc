import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorMapPreviewWidget extends StatelessWidget {
  final LatLng location;
  final Set<Marker> markers;
  final Function(GoogleMapController) onMapCreated;
  final VoidCallback onTap;

  const DoctorMapPreviewWidget({
    super.key,
    required this.location,
    required this.markers,
    required this.onMapCreated,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              height: 258.h,
              child: AbsorbPointer(
                child: GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: location,
                    zoom: 15.0,
                  ),
                  markers: markers,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.fullscreen,
                    size: 16.sp,
                    color: Colors.grey[700],
                  ),
                  horizontalSpace(4),
                  Text(
                    'View full map',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
