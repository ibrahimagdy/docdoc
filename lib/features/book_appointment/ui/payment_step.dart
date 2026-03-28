import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/paymob/paymob_manger.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/core/widgets/loading_circle_indicator.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/payment_step/card_sub_item.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/payment_step/payment_option_group.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/payment_step/paymob_webview_screen.dart';
import 'package:flutter/material.dart';

class PaymentStep extends StatefulWidget {
  const PaymentStep({super.key});

  @override
  State<PaymentStep> createState() => PaymentStepState();
}

class PaymentStepState extends State<PaymentStep> {
  String? _selectedMethod;
  bool _isLoading = false;

  final PaymobManger _paymobManger = PaymobManger();

  Future<void> proceedToPayment() async {
    if (_selectedMethod == null) return;

    setState(() => _isLoading = true);

    try {
      if (_selectedMethod == 'wallet') {
        await _paymobManger.payWithWallet(
          amountCents: 100,
          phone: '01010101010',
          firstName: 'Test',
          lastName: 'User',
          email: 'test@test.com',
        );

        if (!mounted) return;
        CustomSnackBar.showInfo(
            context, 'Check your phone for payment confirmation');
      } else {
        final iframeUrl = await _paymobManger.getIframeUrl(
          amountCents: 100,
          firstName: 'Test',
          lastName: 'User',
          email: 'test@test.com',
          phone: '01010101010',
        );

        if (!mounted) return;
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymobWebviewScreen(
              iframeUrl: iframeUrl,
              onPaymentSuccess: () {},
              onPaymentFailed: () {
                context.pop();
                CustomSnackBar.showError(
                    context, 'Payment failed, please try again');
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      CustomSnackBar.showError(context, 'Error: ${e.toString()}');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Option',
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        verticalSpace(24),
        PaymentOptionGroup(
          label: 'Credit Card',
          method: 'card',
          isSelected: _selectedMethod == 'card',
          onTap: () => setState(() => _selectedMethod = 'card'),
          subItems: _selectedMethod == 'card'
              ? const [
                  CardSubItem(
                    svgAsset: 'assets/svgs/mastercard.svg',
                    label: 'Master Card',
                  ),
                  CardSubItem(
                    svgAsset: 'assets/svgs/amex.svg',
                    label: 'American Express',
                  ),
                  CardSubItem(
                    svgAsset: 'assets/svgs/visa.svg',
                    label: 'Visa',
                  ),
                ]
              : const [],
        ),
        verticalSpace(16),
        PaymentOptionGroup(
          label: 'Mobile Wallet',
          method: 'wallet',
          isSelected: _selectedMethod == 'wallet',
          onTap: () => setState(() => _selectedMethod = 'wallet'),
          subItems: _selectedMethod == 'wallet'
              ? const [
                  CardSubItem(
                    svgAsset: 'assets/svgs/vodafone.svg',
                    label: 'Vodafone Cash',
                  ),
                  CardSubItem(
                    svgAsset: 'assets/svgs/orange.svg',
                    label: 'Orange Cash',
                  ),
                  CardSubItem(
                    svgAsset: 'assets/svgs/etisalat.svg',
                    label: 'e& money',
                  ),
                ]
              : const [],
        ),
        verticalSpace(16),
        if (_isLoading) ...[
          verticalSpace(24),
          const LoadingCircleIndicator(),
        ],
        verticalSpace(16),
      ],
    );
  }
}
