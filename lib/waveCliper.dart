import 'package:flutter/material.dart';

/// Clip widget in wave shape shape
class WaveClipper extends CustomClipper<Path> {
  /// reverse the wave direction in vertical axis
  // bool reverse;

  /// flip the wave direction horizontal axis
  // bool flip;

  // WaveClipper({this.reverse = false, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    // path.lineTo(size.width, size.height - 50);

    path.quadraticBezierTo(
        size.width / 4, size.height - 70, size.width / 3, size.height - 50);

    path.quadraticBezierTo(size.width / 1.5 - (size.width / 160),
        size.height - 10, size.width / 1.5, size.height - 70);
    path.lineTo(size.width / 3, size.height - 60);
    path.quadraticBezierTo(size.width - (size.width / 1.5), size.height,
        size.width, size.height - 60);

    path.lineTo(size.width, 0);

    // if (!reverse && !flip) {
    //   print("1");
    //   Offset firstEndPoint = Offset(size.width / 3, size.height - 20);
    //   Offset firstControlPoint = Offset(size.width / 6, size.height - 58);
    //   var secondControlPoint =
    //       Offset(size.width - (size.width / 3.25), size.height);
    //   var secondEndPoint = Offset(size.width, size.height - 80);

    //   final path = Path()
    //     ..lineTo(0.0, size.height - 65)
    //     ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //         firstEndPoint.dx, firstEndPoint.dy)
    //     ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //         secondEndPoint.dx, secondEndPoint.dy)
    //     ..lineTo(size.width, 0.0)
    //     ..close();
    //   return path;
    // } else if (!reverse && flip) {
    //   print("2");
    //   Offset firstEndPoint = Offset(size.width * .5, size.height - 20);
    //   Offset firstControlPoint = Offset(size.width * .25, size.height - 10);
    //   Offset secondEndPoint = Offset(size.width, size.height);
    //   Offset secondControlPoint = Offset(size.width * .75, size.height - 30);

    //   final path = Path()
    //     ..lineTo(0.0, size.height - 30)
    //     ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //         firstEndPoint.dx, firstEndPoint.dy)
    //     ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //         secondEndPoint.dx, secondEndPoint.dy)
    //     ..lineTo(size.width, 0.0)
    //     ..close();
    //   return path;
    // } else if (reverse && flip) {
    //   print("3");
    //   Offset firstEndPoint = Offset(size.width * .5, 20);
    //   Offset firstControlPoint = Offset(size.width * .25, 10);
    //   Offset secondEndPoint = Offset(size.width, 0);
    //   Offset secondControlPoint = Offset(size.width * .75, 30);

    //   final path = Path()
    //     ..lineTo(0, 30)
    //     ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //         firstEndPoint.dx, firstEndPoint.dy)
    //     ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //         secondEndPoint.dx, secondEndPoint.dy)
    //     ..lineTo(size.width, size.height)
    //     ..lineTo(0.0, size.height)
    //     ..close();
    //   return path;
    // } else {
    //   print("4");
    //   Offset firstEndPoint = Offset(size.width * .5, 20);
    //   Offset firstControlPoint = Offset(size.width * .25, 30);
    //   Offset secondEndPoint = Offset(size.width, 50);
    //   Offset secondControlPoint = Offset(size.width * .75, 10);

    //   final path = Path()
    //     ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //         firstEndPoint.dx, firstEndPoint.dy)
    //     ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //         secondEndPoint.dx, secondEndPoint.dy)
    //     ..lineTo(size.width, size.height)
    //     ..lineTo(0.0, size.height)
    //     ..close();
    //   return path;
    // }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
