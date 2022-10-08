import 'package:marina_mobility/core/constants.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Constants.empty;
    }else{
      return this!;
    }
  }
}

extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return Constants.zero;
    }else{
      return this!;
    }
  }
}

extension NonNullDouble on double?{
  double orZeroDouble(){
    if(this == null){
      return Constants.zeroDouble;
    }else{
      return this!;
    }
  }
}

extension NonNullBool on bool?{
  bool orFalse(){
    if(this == null){
      return false;
    }else{
      return this!;
    }
  }
}