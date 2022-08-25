package com.woobotech.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class T {

  /**
   * SimpleDateFormat yyyy : 년도 w : 일년안에서 몇번째 주인지 W : 한달안에서 몇번째 주인지 MM : 월 dd : 일 D : 일년에서 몇번째 일인지 E
   * : 요일(Tuesday,Tue) F : 요일을 숫자로(2) hh : 시간(1~12) HH : 시간(1~24) kk : 시간(0~11) KK : 시간(0~23) a :
   * AM/PM mm : 분 ss : 초 SSS : Millisecond
   */

  /**
   * 오늘 날짜를 구한다.
   * 
   * @return "yyyyMMDD"
   */
  public static String getToday() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String today = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"
    return today;
  }

  /**
   * 오늘 연도를 구한다.
   * 
   * @return "yyyy"
   */
  public static String getTodayYear() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String today = new SimpleDateFormat("yyyy").format(calendar.getTime()); // "yyyy"
    return today;
  }

  /**
   * 오늘 월을 구한다.
   * 
   * @return "MM"
   */
  public static String getTodayMonth() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String today = new SimpleDateFormat("MM").format(calendar.getTime()); // "MM"
    return today;
  }

  /**
   * 오늘 날짜를 구한다.
   * 
   * @return "dd"
   */
  public static String getTodayDay() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String today = new SimpleDateFormat("dd").format(calendar.getTime()); // "dd"
    return today;
  }

  /**
   * 현재 시간을 구한다. 시간(0~23)
   * 
   * @return "yyyyMMDDHHmmss"
   */
  public static String getHour() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String now = new SimpleDateFormat("kk").format(calendar.getTime()); // "hh" : 시간(0~23)
    return now;
  }

  /**
   * 현재 요일을 구한다.
   * 
   * @return "yyyyMMDDHHmmss"
   */
  public static String getWeekday() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String now = new SimpleDateFormat("E").format(calendar.getTime()); // "E" : 요일을 숫자로
    return now;
  }

  /**
   * 오늘이 이번달의 몇번째 주인지 구한다.
   * 
   * @return "W"
   */
  public static String getTodayWeekInMonth() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String today = new SimpleDateFormat("W").format(calendar.getTime()); // "W"
    return today;
  }

  /**
   * 현재 날짜와 시간, 분, 초를 구한다.
   * 
   * @return "yyyyMMDDHHmmss"
   */
  public static String getNow() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date(System.currentTimeMillis()));
    String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime()); // "yyyyMMDDHHmmss"
    return now;
  }

  /**
   * 이달의 마지막 날을 구한다.
   * 
   * @return int 날짜
   */
  public static int getLastMonthday() {
    Calendar calendar = Calendar.getInstance();
    int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    return lastday;
  }

  /**
   * 주어진 달의 마지막 날을 구한다.
   * 
   * @param year
   * @param month
   * @return int 날짜
   */
  public static int getLastMonthday(int year, int month) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(year, month - 1, 1);
    int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    return lastday;
  }

  /**
   * 주어진 달의 마지막 날을 구한다.
   * 
   * @param yyyy_MM
   * @return int 날짜
   */
  public static int getLastMonthday(String yyyy_MM) {
    Calendar calendar = Calendar.getInstance();
    int year = Integer.parseInt(yyyy_MM.split("-")[0]);
    int month = Integer.parseInt(yyyy_MM.split("-")[1]) - 1;
    calendar.set(year, month, 1);
    int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    return lastday;
  }

  /**
   * 이달의 마지막 날을 구한다.
   * 
   * @return String yyyyMMdd
   */
  public static String getLastMonthFullday() {
    String today = T.getToday().substring(0, 7);
    Calendar calendar = Calendar.getInstance();
    String lastday = today + "-" + F.addZero(calendar.getActualMaximum(Calendar.DAY_OF_MONTH), 2);
    return lastday;
  }

  /**
   * 주어진 달의 마지막 날을 구한다.
   * 
   * @param year
   * @param month
   * @return String yyyyMMdd
   */
  public static String getLastMonthFullday(int year, int month) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(year, month - 1, 1);
    String lastday = year + "-" + F.addZero(month, 2) + "-"
        + F.addZero(calendar.getActualMaximum(Calendar.DAY_OF_MONTH), 2);
    return lastday;
  }

  /**
   * 주어진 달의 마지막 날을 구한다.
   * 
   * @param yyyy_MM
   * @return String yyyyMMdd
   */
  public static String getLastMonthFullday(String yyyy_MM) {
    String today = T.getToday().substring(0, 6);
    Calendar calendar = Calendar.getInstance();
    int year = Integer.parseInt(yyyy_MM.split("-")[0]);
    int month = Integer.parseInt(yyyy_MM.split("-")[1]) - 1;
    calendar.set(year, month, 1);
    String lastday = yyyy_MM.substring(0, 7) + "-"
        + F.addZero(calendar.getActualMaximum(Calendar.DAY_OF_MONTH), 2);
    return lastday;
  }

  /**
   * 주어진 달의 첫 날을 구한다.
   * 
   * @param year
   * @param month
   * @return int 날짜
   */
  public static String getFirstMonthday(int year, int month) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(year, month - 1, 1);
    String firstDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
    return firstDay;
  }

  /**
   * 주어진 날짜의 요일을 구한다. 1:일요일, 2:월요일, 3:화요일, 4:수요일, 5:목요일, 6:금요일, 7:토요일
   * 
   * @param yyyyMMdd
   * @return
   */
  public static int getWeekDay(String yyyyMMdd) {
    String[] date = yyyyMMdd.split("-");
    Calendar calendar = Calendar.getInstance();
    calendar.set(Calendar.YEAR, Integer.parseInt(date[0]));
    calendar.set(Calendar.MONTH, Integer.parseInt(date[1]) - 1);
    calendar.set(Calendar.DATE, Integer.parseInt(date[2]));
    return calendar.get(Calendar.DAY_OF_WEEK);
  }

  /**
   * 요청한 주차의 일요일부터 토요일까지의 날짜를 배열로 리턴
   * 
   * @param year
   * @param month
   * @param week
   */
  public static String[] getFirstAndFinishDayOfWeek(int year, int month, int week) {
    Calendar calendar = Calendar.getInstance();
    // calendar.setFirstDayOfWeek(2); //주 시작을 월요일로 세팅(월~일)
    calendar.set(Calendar.YEAR, year);
    calendar.set(Calendar.MONTH, month - 1);
    calendar.set(Calendar.WEEK_OF_MONTH, week);

    calendar.set(Calendar.DAY_OF_WEEK, 1);
    String weekStartDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"
    calendar.set(Calendar.DAY_OF_WEEK, 7);
    String weekEndDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"

    String[] thisWeekDay = {weekStartDay, weekEndDay};
    return thisWeekDay;
  }

  /**
   * 요청한 주차의 월요일부터 다음주 일요일까지의 날짜를 배열로 리턴
   * 
   * @param year
   * @param month
   * @param week
   */
  public static String[] getFirstAndFinishDayOfWeekFromMonday(int year, int month, int week) {
    Calendar calendar = Calendar.getInstance();
    calendar.setFirstDayOfWeek(2); // 주 시작을 월요일로 세팅(월~일)
    calendar.set(Calendar.YEAR, year);
    calendar.set(Calendar.MONTH, month - 1);
    calendar.set(Calendar.WEEK_OF_MONTH, week);

    calendar.set(Calendar.DAY_OF_WEEK, 2);
    String weekStartDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"
    calendar.set(Calendar.DAY_OF_WEEK, 1);
    String weekEndDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"

    String[] thisWeekDay = {weekStartDay, weekEndDay};
    return thisWeekDay;
  }

  /**
   * 요청한 주차의 월요일부터 다음주 일요일까지의 날짜를 배열로 리턴 단 1일이 금,토,일 일 경우 전달의 마지막주로 처리한다.
   * 
   * @param year
   * @param month
   * @param week
   */
  public static String[] getFirstAndFinishDayOfWeekFromMondayExceptFriday(int year, int month,
      int week) {
    Calendar calendar = Calendar.getInstance();
    calendar.setFirstDayOfWeek(2); // 주 시작을 월요일로 세팅(월~일)
    calendar.set(Calendar.YEAR, year);
    calendar.set(Calendar.MONTH, month - 1);

    String firstMonthDay = getFirstMonthday(year, month); // 월의 첫째날을 구한다.
    int firstWeekDay = getWeekDay(firstMonthDay); // 월의 첫째날의 요일을 구한다.
    if (firstWeekDay == 6 || firstWeekDay == 7 || firstWeekDay == 1) { // 월의 첫째날이 금,토,일이면 다음 주를 첫째주로
                                                                       // 한다.
      calendar.set(Calendar.WEEK_OF_MONTH, week + 1);
    } else {
      calendar.set(Calendar.WEEK_OF_MONTH, week);
    }

    calendar.set(Calendar.DAY_OF_WEEK, 2);
    String weekStartDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"
    calendar.set(Calendar.DAY_OF_WEEK, 1);
    String weekEndDay = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()); // "yyyyMMDD"

    String[] thisWeekDay = {weekStartDay, weekEndDay};
    return thisWeekDay;
  }

  /**
   * 주어진 년월이 몇주까지인지 리턴
   * 
   * @return "W"
   */
  public static int getWeekInMonth(int year, int month) {
    Calendar calendar = Calendar.getInstance();

    String[] firstAndFinish = getFirstAndFinishDayOfMonth(year, month);
    String firstMonthDay = firstAndFinish[0]; // 월의 첫째날을 구한다.
    int finishMonthDay = getLastMonthday(year, month); // 월의 마지막날을 구한다.

    int startDate = 1;
    int endDate = finishMonthDay;

    int firstWeekDay = getWeekDay(firstMonthDay); // 월의 첫째날의 요일을 구한다.
    if (firstWeekDay == 6) {
      startDate = 4;
    } else if (firstWeekDay == 7) {
      startDate = 3;
    } else if (firstWeekDay == 1) {
      startDate = 2;
    }

    int weekCount = (int) Math.ceil((float) (endDate - startDate) / 7);
    return weekCount;
  }

  /**
   * 요청한 년월의 처음 날짜와 마지막 날짜를 배열로 리턴
   * 
   * @param year
   * @param month
   * @param week
   */
  public static String[] getFirstAndFinishDayOfMonth(int year, int month) {
    String monthStartDay = T.getFirstMonthday(year, month); // "yyyyMMDD"
    String monthEndDay = T.getLastMonthFullday(year, month); // "yyyyMMDD"

    String[] thisMonthDay = {monthStartDay, monthEndDay};
    return thisMonthDay;
  }

  /**
   * 주어진 기간동안의 분을 리턴한다.
   * 
   * @param startDateTime : yyyyMMddHHmm. ex:201303202400
   * @param endDateTime : yyyyMMddHHmm. ex:201303202400
   * @return
   * @throws ParseException
   */
  public static int getDurationByMinute(String startDateTime, String endDateTime) {
    int duration = 0;

    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm");

    Date start = new Date(System.currentTimeMillis());
    Date end = new Date(System.currentTimeMillis());
    try {
      start = formatter.parse(startDateTime);
      end = formatter.parse(endDateTime);
    } catch (ParseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    long diff = end.getTime() - start.getTime();
    duration = (int) diff / (60 * 1000);

    return duration;
  }

  /**
   * 현재부터 주어진 종료일시 동안의 분을 리턴한다.
   * 
   * @param endDateTime : yyyyMMddHHmm. ex:201303202400
   * @return
   * @throws ParseException
   */
  public static int getDurationByMinute(String endDateTime) {
    int duration = 0;

    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm");

    Date start = new Date(System.currentTimeMillis());
    Date end = new Date(System.currentTimeMillis());
    try {
      end = formatter.parse(endDateTime);
    } catch (ParseException e) {
      e.printStackTrace();
    }

    long diff = end.getTime() - start.getTime();
    duration = (int) diff / (60 * 1000);

    return duration;
  }

  /**
   * 나이를 리턴한다 : 현재 연도에서 생년월일의 연도를 뺀다.
   * 
   * @param birth
   * @return
   */
  public static int getAge(String birth) {
    int age = 0;
    if (birth.trim().length() == 10) {
      int birthYear = Integer.parseInt(birth.substring(0, 4));
      Calendar calendar = Calendar.getInstance();
      int todayYear = calendar.get(Calendar.YEAR);
      age = todayYear - birthYear;
    }
    return age;
  }

}
