import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text.dart';

class DetailsDescription extends StatelessWidget {
  final String description;
  const DetailsDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          title: 'Description',
          color: AppColors.offWhite,
          fontSize: 30,
        ),
        const SizedBox(height: 10),
        TextWithShowMoreButton(
          maxLines: 3,
          text: description,
        ),
      ],
    );
  }
}

class TextWithShowMoreButton extends StatefulWidget {
  final String text;
  final int maxLines;

  const TextWithShowMoreButton({
    super.key,
    required this.text,
    required this.maxLines,
  });

  @override
  _TextWithShowMoreButtonState createState() => _TextWithShowMoreButtonState();
}

class _TextWithShowMoreButtonState extends State<TextWithShowMoreButton> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: AppColors.offWhite,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          maxLines: _showMore ? null : widget.maxLines,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _showMore = !_showMore;
            });
          },
          child: Text(
            _showMore == true ? '...Show less' : '...Show more',
            style: const TextStyle(
              color: AppColors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
