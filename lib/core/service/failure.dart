// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IFailure {}

class ServiceFailure extends IFailure {
  String? message;

  ServiceFailure({this.message});
  @override
  String toString() => message.toString();
}
