import 'package:intl/date_symbol_data_file.dart';
import 'package:meuapp/model/holiday_model.dart';
import 'package:meuapp/model/holiday_repository.dart';
import 'package:intl/intl.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidayList() async {
    List<HolidayEntity> holidaysList = [];
    holidaysList = await repository.getAll();
    return holidaysList;
  }


  //intl: ^0.18.1 on pubspec.yml
  //converte um dateTime da api para o formato ptBR
  dateTimeToDateBR(date) {
    //da api para tela
    var inputDate = DateTime.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  //converte uma data ptBR dd/MM/yyyy de tela para
  //formato da API mockapi.com que é yyyy-MM-ddTHH:mm:ssZ
  dateBRToDateApi(ptBrDate) {
    //da tela para api
    final ptBrDateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');
    final parsedDate = ptBrDateFormat.parse(ptBrDate);

    final utcDateTime = DateTime.utc(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
    );

    final formattedDateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utcDateTime);
    return formattedDateTime;
  }
}
