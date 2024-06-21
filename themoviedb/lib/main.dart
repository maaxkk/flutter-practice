import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1.0)),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(body: Center(child: Text('Error happened 404')));
        });
      },
    );
  }
}

// class ExampleWidget extends StatefulWidget {
//   const ExampleWidget({super.key});
//
//   @override
//   State<ExampleWidget> createState() => _MainScreenWidgetState();
// }
//
// class _MainScreenWidgetState extends State<ExampleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//           title: Text(
//             'TMDB2',
//             style: TextStyle(color: Color.fromRGBO(232, 230, 227, 1.0)),
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Pop from stack'),
//           ),
//         ));
//   }
// }
