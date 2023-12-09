
import 'package:flutter/cupertino.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewPadding.bottom;
  
}
class SizeConfig {
  static double? height;
  static double? width;
  static double? size;
  static Orientation? orientation;
  static init(BuildContext context){
    height= MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    orientation= MediaQuery.of(context).orientation;
    size=orientation==Orientation.landscape?height!*.024:width!*.024;
  }
}