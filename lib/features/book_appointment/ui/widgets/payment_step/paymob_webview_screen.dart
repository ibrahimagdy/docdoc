import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebviewScreen extends StatefulWidget {
  final String iframeUrl;
  final VoidCallback onPaymentSuccess;
  final VoidCallback onPaymentFailed;

  const PaymobWebviewScreen({
    super.key,
    required this.iframeUrl,
    required this.onPaymentSuccess,
    required this.onPaymentFailed,
  });

  @override
  State<PaymobWebviewScreen> createState() => _PaymobWebviewScreenState();
}

class _PaymobWebviewScreenState extends State<PaymobWebviewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (url) {
            setState(() => _isLoading = false);
            _checkPaymentResult(url);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.iframeUrl));
  }

  void _checkPaymentResult(String url) {
    if (url.contains('success=true')) {
      widget.onPaymentSuccess();
    } else if (url.contains('success=false')) {
      widget.onPaymentFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  const CustomAppBar(
                    title: "Complete Payment",
                    showBackButton: false,
                  ),
                  verticalSpace(8),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading) const LoadingCircleIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
