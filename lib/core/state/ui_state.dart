import 'package:equatable/equatable.dart';

sealed class UiState extends Equatable {}

class UiStateNone extends UiState {
  @override
  List<Object?> get props => [];
}

class UiStateLoading extends UiState {
  @override
  List<Object?> get props => [];
}

class UiStateError extends UiState {
  final String error;

  UiStateError(this.error);

  @override
  List<Object?> get props => [error];
}

class UiStateSuccess<T> extends UiState {
  final T data;

  UiStateSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
