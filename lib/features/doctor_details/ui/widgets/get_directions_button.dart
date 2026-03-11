import 'dart:io';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GetDirectionsButton extends StatelessWidget {
  final LatLng location;

  const GetDirectionsButton({
    super.key,
    required this.location,
  });

  Future<void> _openGoogleMaps() async {
    // For Android: Use Google Maps app directly with navigation
    if (Platform.isAndroid) {
      final Uri googleMapsUrl = Uri.parse(
        'google.navigation:q=${location.latitude},${location.longitude}&mode=d',
      );

      if (await canLaunchUrl(googleMapsUrl)) {
        await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
        return;
      }

      // Fallback to web URL
      final Uri webUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}',
      );
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      }
    }
    // For iOS: Use the web URL that works well
    else if (Platform.isIOS) {
      final Uri mapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=${location.latitude},${location.longitude}',
      );

      if (await canLaunchUrl(mapsUrl)) {
        await launchUrl(mapsUrl, mode: LaunchMode.externalApplication);
      }
    }
    // Fallback for other platforms
    else {
      final Uri webUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}',
      );
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.h,
      left: 16.w,
      right: 16.w,
      child: SafeArea(
        child: AppTextButton(
          text: 'Get Directions',
          onPressed: _openGoogleMaps,
        ),
      ),
    );
  }
}
