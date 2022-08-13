import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:guarana_mania/utils/extensions.dart';

import '../../global/color_global.dart';
import '../../model/pedidos.dart';

class HomeRelatorio extends StatefulWidget {
  const HomeRelatorio({Key? key}) : super(key: key);

  @override
  State<HomeRelatorio> createState() => _HomeRelatorioState();
}

class _HomeRelatorioState extends State<HomeRelatorio> {
  DateTime inicio = DateTime.now().start;
  DateTime fim = DateTime.now().end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Vendas Total'),
        centerTitle: true,
        backgroundColor: ColorGlobal.colorsbackground,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final value = await chooseDate(context, inicio);
                  if (value != null) {
                    setState(() => inicio = value.start);
                  }
                },
                child: Text('Inicio: ${inicio.dataFormatted}'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final value = await chooseDate(context, fim);
                  if (value != null) {
                    setState(() => fim = value.end);
                  }
                },
                child: Text('Final: ${fim.dataFormatted}'),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('pedidos').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar vendas'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final vendas = snapshot.data?.docs ?? [];
                if (vendas.isEmpty) {
                  return const Center(child: Text('Nenhuma venda encontrada'));
                }
                final vendasFiltradas = vendas
                    .map((e) => Pedidos.fromJson(e.data()))
                    .where(
                        (p) => p.data.isAfter(inicio) && p.data.isBefore(fim))
                    .toList();
                final total = vendasFiltradas.fold<double>(
                    0.0, (total, e) => total + e.total);
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: vendasFiltradas.length,
                        itemBuilder: (_, index) {
                          final pedido = vendasFiltradas[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Card(
                              child: ExpansionTile(
                                title: Text(pedido.nome.isEmpty
                                    ? 'Nenhuma informação'
                                    : pedido.nome),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pedido.pagamento),
                                    Text(pedido.data.dataFormatted),
                                  ],
                                ),
                                trailing: Text(pedido.total.formatted),
                                children: [
                                  for (final item in pedido.produtos)
                                    ListTile(
                                      leading: Text(item.unitario.formatted),
                                      title: Center(child: Text(item.nome)),
                                      trailing:
                                          Text(item.qtde.toInt().toString()),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total: ${total.formatted}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<DateTime?> chooseDate(BuildContext context, DateTime initial) {
  return showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: DateTime(2000),
    lastDate: DateTime.now().start.add(const Duration(days: 30)),
  );
}