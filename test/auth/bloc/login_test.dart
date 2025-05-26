import 'package:mocktail/mocktail.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/bloc/login/login_cubit.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../objects.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group(LoginCubit, () {
    late LoginCubit loginCubit;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      loginCubit = LoginCubit(
        authRepository: mockAuthRepository,
      );
    });

    test('initial state is _Initial', () {
      expect(
        loginCubit.state,
        equals(const LoginState.initial()),
      );
    });

    blocTest(
      'emits page [_LoggedIn] when login is added',
      build: () {
        when(() => mockAuthRepository.login(email: 'test', password: 'test'))
            .thenAnswer((_) async => user1);
        when(() => mockAuthRepository.saveUserToSharedPreferences(user: user1))
            .thenAnswer((_) async => user1);
        return loginCubit;
      },
      act: (cubit) => cubit.login(email: 'test', password: 'test'),
      expect: () => [
        const LoginState.loading(),
        const LoginState.loggedIn(),
      ],
    );

    blocTest(
      'emits page [_LoggedOut] when logout is added',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.logout(token: 'test'))
            .thenAnswer((_) async => user1);
        when(() => mockAuthRepository.deleteToken()).thenAnswer((_) async {});
        when(() => mockAuthRepository.deleteUser()).thenAnswer((_) async {});
        return loginCubit;
      },
      act: (cubit) => cubit.logout(),
      expect: () => [
        const LoginState.loading(),
        const LoginState.loggedOut(),
      ],
    );
  });
}
