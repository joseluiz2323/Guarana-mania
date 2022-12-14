extension DateTimeExt on DateTime {
  String get formatted {
    return '$dataFormatted $hourFormatted';
  }

  DateTime get start {
    return DateTime(year, month, day);
  }

  DateTime get end {
    return DateTime(year, month, day, 23, 59, 59);
  }

  String get dataFormatted {
    final dia =
        '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString().padLeft(4, '0')}';
    // ignore: newline-before-return
    return dia;
  }

  String get hourFormatted {
    final hora =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
    // ignore: newline-before-return
    return hora;
  }
}

extension DoubleExt on double {
  String get formatted {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
