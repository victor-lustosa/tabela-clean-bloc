import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/table_entity.dart';
import '../../domain/usecases/table_usecase.dart';

class TableBloc extends Bloc<TableEvent, TableState> {

  final TableUsecase useCase;

  TableBloc({required this.useCase})
      : super(LoadingState()) {
    on<GetEntitiesEvent>(_getEntities);
    on<YearFilterEvent>(_yearFilter);
    on<LoadingEvent>(_loading);
  }

  Future<void> _getEntities(GetEntitiesEvent event, emit) async {
    await emit.onEach<List<TableEntity>>(
      await useCase.getEntities(),
      onData: (entities) {
        emit(EntitiesFetchedState(entities: entities));
      },
      onError: (error, st) {
        emit(ExceptionState(error.toString()));
      },
    );
  }

  Future<void> _loading(_, emit) async {
    emit(LoadingState());
  }

  Future<void> _yearFilter(YearFilterEvent event, emit) async {
    List<TableEntity> filteredList = [];
    for(TableEntity entity in event.entitiesList){
      if(entity.year == event.year){
        filteredList.add(entity);
      }
    }
    emit(EntitiesFetchedState(entities: filteredList));
  }
}

@immutable
abstract class TableEvent {}

class LoadingEvent extends TableEvent {
  LoadingEvent();
}

class YearFilterEvent extends TableEvent {
  final int year;
  final List<TableEntity> entitiesList;
  YearFilterEvent({required this.year, required this.entitiesList});
}


class GetEntitiesEvent extends TableEvent {
  GetEntitiesEvent();
}

@immutable
abstract class TableState {}

class LoadingState extends TableState {
  LoadingState();
}

class ExceptionState extends TableState {
  final String message;
  ExceptionState(this.message);
}

class EntitiesFetchedState extends TableState {
  final List<TableEntity> entities;
  EntitiesFetchedState({required this.entities});
}
