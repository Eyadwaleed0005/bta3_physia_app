import 'package:bta3_physia/core/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class CoursesSearchField extends StatefulWidget {
  const CoursesSearchField({
    super.key,
    required this.initialQuery,
    required this.onChanged,
  });

  final String initialQuery;
  final void Function(String) onChanged;

  @override
  State<CoursesSearchField> createState() => _CoursesSearchFieldState();
}

class _CoursesSearchFieldState extends State<CoursesSearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialQuery,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      initialText: widget.initialQuery,
      hintText: 'ابحث عن كورس',
      onChanged: widget.onChanged,
    );
  }
}
