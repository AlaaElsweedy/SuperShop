import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/home/domain/entities/home.model.dart';
import 'package:supershop/home/domain/usecases/get_home_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetHomeDataUseCase getHomeDataUseCase;

  HomeBloc(this.getHomeDataUseCase) : super(const InitialState()) {
    on<GetHomeDataEvent>(_homeData);
  }

  FutureOr<void> _homeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const LoadingState());

    final result = await getHomeDataUseCase(const NoParameters());
    result.fold((l) {
      emit(HomeState.error(l));
    }, (r) {
      emit(HomeState.success(r));
    });
  }
}
