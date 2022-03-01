import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import './repository/get_apis.dart';
import '../screens/curso_certo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curso Certo",
      home: Scaffold(
        body: FutureBuilder(// Chama a função que consome as API's e enquanto carrega os dados, exibe a tela de SplashScreen, retornando uma tela de erro se houver.
          future: getAPI(), // Função Future que consome as API's.
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar dados! <snapshotError>"),
              );
            }

            if (snapshot.hasData) { // Se houver sucesso no consumo das API's, retorna a Instância da Page principal que exibirá os Cards. *Passa como paâmetro, uma List com os dois EndPoints decodificados.
              return CursoCerto(apiS: snapshot.data);
            }

            return AnimatedSplashScreen(// 'Tela' de SplashScreen
              splash: Image.asset('images/logo_splash.png'),
              nextScreen: Center(),
              disableNavigation: true,
              backgroundColor: Colors.white,
              splashTransition: SplashTransition.slideTransition,
              splashIconSize: 200,
            );
          },
        ),
      ),
    );
  }
}
