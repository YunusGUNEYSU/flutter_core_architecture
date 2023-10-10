
// import 'package:responsive_design/core/model/base_model.dart';
// import 'package:responsive_design/core/service/failure.dart';
// import 'package:responsive_design/core/service/handling.dart';

import 'package:flutter_core/core/service/handling.dart';

import '../service/failure.dart';


typedef ServicePost<bool>=Future<Result<bool,ServiceFailure>>;
typedef ServiceGet<R>=Future<Result<R,ServiceFailure>>;
