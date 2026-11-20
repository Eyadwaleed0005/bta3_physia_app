import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    this.initialText = '',
    this.hintText = 'ابحث...',
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String initialText;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void didUpdateWidget(CustomSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      if (_ownsController) {
        _controller.dispose();
      }
      _initializeController();
      return;
    }

    if (_ownsController &&
        oldWidget.initialText != widget.initialText &&
        _controller.text != widget.initialText) {
      _controller.text = widget.initialText;
    }
  }

  void _initializeController() {
    _ownsController = widget.controller == null;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textDirection: TextDirection.rtl,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: ColorPalette.accent,
      style: AppTextStyle.font14CreamRegularTajawal(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: AppTextStyle.font14TextMutedRegularTajawal(),
        filled: true,
        fillColor: ColorPalette.fieldFill,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 22.r,
          color: ColorPalette.teal200,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 46.w, minHeight: 46.w),
        enabledBorder: _border(ColorPalette.fieldBorder),
        focusedBorder: _border(ColorPalette.teal200),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: color, width: 1.w),
    );
  }
}
