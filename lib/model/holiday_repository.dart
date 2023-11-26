import 'dart:convert';

import 'package:meuapp/core/constantes.dart';
import 'package:meuapp/model/holiday_model.dart';
import 'package:http/http.dart' as http;

class HolidayRepository {
  final Uri url = Uri.parse('$urlHolidaysApi/2023');

  Future<List<HolidayEntity>> getAll() async {
    List<HolidayEntity> holidaysList = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      for (var holiday in json) {
        holidaysList.add(HolidayEntity.fromJson(holiday));
      }
    }
    return holidaysList;
  }

}
