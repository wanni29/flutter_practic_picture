import 'package:flutter/material.dart';

// 기존에 있는 클래스를 들고와서 커스터 마이징 한 이후 내것으로 맞게 사용가능 : )
class CustomAnimatedRatingStars extends StatefulWidget {
  final double initialRating;
  final double minRating;
  final double maxRating;
  final Color filledColor;
  final Color emptyColor;
  final IconData customFilledIcon;
  final IconData customHalfFilledIcon;
  final IconData customEmptyIcon;
  final double starSize;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool readOnly;
  final ValueChanged<double>? onChanged;

  const CustomAnimatedRatingStars({
    Key? key,
    required this.initialRating,
    this.minRating = 0.0,
    this.maxRating = 5.0,
    required this.filledColor,
    required this.emptyColor,
    required this.customFilledIcon,
    required this.customHalfFilledIcon,
    required this.customEmptyIcon,
    this.starSize = 40.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomAnimatedRatingStarsState createState() =>
      _CustomAnimatedRatingStarsState();
}

class _CustomAnimatedRatingStarsState extends State<CustomAnimatedRatingStars>
    with SingleTickerProviderStateMixin {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _onStarTap(double rating) {
    if (!widget.readOnly) {
      setState(() {
        _rating = rating;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(rating);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        IconData icon;
        if (_rating >= index + 1) {
          icon = widget.customFilledIcon;
        } else if (_rating >= index + 0.5) {
          icon = widget.customHalfFilledIcon;
        } else {
          icon = widget.customEmptyIcon;
        }

        return GestureDetector(
          onTap: () => _onStarTap(index + 1.0),
          child: Icon(
            icon,
            color: icon == widget.customFilledIcon
                ? widget.filledColor
                : widget.emptyColor,
            size: widget.starSize, // 모든 아이콘의 크기를 starSize로 통일
          ),
        );
      }),
    );
  }
}
