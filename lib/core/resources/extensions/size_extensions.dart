
import 'package:movies_app/core/resources/extensions/responsive/responsive_service.dart';

extension SizeExtension on num {
  double get w => ResponsiveService.scaleWidth() * this;

  double get h => ResponsiveService.scaleHeight() * this;

  double get r => ResponsiveService.scaleRadius() * this;

  double get sp => ResponsiveService.scaleText() * this;
}