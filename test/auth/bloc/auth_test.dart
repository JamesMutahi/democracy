import 'package:mocktail/mocktail.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../objects.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group(AuthBloc, () {
    late AuthBloc authBloc;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authBloc = AuthBloc(
        authRepository: mockAuthRepository,
      );
    });

    test('initial state is _Unauthenticated', () {
      expect(
        authBloc.state,
        equals(const AuthState.unAuthenticated()),
      );
    });

    blocTest(
      'emits page [_Unauthenticated] when authenticate is added without token',
      build: () {
        when(() => mockAuthRepository.getToken()).thenAnswer((_) async => '');
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.authenticate()),
      expect: () => [
        const AuthState.authenticating(),
        const AuthState.unAuthenticated(),
      ],
    );

    blocTest(
      'emits page [_Authenticated] when authenticate is added with token',
      build: () {
        when(() => mockAuthRepository.getToken())
            .thenAnswer((_) async => 'test');
        when(() => mockAuthRepository.getUserFromSharedPreferences())
            .thenAnswer((_) async => user1);
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.authenticate()),
      expect: () => [
        const AuthState.authenticating(),
        AuthState.authenticated(user: user1),
      ],
    );
  });
}
