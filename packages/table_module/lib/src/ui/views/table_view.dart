import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/table_entity.dart';
import '../reactivity/table_bloc.dart';

class TableListView extends StatefulWidget {
  const TableListView({super.key});

  @override
  State<TableListView> createState() => _TableListViewState();
}

class _TableListViewState extends State<TableListView> {
  late List<TableEntity> tableFetched;
  late final TableBloc bloc;
  bool isSelected = false;
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<TableBloc>();
    bloc.add(GetEntitiesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TableBloc, TableState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EntitiesFetchedState) {
            tableFetched = state.entities;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: const Text("Tabela de dados")),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: tableFetched.length,
                      itemBuilder: (__, index) {
                        return ListTile(
                          title: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 30),
                                child: Text(
                                  tableFetched[index].position,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'mês: ${tableFetched[index].month}',
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 40),
                                    child: Text(
                                      'ano: ${tableFetched[index].year}',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'numero de ocupados: ${tableFetched[index].numberOfOccupied}',
                              ),
                              Text(
                                'numero de vagas: ${tableFetched[index].numberOfVacancies}',
                              ),
                              Text(
                                'entrancia: ${tableFetched[index].entrancia}',
                              ),
                              Text(
                                'entrancia: ${tableFetched[index].speciality}',
                              ),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state is ExceptionState) {
            return Text(state.message);
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}
