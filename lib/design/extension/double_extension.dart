import '../../helper/size_helper.dart';

extension DoubleExtension on double {
  double get w => this * SizeConfig.width;
  double get h => this * SizeConfig.height;
}
