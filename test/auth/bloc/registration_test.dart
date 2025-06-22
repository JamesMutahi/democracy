import 'package:mocktail/mocktail.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/registration/registration_cubit.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../objects.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group(RegistrationCubit, () {
    late RegistrationCubit registrationCubit;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      registrationCubit = RegistrationCubit(
        authRepository: mockAuthRepository,
      );
    });

    test('initial state is _Initial', () {
      expect(
        registrationCubit.state,
        equals(const RegistrationState.initial()),
      );
    });

    blocTest(
      'emits page [_Unverified] when register is added',
      build: () {
        when(() => mockAuthRepository.register(
              firstName: 'test',
              lastName: 'test',
              email: 'test',
              password: 'test',
              confirmPassword: 'test',
            )).thenAnswer((_) async => user1);
        when(() => mockAuthRepository.saveUserToSharedPreferences(user: user1))
            .thenAnswer((_) async {});
        return registrationCubit;
      },
      act: (cubit) => cubit.register(
        firstName: 'test',
        lastName: 'test',
        email: 'test',
        password: 'test',
        confirmPassword: 'test',
      ),
      expect: () => [
        const RegistrationState.loading(),
        const RegistrationState.unverified(),
      ],
    );

    blocTest(
      'emits page [_Unverified] when resendOTP is added',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.resendRegistrationOTP(token: 'test'))
            .thenAnswer((_) async {});
        return registrationCubit;
      },
      act: (cubit) => cubit.resendOTP(),
      expect: () => [
        const RegistrationState.loading(),
        const RegistrationState.unverified(),
      ],
    );

    blocTest(
      'emits page [_Verified] when verify is added',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.verifyRegistrationOTP(
              token: 'test',
              code: 'test',
            )).thenAnswer((_) async => user1);
        when(() => mockAuthRepository.saveUserToSharedPreferences(user: user1))
            .thenAnswer((_) async {});
        return registrationCubit;
      },
      act: (cubit) => cubit.verify(code: 'test'),
      expect: () => [
        const RegistrationState.loading(),
        const RegistrationState.verified(),
      ],
    );
  });
}
