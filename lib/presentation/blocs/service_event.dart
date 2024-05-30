
part of 'service_bloc.dart';

abstract class ServiceEvent  {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class AddServiceEvent extends ServiceEvent {
  final Service service;

  AddServiceEvent(this.service);

  @override
  List<Object> get props => [service];
}

class GetServicesEvent extends ServiceEvent {}

class SearchServicesEvent extends ServiceEvent {
  final String query;

  SearchServicesEvent(this.query);
}
