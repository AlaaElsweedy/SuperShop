part of 'address_bloc.dart';

class AddressState extends Equatable {
  final Address? addAddress;
  final RequestState? addAddressState;
  final NetworkExceptions? addAddressErrorMessage;
  final GetAddress? getAddress;
  final RequestState getAddressState;
  final NetworkExceptions? getAddressErrorMessage;
  final Address? updateAddress;
  final RequestState? updateAddressState;
  final NetworkExceptions? updateAddressErrorMessage;
  final Address? deleteAddress;
  final RequestState? deleteAddressState;
  final NetworkExceptions? deleteAddressErrorMessage;

  const AddressState({
    this.addAddress,
    this.addAddressState,
    this.addAddressErrorMessage,
    this.getAddress,
     this.getAddressState = RequestState.isLoading,
    this.getAddressErrorMessage,
    this.updateAddress,
     this.updateAddressState,
    this.updateAddressErrorMessage,
    this.deleteAddress,
    this.deleteAddressState,
    this.deleteAddressErrorMessage,
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
      updateAddress,
      updateAddressState,
      updateAddressErrorMessage,
      deleteAddress,
      deleteAddressState,
      deleteAddressErrorMessage,
    ];
  }

  AddressState copyWith({
    Address? addAddress,
    RequestState? addAddressState,
    NetworkExceptions? addAddressErrorMessage,
    GetAddress? getAddress,
    RequestState? getAddressState,
    NetworkExceptions? getAddressErrorMessage,
    Address? updateAddress,
    RequestState? updateAddressState,
    NetworkExceptions? updateAddressErrorMessage,
    Address? deleteAddress,
    RequestState? deleteAddressState,
    NetworkExceptions? deleteAddressErrorMessage,
  }) {
    return AddressState(
      addAddress: addAddress ?? this.addAddress,
      addAddressState: addAddressState ?? this.addAddressState,
      addAddressErrorMessage: addAddressErrorMessage ?? this.addAddressErrorMessage,
      getAddress: getAddress ?? this.getAddress,
      getAddressState: getAddressState ?? this.getAddressState,
      getAddressErrorMessage: getAddressErrorMessage ?? this.getAddressErrorMessage,
      updateAddress: updateAddress ?? this.updateAddress,
      updateAddressState: updateAddressState ?? this.updateAddressState,
      updateAddressErrorMessage: updateAddressErrorMessage ?? this.updateAddressErrorMessage,
      deleteAddress: deleteAddress ?? this.deleteAddress,
      deleteAddressState: deleteAddressState ?? this.deleteAddressState,
      deleteAddressErrorMessage: deleteAddressErrorMessage ?? this.deleteAddressErrorMessage,
    );
  }
}
