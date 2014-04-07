package org.guess.core.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 日期Util类
 * 
 * @author calvin
 */
public class DateUtil {
	private static String defaultDatePattern = "yyyy-MM-dd";

	public static SimpleDateFormat dateFormatter = new SimpleDateFormat(
			"yyyy-MM-dd");

	public static SimpleDateFormat dateTimeFormatter = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat dateTimeFormatter1 = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm:ss");
	public static SimpleDateFormat dateTimeFormatter2 = new SimpleDateFormat(
			"yyyyMMddHHmmss");
	
	/**
	 * 获得默认的 date pattern
	 */
	public static String getDatePattern() {
		return defaultDatePattern;
	}

	/**
	 * 返回预设Format的当前日期字符串
	 */
	public static String getToday() {
		Date today = new Date();
		return format(today);
	}

	/**
	 * 使用预设Format格式化Date成字符串
	 */
	public static String format(Date date) {
		return format(date, getDatePattern());
	}
	
	/**
	 * 使用预设Format格式化Date成字符串
	 */
	public static String format1(Date date) {
		return format(date, getDatePattern());
	}
	
	
	/**
	 * 使用预设Format格式化Date成字符串
	 */
	public static String getMapFraID() {
		return dateTimeFormatter2.format(new Date());
	}
	

	/**
	 * 使用参数Format格式化Date成字符串
	 */
	public static String format(Date date, String pattern) {
		String returnValue = "";

		if (date != null) {
			SimpleDateFormat df = new SimpleDateFormat(pattern);
			returnValue = df.format(date);
		}

		return (returnValue);
	}

	/**
	 * 使用预设格式将字符串转为Date
	 */
	public static Date parse(String strDate) throws ParseException {
		return parse(strDate, getDatePattern());
	}

