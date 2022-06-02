import 'package:flutter/material.dart';

class TimesConverter {
  TimesConverter();

  int convertHourToSeconds(int hour) {
    return hour * 3600;
  }

  int convertMinutesToSeconds(int minute) {
    return minute * 60;
  }

  int convertTimeOfDayToSeconds(TimeOfDay timeOfDay) {
    return 
        convertHourToSeconds(timeOfDay.hour) +
            convertMinutesToSeconds(timeOfDay.minute);
  }
}
