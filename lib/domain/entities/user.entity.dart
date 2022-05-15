import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? customerName;
  final String? customerPhone;

  const UserEntity({this.customerName, this.customerPhone});

  @override
  List<Object?> get props => [customerName, customerPhone];

  @override
  bool? get stringify => true;
}
