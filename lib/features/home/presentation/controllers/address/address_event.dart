part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();
  @override
  List<Object> get props => [];
}

class AddAddressEvent extends AddressEvent {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  const AddAddressEvent({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });
}

class GetAddressesEvent extends AddressEvent {}


// class CurrentIndexEvent extends AddressEvent {
//   int currentIndex;
//   final int index;
//   CurrentIndexEvent({
//     required this.currentIndex,
//     required this.index,
//   });
// }