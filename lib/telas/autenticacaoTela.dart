import 'package:apptravelsafe/_comum/meuSnackBar.dart';
import 'package:apptravelsafe/_comum/minhasCores.dart';
import 'package:apptravelsafe/componentes/decoracaoCampoAutenticacao.dart';
import 'package:apptravelsafe/servicos/autenticacaoServico.dart';
import 'package:flutter/material.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.azulTopoGradiente,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/logo1.png",
                        height: 254,
                      ),
                      const Text(
                        "Travel Safe",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Caveat",
                            fontSize: 54,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("Email:"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não foi preenchido.";
                          }
                          if (value.length < 6) {
                            return "O e-mail é muito curto";
                          }
                          if (value.contains("!@")) {
                            return "E-mail inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha:"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não foi preenchida.";
                          }
                          if (value.length < 6) {
                            return "A senha deverá ter no mínimo 6 caracteres.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirme Senha:"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "Confirmar a senha.";
                                }
                                if (value.length < 6) {
                                  return "A senha deverá ter no mínimo 6 caracteres.";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nomeController,
                              decoration:
                                  getAuthenticationInputDecoration("Nome:"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não foi preenchido.";
                                }
                                return null;
                              },
                            ),
                            /*
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Sobrenome:"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O Sobrenome não foi preenchido.";
                                }
                                return null;
                              },
                            ),*/
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _cpfController,
                              decoration:
                                  getAuthenticationInputDecoration("CPF:"),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "(DDD) + Telefone:"),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration:
                                  getAuthenticationInputDecoration("País:"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O país não foi preenchido.";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MinhasCores.azul4),
                        child: Text(
                          (queroEntrar) ? "Entrar" : "Cadastrar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text(
                          (queroEntrar)
                              ? "Nova por aqui? Cadastrer-se agora."
                              : "Já tem uma conta? Entre!",
                          style: TextStyle(color: MinhasCores.azul4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    String cpf = _cpfController.text;
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada.");
        _autenServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
              if(erro != null){
                mostrarSnackBar(context: context, texto: erro);
              }
        });
      } else {
        print("Cadastro Validado.");
        print(
            "${_emailController.text},${_senhaController.text},${_nomeController.text},${_cpfController.text}");
        _autenServico
            .cadastrarUsuario(nome: nome, senha: senha, email: email, cpf: cpf)
            .then((String? erro) {
          if (erro != null) {
            //Erro
            mostrarSnackBar(context: context, texto: erro);
          } else {
            //Deu certo
            mostrarSnackBar(
                context: context,
                texto: "Cadastro efetuado com sucesso.",
                isErro: false);
          }
        });
      }
    } else {
      print("Inválido");
    }
  }
}
