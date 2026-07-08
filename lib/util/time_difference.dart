double timeDifferenceInDays(DateTime instant, DateTime baseline) =>
    instant.difference(baseline).inMicroseconds / Duration.microsecondsPerDay;
