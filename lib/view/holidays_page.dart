import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';
import 'package:meuapp/controller/holiday_controller.dart';
import 'package:meuapp/model/holiday_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meuapp/view/drawer.dart';

class HolidayPage extends StatefulWidget {
  HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  late Future<List<HolidayEntity>> holidaysFuture;
  HolidayController controller = HolidayController();

  Future<List<HolidayEntity>> getHolidays() async {
    return await controller.getHolidayList();
  }

  @override
  void initState() {
    super.initState();
    holidaysFuture = getHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feriados"),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: holidaysFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Slidable(
                    child: ListTile(
                      title: Text(snapshot.data![index].name ?? ''),
                      leading: Text(controller.dateTimeToDateBR(snapshot.data![index].date ?? '')),
                      subtitle: Text(snapshot.data![index].type ?? ''),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
