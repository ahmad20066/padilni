import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';
import 'package:padilni/utils/colors.dart';

class TriangleButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFavorite;
  const TriangleButton(
      {super.key, required this.onTap, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              30.h,
              30.w,
            ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
          Positioned(
              top: 12.h,
              right: 8.w,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: Colors.red,
                size: 13.sp,
              ))
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1739577, size.height * 0.1133288);
    path_0.cubicTo(
        size.width * 0.7926536,
        size.height * 0.1658870,
        size.width * 0.8284000,
        size.height * 0.3739000,
        size.width * 0.9255500,
        size.height * 0.5524500);
    path_0.cubicTo(
        size.width * 0.8091000,
        size.height * 0.7960500,
        size.width * 0.3816500,
        size.height * 0.9657000,
        size.width * 0.1565000,
        size.height * 0.9148500);
    path_0.cubicTo(
        size.width * 0.0556500,
        size.height * 0.6941000,
        size.width * 0.0549892,
        size.height * 0.4351287,
        size.width * 0.1739577,
        size.height * 0.1133288);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(15, 49, 54, 57)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    canvas.drawShadow(path_0, Colors.grey, 1, false);
    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
