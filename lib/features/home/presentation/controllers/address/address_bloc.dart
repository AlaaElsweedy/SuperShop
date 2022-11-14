import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/address/address.dart';
import '../../../domain/entities/address/get_address.dart';
import '../../../domain/usecases/add_address_usecase.dart';
import '../../../domain/usecases/delete_address_usecase.dart';
import '../../../domain/usecases/get_address_usecase.dart';
import '../../../domain/usecases/update_address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddAddressUseCase addAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;

  AddressBloc(
    this.addAddressUseCase,
    this.getAddressUseCase,
    this.updateAddressUseCase,
    this.deleteAddressUseCase,
  ) : super(const AddressState()) {
    on<AddAddressEvent>(_addAddress);
    on<GetAddressesEvent>(_getAddresses);
    on<UpdateAddressesEvent>(_updateAddress);
    on<DeleteAddressesEvent>(_deleteAddress);
  }

  FutureOr<void> _addAddress(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(const AddressState(addAddressState: RequestState.isLoading));

    final result = await addAddressUseCase(AddAddressUseCaseParameters(
      name: event.name,
      city: event.city,
      region: event.region,
      details: event.details,
      notes: event.notes,
    ));
    result.fold((l) {
      emit(AddressState(
        addAddressErrorMessage: l,
        addAddressState: RequestState.error,
      ));
    }, (r) {
      emit(AddressState(
        addAddress: r,
        addAddressState: RequestState.success,
      ));
      add(GetAddressesEvent());
    });
  }

  FutureOr<void> _getAddresses(
      GetAddressesEvent event, Emitter<AddressState> emit) async {
    final result = await getAddressUseCase(const NoParameters());
    result.fold((l) {
      emit(AddressState(
        getAddressErrorMessage: l,
        getAddressState: RequestState.error,
      ));
    }, (r) {
      emit(AddressState(
        getAddress: r,
        getAddressState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _updateAddress(
      UpdateAddressesEvent event, Emitter<AddressState> emit) async {
    emit(const AddressState(updateAddressState: RequestState.isLoading));

    final result = await updateAddressUseCase(
      UpdateAddressUseCaseParameters(
        addressId: event.addressId,
        name: event.name,
        city: event.city,
        region: event.region,
        details: event.details,
        notes: event.notes,
      ),
    );
    result.fold((l) {
      emit(AddressState(
        updateAddressErrorMessage: l,
        updateAddressState: RequestState.error,
      ));
    }, (r) {
      emit(AddressState(
        updateAddress: r,
        updateAddressState: RequestState.success,
      ));
      add(GetAddressesEvent());
    });
  }

  FutureOr<void> _deleteAddress(
      DeleteAddressesEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(deleteAddressState: RequestState.isLoading));

    final result = await deleteAddressUseCase(
      DeleteAddressUseCaseParameters(addressId: event.addressId),
    );
    result.fold((l) {
      emit(state.copyWith(
        deleteAddressErrorMessage: l,
        deleteAddressState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        deleteAddress: r,
        deleteAddressState: RequestState.success,
      ));
    });
    add(GetAddressesEvent());
  }
}