	/**
	 * 使用参数Format将字符串转为Date
	 */
	public static Date parse(String strDate, String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		try {
			return df.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Date parse(Date strDate, String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		try {
			return df.parse(df.format(strDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date parseFormat(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);

		return DateUtil.parse(df.format(new Date()), pattern);
	}

	/**
	 * 返回当前的日期时间字符串 格式："yyyy-MM-dd HH:mm:ss"
	 * 
	 * @return string
	 */
	public static String getCurrenDateTime() {
		String dt = dateTimeFormatter.format(new Date());
		return dt;
	}

	/**
	 * 返回当前的日期字符串 格式： "yy-MM-dd"
	 * 
	 * @return
	 */
	public static String getCurrenDate() {
		String date = dateFormatter.format(new Date());
		return date;
	}

	/**
	 * 根据所传的格式返回当前的时间字符串 格式 pattern
	 * 
	 * @param pattern
	 *            format pattern
	 * @return current datetime
	 */
	public static String getCurrenDateTimeByPattern(String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String dt = sdf.format(new Date());
		return dt;
	}

	/**
	 * 根据所传的格式，格式化想要处理的date 格式： pattern 如果date ＝＝ null，则返回当前的date字符串
	 * 
	 * @param date
	 *            java.util.Date
	 * @return short format datetime
	 */
	public static String dateFormatterByPattern(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		if (date != null) {
			return sdf.format(date);
		} else {
			return sdf.format(new Date());
		}
	}

	/**
	 * 格式化传进去的日期 格式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return String
	 */
	public static String dateTimeFormatter(Date date) {
		if (date != null) {
			return dateTimeFormatter.format(date);
		} else {
			return dateTimeFormatter.format(new Date());
		}
	}

	public static String dateTimeFormatterDate(Date date) {
		if (date != null) {
			return dateTimeFormatter.format(date);
		}
		return "";
	}

	/**
	 * 格式化传进去的日期 格式 ：yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 */
	public static String dateFormatter(Date date) {
		if (date != null) {
			return dateFormatter.format(date);
		} else {
			return dateFormatter.format(new Date());
		}
	}

	/**
	 * 把传进去的字符串按照相对应的格式转换成日期，时间 格式: "yyyy-MM-dd HH:mm:ss"
	 * 
	 * @param param
	 * 
	 * @return java.util.Date
	 */
	public static Date dateTimeParser(String param) {
		Date date = null;
		try {
			date = dateTimeFormatter.parse(param);
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 把传进去的字符串按照相对应的格式转换成日期 格式：yyyy-MM-dd
	 * 
	 * @param param
	 * @return
	 */
	public static Date dateParser(String param) {
		Date date = null;
		try {
			date = dateFormatter.parse(param);
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 比较两个日期的前后，前面的日期在后，则为true
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean isDateAfter(Date date1, Date date2) {
		return date1.getTime() >= date2.getTime();
	}

	/**
	 * 是否过期，过期true，未过期false
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean isGuoqi(Date endTime) {
		Date today = new Date();
		return today.getTime() > endTime.getTime();
	}

	/**
	 * 比较两个日期字符串的先后，前面的日期在后，则为true
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean isDateAfter(String date1, String date2) {
		Date datea = toCalendar(date1).getTime();
		Date dateb = toCalendar(date2).getTime();
		return DateUtil.isDateAfter(datea, dateb);
	}

	public static boolean isDateInvalidation(Date date) {
		Date date2 = new Date();
		return DateUtil.isDateAfter(date2, date);
	}

	/**
	 * 从一个日期字符串中取出它的年份
	 * 
	 * @param strDate
	 * @return
	 */
	public static final int getYear(String strDate) {

		Calendar cale = toCalendar(strDate);
		if (cale == null) {
			return -1;
		}
		return cale.get(Calendar.YEAR);
	}

	/**
	 * 从一个日期字符串中取出它的月份
	 * 
	 * @param strDate
	 * @return
	 */
	public static final int getMonth(String strDate) {
		Calendar cale = toCalendar(strDate);
		if (cale == null) {
			return -1;
		}
		return cale.get(Calendar.MONTH) + 1;
	}

	/**
	 * 从一个日期字符串中取出它的日期
	 * 
	 * @param strDate
	 * @return
	 */
	public static final int getDate(String strDate) {
		Calendar cale = toCalendar(strDate);
		if (cale == null) {
			return -1;
		}
		return cale.get(Calendar.DATE);
	}

	/**
	 * 把一个日期字符串转换成Calendar形式
	 * 
	 * @param strDate
	 * @return
	 */
	private static final Calendar toCalendar(String strDate) {
		Calendar cale = null;
		try {
			Date thisDate = dateTimeFormatter.parse(strDate);
			cale = Calendar.getInstance();
			cale.setTime(thisDate);
		} catch (Exception e) {
			return null;
		}
		return cale;
	}

	/**
	 * 返回昨天的日期字符串
	 * 
	 * @param strDate
	 * @return
	 */
	public static final String getYesday() {
		String strDate = getCurrenDateTime();
		Calendar cale = toCalendar(strDate);
		cale.add(Calendar.DAY_OF_YEAR, -1);
		return dateFormatterByPattern(cale.getTime(), "yyyy-MM-dd");

	}

	/**
	 * 计算出strDate之后days天后的日期字符串 days可以为负数
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 */
	public static final String addDayToString(String strDate, int days) {
		Calendar cale = toCalendar(strDate);
		cale.add(Calendar.DAY_OF_YEAR, days);
		return dateFormatterByPattern(cale.getTime(), "yyyy-MM-dd");
	}

	/**
	 * 此函数计算出date之后days天后的日期,days可以是负数
	 * 
	 * @param strDate
	 * @param days
	 * @return
	 */
	public static final Date addDay(Date date, int days) {
		Calendar cale = Calendar.getInstance();
		cale.setTime(date);
		cale.add(Calendar.DAY_OF_YEAR, days);
		return cale.getTime();
	}

	/**
	 * 此函数计算出指定日期之后moths个月的日期,Months可以是负数
	 * 
	 * @param date
	 * @param n
	 * @return
	 */
	public static final Date addMonth(Date date, int months) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		return cal.getTime();
	}

	/**
	 * 此函数计算出指定日期之后moths个月的日期,Months可以是负数
	 * 
	 * @param strDate
	 * @param months
	 * @return
	 */
	public static final String addMonth(String strDate, int months) {
		Date date;
		try {
			date = dateFormatter.parse(strDate);
		} catch (ParseException e) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		return dateFormatterByPattern(cal.getTime(), "yyyy-MM-dd");
	}

	// 两个日期相减等于几天
	public static final int getDays(Date date1, Date date2) {
		Long days = date1.getTime() - date2.getTime();
		return (int) (days / 1000 / 3600 / 24);
	}

	// 两个日期相减等于几分钟
	public static final int getMinute(Date date1, Date date2) {
		Long days = date1.getTime() - date2.getTime();
		return (int) (days / 1000 / 60);
	}

	/**
	 * 使用预设Format格式化Date成字符串
	 */
	public static String getNowStr() {
		return dateTimeFormatter2.format(new Date());
	}
	
	/**
	 * 计算星期几
	 * @return
	 */
	public static int getWeek(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int day = c.get(Calendar.DAY_OF_WEEK);
		if(day == 1){
			return 7;
		}else{
			return day-1;
		}
	}
	
	/**
	 * 根据日期算出这一周的日期
	 */
	public static List<Date> dateToWeek(Date date){
		 int b=DateUtil.getWeek(date);
		  Date fdate ;
		  List<Date> list = new ArrayList<Date>();
		  Long fTime=date.getTime()-b*24*3600000;
		  for(int a=0;a<8;a++){
			  fdate= new Date();
			  fdate.setTime(fTime+(a*24*3600000));
			  list.add(a, fdate);
		  }
		  return list;
	}
	
	/**
	 * 根据日期计算出星期一的日期
	 * @throws ParseException 
	 */
	public static String getMonday(String date){
		try {
			return DateUtil.format(DateUtil.dateToWeek(DateUtil.parse(date)).get(1));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 根据日期计算出星期天的日期
	 * @throws ParseException 
	 */
	public static String getSunDay(String date){
		List<Date> dates;
		try {
			dates = DateUtil.dateToWeek(DateUtil.parse(date));
			return DateUtil.format(dates.get(dates.size()-1));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 根据日期得出第二天日期
	 */
	@SuppressWarnings("static-access")
	public static String getTomrrow(Date date){
		Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动
        return DateUtil.format(calendar.getTime()); //这个时间就是日期往后推一天的结果
	}
	
	/**
	 * 根据日期得出前一天日期
	 * @param args
	 * @throws ParseException
	 */
	@SuppressWarnings("static-access")
	public static String getYesterday(Date date){
		Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,-1);//把日期往后增加一天.整数往后推,负数往前移动
        return DateUtil.format(calendar.getTime()); //这个时间就是日期往后推一天的结果
	}
}