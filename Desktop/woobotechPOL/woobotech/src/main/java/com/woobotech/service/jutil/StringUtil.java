package com.woobotech.service.jutil;



import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;
import java.util.StringTokenizer;

/**
 * [ StringUtil.java ] - 문자열 유틸리티 -<br>
 * 
 * 
 * @author 이주영
 * @version 1.0
 * @since 2008. 06. 23
 */
/*
 * ===================================== 변경내역 ================================== 일련번호 신규(변경)일자 변경자
 * 변경내용 변경근거 ================================================================================
 * 
 * ================================================================================
 */
public class StringUtil {

  private static final char HEX_CHAR_LOWER[] =
      {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
  private static final char HEX_CHAR_UPPER[] =
      {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
  private static final String HEXINDEX = "0123456789abcdef          ABCDEF";

  /**
   * Private constructor, to prevent construction.
   */
  private StringUtil() {} // constructor

  /**
   * 문자열 치환
   * 
   * @param str
   * @param startIndex
   * @param oldString
   * @param newString
   * @return String
   */
  public static String replace(String str, int startIndex, String oldString, String newString) {
    if (null == str) {
      return str;
    }

    int firstOccurenceIndex = 0;
    firstOccurenceIndex = str.indexOf(oldString, startIndex);
    if (firstOccurenceIndex == -1) {
      return str;
    }

    String result = str.substring(0, firstOccurenceIndex);
    result = result.concat(newString);
    result = result.concat(str.substring(firstOccurenceIndex + oldString.length(), str.length()));
    return replace(result, firstOccurenceIndex + newString.length(), oldString, newString);
  }

  /**
   * 문자열 치환
   * 
   * @param str
   * @param oldString
   * @param newString
   * @return String
   */
  public static String replace(String str, String oldString, String newString) {
    return replace(str, 0, oldString, newString);
  }

  /**
   * 경과시간을 입력받아서 , 포멧을 추가한다.
   * 
   * @param runTime
   * @return
   */
  public static String elapsedTimeAsString(long runTime) {
    return NumberFormat.getInstance().format((double) runTime / 1000);
  }

  /**
   * 각 번호에 Format Set
   * 
   * @param str
   * @param flag - "ACNO" : 계좌번호 (3-6-2-5) "CNLN_NO" : 품의번호 (4-2-5) "IB_BSNS_NO" : IB사업번호 (4-2-6)
   *        "DLBT_APLC_NO" : 심의신청번호 (4-2-5) "RRNO" : 주민등록번호(6-7) "SRSP_ACNO" : 가수가지급계좌번호(3-4-4-5)
   *        "IVBN_CSNO" : 고객번호(3-6)
   * @return String
   */
  public static String format(String str, String flag) {

    if (str != null && !"".equals(str)) {

      if (str.length() == 16) {
        // 계좌번호(16자리)
        if (flag != null && "ACNO".equals(flag)) {
          str = str.substring(0, 3) + "-" + str.substring(3, 9) + "-" + str.substring(9, 11) + "-"
              + str.substring(11, 16);
        }
        // 가수가지급계좌번호(16자리)
        else if (flag != null && "SRSP_ACNO".equals(flag)) {
          str = str.substring(0, 3) + "-" + str.substring(3, 7) + "-" + str.substring(7, 11) + "-"
              + str.substring(11, 16);
        }
      }
      // IB사업번호(12자리)
      else if (str.length() == 12) {
        if (flag != null && "IB_BSNS_NO".equals(flag)) {
          str = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6, 12);
        }
      } else if (str.length() == 11) {
        // 품의번호(11자리)
        if (flag != null && "CNLN_NO".equals(flag)) {
          str = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6, 11);
        }
        // 심의신청번호(11자리)
        else if (flag != null && "DLBT_APLC_NO".equals(flag)) {
          str = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6, 11);
        }
      }
      // 고객번호(9자리)
      else if (str.length() == 9) {
        if (flag != null && "IVBN_CSNO".equals(flag)) {
          str = str.substring(0, 3) + "-" + str.substring(3, 9);
        }
      }
      // 주민등록번호(13자리)
      else if (str.length() == 13) {
        if (flag != null && "RRNO".equals(flag)) {
          str = str.substring(0, 6) + "-" + str.substring(6, 13);
        }
      }
    }

