part of 'constitution_bloc.dart';

@freezed
sealed class ConstitutionEvent with _$ConstitutionEvent {
  const factory ConstitutionEvent.get() = _Get;
  const factory ConstitutionEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
