import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/selection_circle.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/payment_step/card_sub_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionGroup extends StatelessWidget {
  final String label;
  final String method;
  final bool isSelected;
  final VoidCallback onTap;
  final List<CardSubItem> subItems;

  const PaymentOptionGroup({
    super.key,
    required this.label,
    required this.method,
    required this.isSelected,
    required this.onTap,
    required this.subItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              SelectionCircle(isSelected: isSelected),
              horizontalSpace(8),
              Text(
                label,
                style: TextStyles.font14DarkBlueMedium,
              ),
            ],
          ),
        ),
        if (subItems.isNotEmpty) ...[
          verticalSpace(16),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Column(
              children: subItems
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: item,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ],
    );
  }
}
