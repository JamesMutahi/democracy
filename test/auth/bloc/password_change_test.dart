import 'package:mocktail/mocktail.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/bloc/password_change/password_change_cubit.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group(PasswordChangeCubit, () {
    late PasswordChangeCubit passwordChangeCubit;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      passwordChangeCubit = PasswordChangeCubit(
        authRepository: mockAuthRepository,
      );
    });

    test('initial state is _Initial', () {
      expect(
        passwordChangeCubit.state,
        equals(const PasswordChangeState.initial()),
      );
    });

    blocTest(
      'emits page [_Changed] when changePassword is added',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.changePassword(
              token: 'test',
              oldPassword: 'test',
              newPassword1: 'test',
              newPassword2: 'test',
            )).thenAnswer((_) async {});
        return passwordChangeCubit;
      },
      act: (cubit) => cubit.changePassword(
        oldPassword: 'test',
        newPassword1: 'test',
        newPassword2: 'test',
      ),
      expect: () => [
        const PasswordChangeState.loading(),
        const PasswordChangeState.changed(),
      ],
    );
  });
}
