import 'package:flutter/material.dart';
import 'package:table_module/table_module.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}

class AppModule extends Module {

  @override
  void routes(r) {
    r.module('/', module: TableModule());
  }
}
