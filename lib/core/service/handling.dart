



import 'failure.dart';

sealed class Result<S, F extends ServiceFailure> {
  const Result();
}

final class ServiceError<S, F extends ServiceFailure> extends Result<S, F> {
  final F error;

 const ServiceError({required this.error});
}

final class Succes<S, F extends ServiceFailure> extends Result<S, F> {
  final S data;

 const Succes({required this.data});
}
