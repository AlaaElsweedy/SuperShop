part of 'address_bloc.dart';

class AddressState extends Equatable {
  final AddOrDeleteAddress? addAddress;
  final RequestState? addAddressState;
  final NetworkExceptions? addAddressErrorMessage;
  final GetAddress? getAddress;
  final RequestState getAddressState;
  final NetworkExceptions? getAddressErrorMessage;

  const AddressState({
    this.addAddress,
    this.addAddressState,
    this.addAddressErrorMessage,
    this.getAddress,
    this.getAddressState = RequestState.isLoading,
    this.getAddressErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      addAddress,
      addAddressState,
      addAddressErrorMessage,
      getAddress,
      getAddressState,
      getAddressErrorMessage,
    ];
  }

  AddressState copyWith({
    AddOrDeleteAddress? addAddress,
    RequestState? addAddressState,
    NetworkExceptions? addAddressErrorMessage,
    GetAddress? getAddress,
    RequestState? getAddressState,
    NetworkExceptions? getAddressErrorMessage,
  }) {
    return AddressState(
      addAddress: addAddress ?? this.addAddress,
      addAddressState: addAddressState ?? this.addAddressState,
      addAddressErrorMessage:
          addAddressErrorMessage ?? this.addAddressErrorMessage,
      getAddress: getAddress ?? this.getAddress,
      getAddressState: getAddressState ?? this.getAddressState,
      getAddressErrorMessage:
          getAddressErrorMessage ?? this.getAddressErrorMessage,
    );
  }
}
