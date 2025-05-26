import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            switch (state) {
              case Authenticated():
                return ListTile(title: Text('Logout'));
              case Unauthenticated():
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  title: Text('Login'),
                );
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
