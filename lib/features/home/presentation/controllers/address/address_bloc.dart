import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/address/add_or_delete_address.dart';
import 'package:supershop/features/home/domain/entities/address/get_address.dart';
import 'package:supershop/features/home/domain/usecases/add_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddAddressUseCase addAddressUseCase;
  final GetAddressUseCase getAddressUseCase;

  AddressBloc(
    this.addAddressUseCase,
    this.getAddressUseCase,
  ) : super(const AddressState()) {
    on<AddAddressEvent>(_addAddress);
    on<GetAddressesEvent>(_getAddresses);
  }

  FutureOr<void> _addAddress(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(addAddressState: RequestState.isLoading));

    final result = await addAddressUseCase(AddAddressUseCaseParameters(
      name: event.name,
      city: event.city,
      region: event.region,
      details: event.details,
      notes: event.notes,
    ));
    result.fold((l) {
      emit(state.copyWith(
        addAddressErrorMessage: l,
        addAddressState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
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
      emit(state.copyWith(
        getAddressErrorMessage: l,
        getAddressState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getAddress: r,
        getAddressState: RequestState.success,
      ));
    });
  }
}
