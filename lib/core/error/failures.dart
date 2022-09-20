import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<dynamic> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
