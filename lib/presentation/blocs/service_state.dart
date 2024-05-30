
part of 'service_bloc.dart';

abstract class ServiceState {
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final List<Service> services;

  ServiceLoaded(this.services);

  @override
  List<Object> get props => [services];
}

class ServiceAdded extends ServiceState {}

class ServiceError extends ServiceState {
  final String message;

  ServiceError(this.message);

  @override
  List<Object> get props => [message];
}
