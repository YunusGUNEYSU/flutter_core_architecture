



import 'failure.dart';

sealed class Result<S, F extends ServiceFailure> {
  const Result();
}

final class ServiceError<S, F extends ServiceFailure> extends Result<S, F> {
  final F error;

  ServiceError({required this.error});
}

final class Succes<S, F extends ServiceFailure> extends Result<S, F> {
  final S data;

  Succes({required this.data});
}
// //!Example
// class Fetch {
//   ServiceResult<Model, ServiceFailure> fetcdata() async {
//     int d = 5;
//     try {
//       switch (d) {
//         case 3:
//           return Succes(data: Model(a: 5));
//         default:
//           return ServiceError(error: ServiceFailure('Service Failure'));
//       }
//     } on ServiceFailure catch (e) {
//       return ServiceError(error: e);
//     }
//   }
// }

// class Model implements IBaseModel<Model> {
//   int a;
//   Model({
//     required this.a,
//   });
  
//   @override
//   Model fromJson(Map<String, dynamic> json) {
//     // TODO: implement fromJson
//     throw UnimplementedError();
//   }
  
//   @override
//   Map<String, dynamic> toJson() {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
  
  
// }

// //!Usage
// void responseService()async {
//   final result =await Fetch().fetcdata();
//   switch (result) {
//     case Succes(data: final data):
//       print(data);

//     case Failure(error: final error):
//       print(error);
//   }
// }
