part of 'area.dart';

String calculateAreaReact(double width, double height) {
  double result = width * height;
  final formatter = NumberFormat('#.####');
  return formatter.format(result);
}
