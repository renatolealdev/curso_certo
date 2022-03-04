import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import './repository/get_apis.dart';
import '../screens/curso_certo.dart';

/* 
  Obs: Esse projeto foi desenvolvido no período de Quinta-feira(24.02.2022) à Terça-feira(01.03.2022). Desde o início, até o final deste projeto, o Mundo vive uma triste realidade, um conflito armado entre Rússia e Ucrânia. Não quero, de modo algum, julgar qualquer das nações, mas, em homenagem a todo o povo Ucraniano, que está sofrendo uma restrição de liberdade e paz, só vista, outrora, na Segunda guerra Mundial, decidi por compor a paleta de cores deste projeto, com tons e sobre-tons das cores da bandeira nacional da Ucrânia. Sei que esse gesto não acabará com a guerra, muito menos trará à vida, àqueles que se foram no conflito, mas, que ao menos, cada vez que eu ou alguém abrir esse projeto (App), lembre-se dos envolvidos e, uma oração, reza, prece ou seja lá qual denominção usar para expressar e desejar o bem, seja feita. Isso sim, fará toda a diferença!
*/

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
        body: FutureBuilder(
          // Chama a função que consome as API's e enquanto carrega os dados, exibe a tela de SplashScreen, retornando uma tela de erro se houver.
          future: getAPI(), // Função Future que consome as API's.
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar dados! <snapshotError>"),
              );
            }

            if (snapshot.hasData) {
              // Se houver sucesso no consumo das API's, retorna a Instância da Page principal que exibirá os Cards. *Passa como paâmetro, uma List com os dois EndPoints decodificados.
              return CursoCerto(apiS: snapshot.data);
            }

            return AnimatedSplashScreen(
              // 'Tela' de SplashScreen
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