    return str;
  }

  /**
   * 문자열의 특정길이로 자른 후 "..."을 추가
   * 
   * @param str
   * @param length
   * @return String
   */
  public static String truncate(String str, int length) {
    if (str.length() > length) {
      str = str.substring(0, length) + "...";
    }
    return str;
  }

  /**
   * Splits a string around matches of the given delimiter.
   * 
   * @param str String with delimited fields to split.
   * 
   * @param delimiter String that represents the delimiter
   * 
   * @return The array of strings computed by splitting a string around matches of the given
   *         delimiter.
   */
  public static String[] split(String str, String delimiter) {
    StringTokenizer strtok = new StringTokenizer(str, delimiter);
    String[] result = new String[strtok.countTokens()];

    for (int i = 0; i < result.length; i++) {
      result[i] = strtok.nextToken();
    }
    return result;
  }

  /**
   * Splits a string around matches of the given delimiter character.
   * 
   * @param str String with delimited fields to split.
   * @param delimiter Character that represents the delimiter
   * @return The array of strings computed by splitting a string around matches of the given
   *         delimiter.
   */
  public static String[] split(String str, char delimiter) {
    return split(str, String.valueOf(delimiter));
  }

  /**
   * 스트링 배열을 구분자를 이용해서 String형으로 변환
   * 
   * @param strs
   * @param delimiter
   * @return
   */
  public static String join(String[] strs, String delimiter) {
    StringBuffer sb = new StringBuffer();
    if (strs.length == 0) {
      return "";
    }

    sb.append(strs[0].toString());
    for (int i = 1; i < strs.length; i++) {
      sb.append(delimiter);
      sb.append(strs[i].toString());
    }

    return sb.toString();
  }

  /**
   * 스트링 배열을 구분자를 이용해서 String형으로 변환
   * 
   * @param strs
   * @param delimiter
   * @return
   */
  public static String join(String[] strs, char delimiter) {
    return join(strs, String.valueOf(delimiter));
  }

  /**
   * null이거나 "", "NULL"일 경우 판단
   * 
   * @param str
   * @return boolean
   */
  static public boolean isEmpty(String str) {
    if ((null == str) || "".equals(str.trim()) || "NULL".equals(str.trim())) {
      return true;
    }
    return false;
  }

  /**
   * 문자열이 숫자인지 검사
   * 
   * @param obj
   * @return boolean
   */
  public static boolean isNumber(Object obj) {
    return isNumber(obj, "default", Locale.getDefault());
  }

  /**
   * 문자열이 숫자인지 검사 후 포맷을 지정한다
   * 
   * @param obj
   * @param format
   * @return boolean
   */
  public static boolean isNumber(Object obj, String format) {
    return isNumber(obj, format, Locale.getDefault());
  }

  /**
   * 문자열이 숫자인지 검사
   * 
   * @param obj
   * @param format
   * @param locale
   * @return boolean
   */
  public static boolean isNumber(Object obj, String format, Locale locale) {
    if (null == obj) {
      return false;
    }

    if (obj instanceof Number) {
      return true;
    }

    try {
      NumberFormat parser = null;
      if ((format == null) || (format != null && "default".equalsIgnoreCase(format))) {
        parser = new DecimalFormat();
      } else {
        parser = new DecimalFormat(format, new DecimalFormatSymbols(locale));
      }
      return (parser.parse(String.valueOf(obj)) instanceof Number);
    } catch (Exception ex) {
      return false;
    }
  }

  public static String htmlEscape(String str) {
    str = replace(str, "&", "&amp;");
    str = replace(str, "<", "&lt;");
    str = replace(str, ">", "&gt;");
    str = replace(str, "\"", "&quot;");

    return str;
  }

  public static String htmlUnescape(String str) {
    str = replace(str, "&amp;", "&");
    str = replace(str, "&lt;", "<");
    str = replace(str, "&gt;", ">");
    str = replace(str, "&quot;", "\"");

    return str;
  }

  /**
   * Left Pads a number with zeros to take up at least 2 characters
   * 
   * @param number the number to pad
   * @return string representation of number padded to 2 characters
   */
  static public String lpad(int number) {
    return lpad(number, 2);
  }

  /**
   * Left Pads a number with zeros to take up a specified length NOTE: The input will be truncated
   * if it exceeds the specified length.
   * 
   * @param number the number to pad
   * @param length length of resulting string
   * @return string representation of number padded to specified length
   */
  public static String lpad(int number, int length) {
    return lpad(number, length, '0');
  }

  /**
   * Left Pads a number to take up a specified length NOTE: The input will be truncated if it
   * exceeds the specified length.
   * 
   * @param number the number to pad
   * @param length length of resulting string
   * @param padChar Character to be used for Padding
   * @return string representation of number padded to specified length
   */
  public static String lpad(int number, int length, char padChar) {
    return lpad(String.valueOf(number), length, padChar);
  }

  /**
   * Left Pads the input String with spaces to take up a specified length NOTE: The input will be
   * truncated if it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @return string representation of the input string padded to specified length.
   */
  public static String lpad(String input, int length) {
    return lpad(input, length, ' ');
  }

  /**
   * Left Pads the input String to take up a specified length NOTE: The input will be truncated if
   * it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padChar Character to be used for Padding
   * @return string representation of the input string padded to specified length.
   */
  public static String lpad(String input, int length, char padChar) {
    return pad(input, length, padChar, false);
  }

  /**
   * Left Pads the input String to take up a specified length NOTE: The input will be truncated if
   * it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padStr String to be used for Padding
   * @return string representation of the input string padded to specified length.
   */
  public static String lpad(String input, int length, String padStr) {
    return pad(input, length, padStr, false);
  }

  /**
   * Right Pads the input String with spaces to take up a specified length NOTE: The input will be
   * truncated if it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @return string representation of the input string padded to specified length.
   */
  public static String rpad(String input, int length) {
    return rpad(input, length, ' ');
  }

  /**
   * Right Pads the input String to take up a specified length NOTE: The input will be truncated if
   * it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padChar Character to be used for Padding
   * @return string representation of the input string padded to specified length.
   */
  public static String rpad(String input, int length, char padChar) {
    return pad(input, length, padChar, true);
  }

  /**
   * Right Pads the input String to take up a specified length NOTE: The input will be truncated if
   * it exceeds the specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padStr String to be used for Padding
   * @return string representation of the input string padded to specified length.
   */
  public static String rpad(String input, int length, String padStr) {
    return pad(input, length, padStr, true);
  }

  /**
   * Pads a String to take up a specified length NOTE: The input will be truncated if it exceeds the
   * specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padChar Character to be used for Padding
   * @param rpad If true, then characters will be padded to the end of the input string. Else they''
   *        be added before the input string.
   * @return string representation of the input padded to specified length
   */
  public static String pad(String input, int length, char padChar, boolean rpad) {
    return pad(input, length, String.valueOf(padChar), rpad);
  }

  /**
   * Pads a String to take up a specified length NOTE: The input will be truncated if it exceeds the
   * specified length.
   * 
   * @param input the String to pad
   * @param length length of resulting string
   * @param padStr String to be used for Padding
   * @param rpad If true, then characters will be padded to the end of the input string. Else they''
   *        be added before the input string.
   * @return string representation of the input padded to specified length
   */
  public static String pad(String input, int length, String padStr, boolean rpad) {
    // Create a buffer with an initial capacity set
    StringBuffer buf = new StringBuffer(length);

    // Determine the number of characters to be padded
    int padCount = length - (input != null ? input.length() : 0);

    // Start with the input, if we are rpad-ing
    if (rpad && input != null) {
      buf.append(input);
    }

    // Append with the pad characters
    for (int i = 0; i < padCount; i++) {
      buf.append(padStr);
    }

    // End with the input, if we are lpad-ing
    if (!rpad && input != null) {
      buf.append(input);
    }
    return buf.length() > length ? buf.substring(0, length) : buf.toString();
  }

  static public String ltrim(String str) {
    return str.replaceAll("^\\s+", "");
  }

  static public String rtrim(String str) {
    return str.replaceAll("\\s+$", "");
  }

  /**
   * 바이트를 헥사 값으로 변환한다.(소문자로)
   * 
   * @param b
   * @return String
   */
  static public String byteToHex(byte b) {
    return byteToHex(b, false);
  }

  /**
   * 바이트를 헥사 값으로 변환한다.(대문자로)
   * 
   * @param b
   * @param upper
   * @return String
   */
  static public String byteToHex(byte b, boolean upper) {
    char[] hexchar = upper ? HEX_CHAR_UPPER : HEX_CHAR_LOWER;
    char[] array = {hexchar[(b >> 4) & 0x0f], hexchar[b & 0x0f]};
    return new String(array);
  }

  /**
   * 바이트 배열을 헥사 문자열로 변환한다.(소문자)
   * 
   * @param bt
   * @return String
   */
  static public String byteToHex(byte bt[]) {
    return byteToHex(bt, false);
  }

  /**
   * 바이트 배열을 헥사 문자열로 변환한다.(대문자)
   * 
   * @param bt
   * @param upper
   * @return String
   */
  static public String byteToHex(byte bt[], boolean upper) {
    int len = bt.length;
    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < len; i++) {
      sb.append(byteToHex(bt[i], upper));
    }
    return sb.toString();
  }

  /**
   * 문자 값을 헥사로 변환한다.(소문자)
   * 
   * @param c
   * @return String
   */
  static public String charToHex(char c) {
    return charToHex(c, false);
  }

  /**
   * 문자 값을 헥사로 변환한다.(대문자)
   * 
   * @param c
   * @param upper
   * @return String
   */
  static public String charToHex(char c, boolean upper) {
    byte hi = (byte) (c >>> 8);
    byte lo = (byte) (c & 0xff);

    return byteToHex(hi, upper) + byteToHex(lo, upper);
  }

  /**
   * 헥사 문자열을 바이트 배열로 변환한다.
   * 
   * @param str
   * @return byte[]
   */
  static public byte[] hexToByte(String str) {
    int len = str.length() / 2;
    byte data[] = new byte[len];
    int j = 0;

    for (int i = 0; i < len; i++) {
      char chr = str.charAt(j++);
      int charPos, bitWise;

      charPos = HEXINDEX.indexOf(chr);
      bitWise = (charPos & 0xf) << 4;

      chr = str.charAt(j++);
      charPos = HEXINDEX.indexOf(chr);
      bitWise += (charPos & 0xf);

      data[i] = (byte) bitWise;
    }
    return data;
  }

  /**
   * 유니코드 문자열을 헥사 문자열로 변환한다.(소문자)
   * 
   * @param str
   * @return String
   */
  static public String unicodeToHexString(String str) {
    return unicodeToHexString(str, false);
  }

  /**
   * 유니코드 문자열을 헥사 문자열로 변환한다.(대문자)
   * 
   * @param str
   * @param upper
   * @return String
   */
  public static String unicodeToHexString(String str, boolean upper) {
    ByteArrayOutputStream bout = new ByteArrayOutputStream();
    DataOutputStream out = new DataOutputStream(bout);

    try {
      out.writeUTF(str);
      out.close();
      bout.close();
    } catch (IOException e) {
      return null;
    }
    return byteToHex(bout.toByteArray(), upper);
  }

  /**
   * 헥사 문자열을 유니코드 문자열로 변환한다.
   * 
   * @param str
   * @return String
   */
  public static String hexStringToUnicode(String str) {
    byte[] bt = hexToByte(str);
    ByteArrayInputStream bin = new ByteArrayInputStream(bt);
    DataInputStream in = new DataInputStream(bin);

    try {
      return in.readUTF();
    } catch (IOException e) {
      return null;
    }
  }

  /**
   * 유니코드 문자열을 아스키 문자열로 변환한다.(소문자)
   * 
   * @param str
   * @return String
   */
  public static String unicodeToAscii(String str) {
    return unicodeToAscii(str, false);
  }

  /**
   * 유니코드 문자열을 아스키 문자열로 변환한다.(대문자)
   * 
   * @param str
   * @param upper
   * @return String
   */
  public static String unicodeToAscii(String str, boolean upper) {
    char[] hexchar = upper ? HEX_CHAR_UPPER : HEX_CHAR_LOWER;

    if (str == null || str.equals("")) {
      return str;
    }

    int len = str.length();
    StringBuffer sb = new StringBuffer(len);

    for (int i = 0; i < len; i++) {
      char chr = str.charAt(i);
      if (chr == '\\') {
        if (i < len - 1 && str.charAt(i + 1) == 'u') {
          sb.append(chr); // encode the \ as unicode, so 'u' is
                          // ignored
          sb.append("u005c"); // splited so the source code is not
                              // changed...
        } else {
          sb.append(chr);
        }
      } else if ((chr >= 0x0020) && (chr <= 0x007f)) {
        sb.append(chr); // this is 99%
      } else {
        sb.append("\\u");
        sb.append(hexchar[(chr >> 12) & 0xf]);
        sb.append(hexchar[(chr >> 8) & 0xf]);
        sb.append(hexchar[(chr >> 4) & 0xf]);
        sb.append(hexchar[(chr) & 0xf]);
      }
    }
    return sb.toString();
  }

  /**
   * 아스키 문자열을 유니코드 문자열로 변환한다.
   * 
   * @param str
   * @return String
   */
  public static String asciiToUnicode(String str) {
    if (str == null || str.indexOf("\\u") == -1) {
      return str;
    }

    int len = str.length();
    char chra[] = new char[len];
    int j = 0;

    for (int i = 0; i < len; i++) {
      char chr = str.charAt(i);
      if (chr != '\\' || i == len - 1) {
        chra[j++] = chr;
      } else {
        chr = str.charAt(++i);
        if (chr != 'u' || i == len - 1) {
          chra[j++] = '\\';
          chra[j++] = chr;
        } else {
          int k = (HEXINDEX.indexOf(str.charAt(++i)) & 0xf) << 12;
          k += (HEXINDEX.indexOf(str.charAt(++i)) & 0xf) << 8;
          k = (HEXINDEX.indexOf(str.charAt(++i)) & 0xf) << 4;
          k += (HEXINDEX.indexOf(str.charAt(++i)) & 0xf);
          chra[j++] = (char) k;
        }
      }
    }
    return new String(chra, 0, j);
  }

  /**
   * 파일의 내용을 읽어 문자열로 반환한다.
   * 
   * @param is
   * @return String
   */
  public static String InputStreamToString(InputStream is) {
    InputStreamReader in = new InputStreamReader(is);
    StringWriter write = new StringWriter();
    int blocksize = 8 * 1024; // is this a good value?
    char buffer[] = new char[blocksize];

    try {
      while (true) {
        int readsize = in.read(buffer, 0, blocksize);
        if (readsize == -1) {
          break;
        }
        write.write(buffer, 0, readsize);
      }

      write.close();
      is.close();
    } catch (IOException e) {
      return null;
    }

    return write.toString();
  }

  /**
   * long타입의 시간간격을 0000년 00개월 00일 00시간 00분 00초 형식으로 반환
   * 
   * @param elapsedTime
   * @return
   */
  public static String elapsedTimeAsKorean(long elapsedTime) {
    // 31588585258 => 1015년 6개월 28일 15시간 58초

    long[] tsl = {60, 60, 24, 30, 12, Long.MAX_VALUE};
    String[] tss = {"초", "분", "시간", "일", "개월", "년"};

    StringBuffer sbElapsedTime = new StringBuffer();

    long quotient = elapsedTime; // 몫
    long remainder = 0; // 나머지
    for (int idx = 0; idx < tsl.length; idx++) {
      remainder = quotient % tsl[idx]; // 나머지
      quotient = quotient / tsl[idx]; // 몫
      if (remainder != 0) {
        sbElapsedTime.insert(0, " " + remainder + tss[idx]);
      }
      if (quotient == 0) {
        break;
      }
    }

    if (sbElapsedTime.length() != 0) {
      sbElapsedTime.deleteCharAt(0);
    }

    return sbElapsedTime.toString();
  }

  /**
   * 문자를 int로 변환
   * 
   * @param number
   * @return int
   */
  public static int toInt(String number) {
    return toInt(number, 0);
  }

  /**
   * 문자를 int로 변환
   * 
   * @param number
   * @return int
   */
  public static int toInt(String number, int dephault) {
    if (number == null) {
      return 0;
    }

    try {
      return Integer.valueOf(number).intValue();
    } catch (Exception ex) {
      return dephault;
    }
  }

  /**
   * 데이타 문자열을 구분자를 기준으로 분리후 String[]로 리턴
   * 
   * @param str
   * @param delimiter
   * @return String[]
   */
  public static String[] getTokenArrayFromString(String str, String delimiter) {
    StringTokenizer st = new StringTokenizer(str, delimiter, true);
    int cnt = st.countTokens();

    ArrayList<String> list = new ArrayList<String>();
    String token = null;

    // 토큰 배열 생성
    String data[] = new String[cnt];
    for (int i = 0; i < cnt; i++) {
      token = st.nextToken();
      data[i] = token;
    }

    // 결과 리스트 생성
    for (int i = 0; i < data.length;) {
      // 구분자만 남았을 경우
      if (i + 1 >= data.length) {
        list.add("");
        i++;
      }
      // 구분자 + 데이타 일 경우
      else if (data[i].equals(delimiter) && !data[i + 1].equals(delimiter)) {
        list.add(data[i + 1]);
        i += 2;
      }
      // 구분자 + 구분자 일 경우 - 데이타가 비어있는 경우 (공백)
      else if (data[i].equals(delimiter) && data[i + 1].equals(delimiter)) {
        list.add("");
        i++;
      }
    }

    // 결과 배열 생성
    String returnData[] = new String[list.size()];
    for (int i = 0; i < list.size(); i++) {
      returnData[i] = (String) list.get(i);
    }
    return returnData;
  }

  /**
   * 파라미터가 null일 경우 ""로 변경한다.
   * 
   * @param str
   * @return String
   */
  public static String nvl(String str) {
    return nvl(str, "");
  }

  /**
   * null 혹은 "" , "NULL", "null" 값을 특정문자로 변경한다.
   * 
   * @param str
   * @param value
   * @return String
   */
  public static String nvl(String str, String value) {
    if (str == null || str.equals("") || str == "NULL" || str == "null")
      return value;
    else
      return str;
  }

  /**
   * 문자열의 길이를 구한다.(한글은 2, 영문이나 숫자는 1로 인식)
   * 
   * @param str
   * @return int
   */
  public static int strByteLength(String str) {
    if (str == null || "".equals(str)) {
      return 0;
    } else {
      byte srcarr[] = str.getBytes();
      return srcarr.length;
    }
  }

  /**
   * 스페이스를 원하는 갯 수 만큼 붙여 넣는다.
   * 
   * @param mul
   * @return String
   */
  public static String multipleSpace(int mul) {
    StringBuffer spaceBuffer = new StringBuffer("");
    if (mul < 0) {
      throw new IllegalArgumentException("승수는 0 보다 크거나 같아야 합니다.");
    }
    for (int i = 1; i <= mul; i++) {
      spaceBuffer.append(" ");
    }
    return spaceBuffer.toString();
  }

  /**
   * 전각문자를 반각문자로 변환
   * 
   * @param str
   * @return String
   */
  public static String toHalfChar(String src) {
    if (src == null)
      return null;

    StringBuffer strBuf = new StringBuffer();
    char c = 0;
    int nSrcLength = src.length();

    for (int i = 0; i < nSrcLength; i++) {
      c = src.charAt(i);
      if (c >= 0xff01 && c <= 0xff5e) {
        c -= 0xfee0;
      } else if (c == 0x3000) {
        c = 0x20;
      }

      if (c == 0x002C) {
        // [，]인경우 제거함(insert/update시 오류 발생)
      } else if (c == 0x0027) {
        // [＇]인경우 제거함(insert/update시 오류 발생)
      } else {
        strBuf.append(c);
      }
    }
    return strBuf.toString();
  }

  /**
   * 포멧에 따른 형식으로 변환한다.
   * 
   * @param String
   * @param String format
   * 
   *        ex) format = "#,###" --> 1234567.00 ==> 1,234,567 format = "#,###.000" --> 1234567.1234
   *        ==> 1,234,567.123
   * 
   * @return String
   */
  public static String numberFormat(String tmp, String form) {
    if (tmp != null && tmp.length() > 0) {
      java.text.DecimalFormat df = new java.text.DecimalFormat(form);
      double num = (new Double(tmp)).doubleValue();
      StringBuffer strBuff = new StringBuffer();
      df.format(num, strBuff, new java.text.FieldPosition(java.text.NumberFormat.INTEGER_FIELD));
      return strBuff.toString();
    } else {
      return tmp;
    }
  }



  /**
   * 핸드폰 번호 양식으로 변환
   * 
   * @param String
   * 
   *        ex) --> 01011111234 ==> 010-1111-1234
   * 
   * 
   * @return String
   */
  public static String handPhoneHipon(String handPhone) {
    String result = "";
    StringBuffer sb = new StringBuffer();
    if (handPhone == null) {

      return "";
    }
    if (handPhone.length() == 11) {
      sb.append(handPhone.substring(0, 3));
      sb.append("-");
      sb.append(handPhone.substring(3, 7));
      sb.append("-");
      sb.append(handPhone.substring(7));
      result = sb.toString();
    } else if (handPhone.length() == 10) {
      sb.append(handPhone.substring(0, 3));
      sb.append("-");
      sb.append(handPhone.substring(3, 6));
      sb.append("-");
      sb.append(handPhone.substring(6));
      result = sb.toString();

    } else {
      result = handPhone;
    }

    return result;

  }


  /**
   * 핸드폰 번호 양식으로 변환
   * 
   * @param String
   * 
   *        ex) --> 01011111234 ==> 010-1111-1234
   * 
   * 
   * @return String
   */
  public static String bizNoHipon(String bizno) {
    String result = "";
    StringBuffer sb = new StringBuffer();
    if (bizno.length() == 10) {
      sb.append(bizno.substring(0, 3));
      sb.append("-");
      sb.append(bizno.substring(3, 5));
      sb.append("-");
      sb.append(bizno.substring(5));
      result = sb.toString();
    } else {
      result = bizno;
    }

    return result;

  }



  public static void main(String[] args) {
    System.out.println(elapsedTimeAsKorean(123456));
  }

}
