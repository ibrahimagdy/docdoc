import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/book_appointment/ui/widgets/date_and_time_step/date_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerCarousel extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerCarousel({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerCarousel> createState() => _DatePickerCarouselState();
}

class _DatePickerCarouselState extends State<DatePickerCarousel> {
  static const int _daysToShow = 5;
  static const int _maxDaysRange = 90;

  DateTime get _today => DateUtils.dateOnly(DateTime.now());

  late int _startOffset;

  @override
  void initState() {
    super.initState();
    _startOffset = _offsetFromDate(widget.selectedDate);
  }

  int _offsetFromDate(DateTime? date) {
    if (date == null) return 0;
    final difference = date.difference(_today).inDays;
    return difference.clamp(0, _maxDaysRange);
  }

  List<DateTime> _getVisibleDates() {
    return List.generate(
      _daysToShow,
      (index) => _today.add(Duration(days: _startOffset + index)),
    );
  }

  bool _isDateVisible(int offset) {
    return offset >= _startOffset && offset < _startOffset + _daysToShow;
  }

  void _syncOffsetIfNeeded(DateTime? selected) {
    if (selected == null) return;
    final selectedOffset = _offsetFromDate(selected);

    if (!_isDateVisible(selectedOffset)) {
      setState(() {
        _startOffset =
            (selectedOffset - (_daysToShow ~/ 2)).clamp(0, _maxDaysRange);
      });
    }
  }

  void _goToPreviousDay() {
    final selectedOffset = _offsetFromDate(widget.selectedDate);

    if (selectedOffset > 0) {
      final newOffset = selectedOffset - 1;
      final newDate = _today.add(Duration(days: newOffset));

      if (newOffset < _startOffset) {
        setState(() {
          _startOffset -= 1;
        });
      }

      widget.onDateSelected(newDate);
    }
  }

  void _goToNextDay() {
    final selectedOffset = _offsetFromDate(widget.selectedDate);
    final newOffset = selectedOffset + 1;
    final newDate = _today.add(Duration(days: newOffset));

    if (newOffset >= _startOffset + _daysToShow) {
      setState(() {
        _startOffset += 1;
      });
    }

    widget.onDateSelected(newDate);
  }

  @override
  void didUpdateWidget(DatePickerCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldDate = oldWidget.selectedDate;
    final newDate = widget.selectedDate;

    final areSameDay = oldDate != null &&
        newDate != null &&
        DateUtils.isSameDay(oldDate, newDate);

    if (!areSameDay) {
      _syncOffsetIfNeeded(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleDates = _getVisibleDates();
    final selectedOffset = _offsetFromDate(widget.selectedDate);
    final canGoBack = widget.selectedDate != null && selectedOffset > 0;

    return Row(
      children: [
        InkWell(
          onTap: canGoBack ? _goToPreviousDay : null,
          child: Icon(
            Icons.chevron_left,
            color: canGoBack ? ColorManger.darkBlue : ColorManger.grey,
            size: 24.sp,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 62.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: visibleDates.length,
              itemBuilder: (context, index) {
                final date = visibleDates[index];
                final isSelected = widget.selectedDate != null &&
                    DateUtils.isSameDay(date, widget.selectedDate!);
                return DateItem(
                  date: date,
                  isSelected: isSelected,
                  onTap: () => widget.onDateSelected(date),
                );
              },
            ),
          ),
        ),
        InkWell(
          onTap: _goToNextDay,
          child: Icon(
            Icons.chevron_right,
            color: ColorManger.darkBlue,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
