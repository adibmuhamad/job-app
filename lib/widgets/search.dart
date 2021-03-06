import 'package:flutter/material.dart';
import 'package:job_app/theme.dart';

class Search extends StatefulWidget {

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const Search({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final styleActive = blackTextStyle.copyWith(
      fontSize: 12
    );
    final styleHint = greyTextStyle.copyWith(
        fontSize: 12
    );
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
        border: Border.all(
            color: blackColor
        ),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 8
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
              Icons.search,
              color: greyColor
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(
                Icons.close,
                color: greyColor
            ),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
