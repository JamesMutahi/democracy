import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:democracy/app/auth/bloc/otp_counter/otp_counter_bloc.dart';

void main() {
  group(OTPCounterBloc, () {
    late OTPCounterBloc otpCounterBloc;

    setUp(() {
      otpCounterBloc = OTPCounterBloc();
    });

    test('initial state is _Initial', () {
      expect(
        otpCounterBloc.state,
        equals(const OTPCounterState.initial()),
      );
    });

    blocTest(
      'emits [_Running] when started is added',
      build: () => otpCounterBloc,
      act: (bloc) => bloc.add(const OTPCounterEvent.started()),
      expect: () => [
        const OTPCounterState.running(Duration(seconds: 1)),
        const OTPCounterState.expired('test'),
      ],
    );
  });
}
