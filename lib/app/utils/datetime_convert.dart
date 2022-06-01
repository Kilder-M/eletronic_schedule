class DateTimeConverterToDuration{
DateTimeConverterToDuration();
    int convertDateTimeToSeconds(DateTime dateTime){
      var difference = DateTime.now().difference(dateTime);
       return difference.inSeconds * -1;
    }

    int convertDateTimeToDays(DateTime dateTime){
      var difference = DateTime.now().difference(dateTime);
       return difference.inDays * -1;
    }
}