import 'package:mocktail/mocktail.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/bloc/password_reset/password_reset_cubit.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../objects.dart';


class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group(PasswordResetCubit, () {
    late PasswordResetCubit passwordResetCubit;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      passwordResetCubit = PasswordResetCubit(
        authRepository: mockAuthRepository,
      );
    });

    test('initial state is _Initial', () {
      expect(
        passwordResetCubit.state,
        equals(const PasswordResetState.initial()),
      );
    });

    blocTest(
      'emits page [_EmailVerified] when verifyEmail is added',
      build: () {
        when(() => mockAuthRepository.verifyEmail(email: 'test'))
            .thenAnswer((_) async {});
        when(() => mockAuthRepository.holdEmail(email: 'test'))
            .thenAnswer((_) async {});
        return passwordResetCubit;
      },
      act: (cubit) => cubit.verifyEmail(email: 'test'),
      expect: () => [
        const PasswordResetState.loading(),
        const PasswordResetState.emailVerified(email: 'test'),
      ],
    );

    blocTest(
      'emits page [_CodeVerified] when verifyCode is added',
      build: () {
        when(() => mockAuthRepository.getEmail())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.verifyPasswordResetOTP(
            code: 'test', email: 'test')).thenAnswer((_) async => user1);
        when(() => mockAuthRepository.saveUserToSharedPreferences(user: user1))
            .thenAnswer((_) async => user1);
        return passwordResetCubit;
      },
      act: (cubit) => cubit.verifyCode(code: 'test'),
      expect: () => [
        const PasswordResetState.loading(),
        const PasswordResetState.codeVerified(),
      ],
    );

    blocTest(
      'emits page [_EmailVerified] when resendOTP is added',
      build: () {
        when(() => mockAuthRepository.getEmail())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.verifyEmail(email: 'test'))
            .thenAnswer((_) async {});
        return passwordResetCubit;
      },
      act: (cubit) => cubit.resendOTP(),
      expect: () => [
        const PasswordResetState.loading(),
        const PasswordResetState.emailVerified(email: 'test'),
      ],
    );

    blocTest(
      'emits page [_EmailVerified] when resendOTP is added',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.resetPassword(
              token: 'test',
              password1: 'test',
              password2: 'test',
            )).thenAnswer((_) async {});
        return passwordResetCubit;
      },
      act: (cubit) => cubit.resetPassword(password1: 'test', password2: 'test'),
      expect: () => [
        const PasswordResetState.loading(),
        const PasswordResetState.resetComplete(),
      ],
    );
  });
}
