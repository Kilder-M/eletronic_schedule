import 'package:eletronic_schedule/app/utils/datetime_convert.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Must return 2 dias', () {
    var converter = DateTimeConverterToDuration();
    var dateTime = DateTime.now().add(const Duration(days: 3));  
    var dataInDays = converter.convertDateTimeToDays(dateTime);
    expect(dataInDays, 2 );
  });
}
