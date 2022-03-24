import 'package:flutter/material.dart';
import '../blocs/login_block.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.business,
                    color: Colors.tealAccent,
                    size: 160,
                  ),
                  InputField(
                    icon: Icons.person,
                    hint: 'Usuário',
                    stream: _loginBloc.outEmail,
                    onChanged: _loginBloc.changeEmail,
                  ),
                  InputField(
                    icon: Icons.lock_outline,
                    hint: 'Senha',
                    obscure: true,
                    stream: _loginBloc.outPassword,
                    onChanged: _loginBloc.changePassword,
                  ),
                  SizedBox(height: 32),
                  StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                child: Text("Entrar",
                                    style: TextStyle(color: Colors.blueGrey)),
                                onPressed: snapshot.hasData ? () {} : null,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.tealAccent,
                                )));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
