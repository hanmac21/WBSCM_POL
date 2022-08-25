package com.woobotech.service.jutil;

import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NumberUtil {

  // private static Logger logger = LogManager.getLogger(PBTNumberUtil.class);

  /**
   * Private constructor, to prevent construction.
   */
  private NumberUtil() {} // constructor

  /**
   * BigDecimal형의 비교처리한다. ==
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isEquals(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Exception {
    int compare = bigFirstValue.compareTo(bigSecondValue);
    return compare == 0;
  }

  /**
   * BigDecimal형의 비교처리한다. >
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isFirstGreater(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Exception {
    int compare = bigFirstValue.compareTo(bigSecondValue);
    return compare > 0;
  }

  /**
   * BigDecimal형의 비교처리한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isFirstGreaterEquals(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Exception {
    int compare = bigFirstValue.compareTo(bigSecondValue);
    return compare >= 0;
  }

  /**
   * BigDecimal형의 비교처리한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isSecondGreater(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Exception {
    int compare = bigFirstValue.compareTo(bigSecondValue);
    return compare < 0;
  }

  /**
   * BigDecimal형의 비교처리한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isSecondGreaterEquals(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Exception {
    int compare = bigFirstValue.compareTo(bigSecondValue);
    return compare <= 0;
  }

  /**
   * 숫자로 이루어진 String형의 숫자 비교 ==
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return boolean
   * @exception Exception
   */
  public static boolean isEquals(String bigFirstValue, String bigSecondValue) throws Exception {

    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = "0";

    int compare = new BigDecimal(bigFirstValue).compareTo(new BigDecimal(bigSecondValue));
    return compare == 0;
  }

  /**
   * 숫자로 이루어진 String형의 숫자 비교 >
   * 
   * @param String
   * @param String
   * @return boolean
   * @exception Exception
   */
  public static boolean isFirstGreater(String bigFirstValue, String bigSecondValue)
      throws Exception {

    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = "0";

    int compare = new BigDecimal(bigFirstValue).compareTo(new BigDecimal(bigSecondValue));
    return compare > 0;
  }

  /**
   * 숫자로 이루어진 String형의 숫자 비교 >=
   * 
   * @param String
   * @param String
   * @return boolean
   * @exception Exception
   */
  public static boolean isFirstGreaterEquals(String bigFirstValue, String bigSecondValue)
      throws Exception {

    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = "0";

    int compare = new BigDecimal(bigFirstValue).compareTo(new BigDecimal(bigSecondValue));
    return compare >= 0;
  }

  /**
   * 숫자로 이루어진 String형의 숫자 비교 <
   * 
   * @param String
   * @param String
   * @return boolean
   * @exception Exception
   */
  public static boolean isSecondGreater(String bigFirstValue, String bigSecondValue)
      throws Exception {

    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = "0";

    int compare = new BigDecimal(bigFirstValue).compareTo(new BigDecimal(bigSecondValue));
    return compare < 0;
  }

  /**
   * 숫자로 이루어진 String형의 숫자 비교 <=
   * 
   * @param String
   * @param String
   * @return boolean
   * @exception Exception
   */
  public static boolean isSecondGreaterEquals(String bigFirstValue, String bigSecondValue)
      throws Exception {

    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = "0";

    int compare = new BigDecimal(bigFirstValue).compareTo(new BigDecimal(bigSecondValue));
    return compare <= 0;
  }

  /**
   * BigDecimal형의 정해준 자리수에서 반올림처리 한다.
   * 
   * @param BigDecimal
   * @param int
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal roundHalfUp(BigDecimal bigValue, int roundLocate) throws Exception {
    if (bigValue == null || StringUtil.isEmpty(bigValue.toString()))
      return new BigDecimal("0");
    BigDecimal rtnValue = bigValue.setScale(roundLocate, BigDecimal.ROUND_HALF_UP);
    return rtnValue;
  }

  /**
   * 숫자로 이루어진 String형의 정해준 자리수에서 반올림처리 한다.
   * 
   * @param String
   * @param int
   * @return String
   * @exception Exception
   */
  public static String roundHalfUp(String bigValue, int roundLocate) throws Exception {
    if (bigValue == null || StringUtil.isEmpty(bigValue.toString()))
      return "0";
    BigDecimal rtnValue = new BigDecimal(bigValue).setScale(roundLocate, BigDecimal.ROUND_HALF_UP);
    return rtnValue.toString();
  }

  /**
   * BigDecimal형의 정해준 자리수에서 절사처리 한다.
   * 
   * @param BigDecimal
   * @param int
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal roundHalfDown(BigDecimal bigValue, int roundLocate) throws Exception {
    if (bigValue == null || StringUtil.isEmpty(bigValue.toString()))
      return new BigDecimal("0");
    BigDecimal rtnValue = bigValue.setScale(roundLocate, BigDecimal.ROUND_DOWN);
    return rtnValue;
  }

  /**
   * 숫자로 이루어진 String형의 정해준 자리수에서 절사처리 한다.
   * 
   * @param String
   * @param int
   * @return String
   * @exception Exception
   */
  public static String roundHalfDown(String bigValue, int roundLocate) throws Exception {
    if (bigValue == null || StringUtil.isEmpty(bigValue.toString()))
      return "0";
    BigDecimal rtnValue = new BigDecimal(bigValue).setScale(roundLocate, BigDecimal.ROUND_DOWN);
    return rtnValue.toString();
  }

  /**
   * short형을 BigDecimal로 처리한다.
   * 
   * @param value short
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal toBigDecimal(short value) throws Throwable {
    return new BigDecimal(String.valueOf(value));
  }

  /**
   * int형을 BigDecimal로 처리한다.
   * 
   * @param int
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal toBigDecimal(int value) throws Throwable {
    return new BigDecimal(String.valueOf(value));
  }

  /**
   * long형을 BigDecimal로 처리한다.
   * 
   * @param long
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal toBigDecimal(long value) throws Throwable {
    return new BigDecimal(String.valueOf(value));
  }

  /**
   * float형을 BigDecimal로 처리한다.
   * 
   * @param float
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal toBigDecimal(float value) throws Throwable {
    return new BigDecimal(String.valueOf(value));
  }

  /**
   * double형을 BigDecimal로 처리한다.
   * 
   * @param double
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal toBigDecimal(double value) throws Throwable {
    return new BigDecimal(String.valueOf(value));
  }

  /**
   * BigDecimal형을 subtract 한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return String
   * @exception Exception
   */
  public static BigDecimal subtract(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = new BigDecimal("0");

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = new BigDecimal("0");

    BigDecimal bigResultValue = bigFirstValue.subtract(bigSecondValue);

    return bigResultValue;
  }

  /**
   * 숫자로 이루어진 String형을 수로 변환하여 subtract 한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @exception Exception
   */
  public static String subtract(String bigFirstValue, String bigSecondValue) throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString().trim()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString().trim()))
      bigSecondValue = "0";

    BigDecimal bigResultValue =
        new BigDecimal(bigFirstValue).subtract(new BigDecimal(bigSecondValue));

    return bigResultValue.toString();
  }

  /**
   * BigDecimal형을 multiply 한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal multiply(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = new BigDecimal("0");

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = new BigDecimal("0");

    BigDecimal bigResultValue = bigFirstValue.multiply(bigSecondValue);
    return bigResultValue;
  }

  /**
   * 숫자로 이루어진 String형을 수로 변환하여 multiply 한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @exception Exception
   */
  public static String multiply(String bigFirstValue, String bigSecondValue) throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString().trim()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString().trim()))
      bigSecondValue = "0";

    BigDecimal bigResultValue =
        new BigDecimal(bigFirstValue).multiply(new BigDecimal(bigSecondValue));
    return bigResultValue.toString();
  }

  /**
   * BigDecimal형을 divide 한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal divide(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = new BigDecimal("0");

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = new BigDecimal("0");

    if (bigSecondValue.doubleValue() == 0.0D)
      return new BigDecimal("0");
    // throw new Exception("숫자 0으로 나눌수 없습니다");
    BigDecimal bigResultValue = bigFirstValue.divide(bigSecondValue, 10, 0);
    return bigResultValue;
  }

  /**
   * 숫자로 이루어진 String형을 수로 변환하여 divide 한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @exception Exception
   */
  public static String divide(String bigFirstValue, String bigSecondValue) throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString().trim()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString().trim()))
      bigSecondValue = "0";

    if (new BigDecimal(bigSecondValue).doubleValue() == 0.0D)
      return "0";
    // throw new Exception("숫자 0으로 나눌수 없습니다");
    BigDecimal bigResultValue =
        new BigDecimal(bigFirstValue).divide(new BigDecimal(bigSecondValue), 10, 0);
    return bigResultValue.toString();
  }


  /**
   * BigDecimal형을 divide 한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @param int
   * @param int
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal divide(BigDecimal bigFirstValue, BigDecimal bigSecondValue, int scale,
      int rounding) throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = new BigDecimal("0");

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = new BigDecimal("0");

    if (bigSecondValue.doubleValue() == 0.0D)
      return new BigDecimal("0");
    // throw new Exception("숫자 0으로 나눌수 없습니다");
    BigDecimal bigResultValue = bigFirstValue.divide(bigSecondValue, scale, rounding);
    return bigResultValue;
  }

  /**
   * 숫자로 이루어진 String형을 수로 변환하여 divide 한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @exception Exception
   */
  public static String divide(String bigFirstValue, String bigSecondValue, int scale, int rounding)
      throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString().trim()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString().trim()))
      bigSecondValue = "0";

    if (new BigDecimal(bigSecondValue).doubleValue() == 0.0D)
      return "0";
    // throw new Exception("숫자 0으로 나눌수 없습니다");
    BigDecimal bigResultValue =
        new BigDecimal(bigFirstValue).divide(new BigDecimal(bigSecondValue), scale, rounding);
    return bigResultValue.toString();
  }


  /**
   * BigDecimal형의 나머지를 처리한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * @return BigDecimal
   * @exception Exception
   */
  public static BigDecimal modBigDecimal(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Throwable {
    return new BigDecimal(bigFirstValue.doubleValue() % bigSecondValue.doubleValue());
  }

  /**
   * 숫자로 이루어진 String형을 수로 변환하여 나머지를 처리한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @exception Exception
   */
  public static String modBigDecimal(String bigFirstValue, String bigSecondValue) throws Throwable {
    return new BigDecimal(Double.parseDouble(bigFirstValue) % Double.parseDouble(bigSecondValue))
        .toString();
  }

  /**
   * BigDecimal형을 add 한다.
   * 
   * @param BigDecimal
   * @param BigDecimal
   * 
   * @return BigDecimal
   * @throws Throwable
   */
  public static BigDecimal add(BigDecimal bigFirstValue, BigDecimal bigSecondValue)
      throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString()))
      bigFirstValue = new BigDecimal("0");

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString()))
      bigSecondValue = new BigDecimal("0");

    BigDecimal bigResultValue = bigFirstValue.add(bigSecondValue);
    return bigResultValue;
  }

  /**
   * 숫자로 이루어진 String형을 add 한다.
   * 
   * @param String 숫자 형태의 String
   * @param String 숫자 형태의 String
   * @return String 숫자 형태의 String
   * @throws Throwable
   */
  public static String add(String bigFirstValue, String bigSecondValue) throws Throwable {
    if (bigFirstValue == null || StringUtil.isEmpty(bigFirstValue.toString().trim()))
      bigFirstValue = "0";

    if (bigSecondValue == null || StringUtil.isEmpty(bigSecondValue.toString().trim()))
      bigSecondValue = "0";

    BigDecimal bigResultValue = new BigDecimal(bigFirstValue).add(new BigDecimal(bigSecondValue));
    return bigResultValue.toString();
  }

  /**
   * 숫자로 이루어진 String[]형을 add 한다.
   * 
   * @param bgValue 숫자 형태의 String배열
   * @return String 숫자 형태의 String
   * @throws Throwable
   */
  public static String add(String[] bgValue) throws Throwable {
    BigDecimal bigResultValue = new BigDecimal("0");
    for (int i = 0; i < bgValue.length; i++) {
      if (StringUtil.isEmpty(bgValue[i].trim()))
        bgValue[i] = "0";
      else
        bgValue[i] = StringUtil.replace(bgValue[i], ",", "");

      bigResultValue = add(bigResultValue, new BigDecimal(bgValue[i]));
    }
    return bigResultValue.toString();
  }

  /**
   * 반올림한다.
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double round(double d, int p) {
    long tmp = (long) Math.pow(10, p);
    double num = Math.round(d * tmp);
    num /= tmp;
    return num;
  }

  /**
   * 절상한다.
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double ceil(double d, int p) {
    long tmp = (long) Math.pow(10, p);
    double num = Math.ceil(d * tmp);
    num /= tmp;
    return num;
  }

  /**
   * 절사한다.
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double floor(double d, int p) {
    long tmp = (long) Math.pow(10, p);
    double num = Math.floor(d * tmp);
    num /= tmp;
    return num;
  }

  /**
   * 반올림한다. (소수점)
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double roundL(double d, int p) {
    double tmp = Math.pow(10, p);
    return Math.round(d * (int) tmp) / tmp;
  }

  /**
   * 절상한다. (소수점)
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double ceilL(double d, int p) {
    double tmp = Math.pow(10, p);
    return Math.ceil(d * (int) tmp) / tmp;
  }

  /**
   * 절사한다. (소수점)
   * 
   * @param d 숫자
   * @param p 자리수
   * @return double
   */
  public static double floorL(double d, int p) {
    double tmp = Math.pow(10, p);
    return Math.floor(d * (int) tmp) / tmp;
  }

  /**
   * 
   * 천단위 콤마 찍기
   * 
   * 
   */

  public static String setComma(String num) {

    // Null 체크
    if (num == null || num.isEmpty())
      return "0";

    // 숫자형태가 아닌 문자열일경우 디폴트 0으로 반환
    String numberExpr = "^[-+]?(0|[1-9][0-9]*)(\\.[0-9]+)?([eE][-+]?[0-9]+)?$";
    boolean isNumber = num.matches(numberExpr);
    if (!isNumber)
      return "0";

    String strResult = num; // 출력할 결과를 저장할 변수
    Pattern p = Pattern.compile("(^[+-]?\\d+)(\\d{3})"); // 정규표현식
    Matcher regexMatcher = p.matcher(num);

    int cnt = 0;
    while (regexMatcher.find()) {
      strResult = regexMatcher.replaceAll("$1,$2"); // 치환 : 그룹1 + "," + 그룹2


      // 치환된 문자열로 다시 matcher객체 얻기
      // regexMatcher = p.matcher(strResult);
      regexMatcher.reset(strResult);
    }
    return strResult;
  }



  public static void main(String[] args) {

  }
}
