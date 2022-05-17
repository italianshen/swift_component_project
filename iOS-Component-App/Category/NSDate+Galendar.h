//
//  NSDate+Galendar.h
//  ydbus
//
//  Created by iOS开发本-(梁乾) on 16/2/23.
//  Copyright © 2016年 SIBAT. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSDate (Galendar)
/**
 *  计算这个月有多少天
 *
 *  @return 天数
 */
- (NSUInteger)numberOfDaysInCurrentMonth;

/**
 *  获取这个月有多少周
 *
 *  @return 周数
 */
- (NSUInteger)numberOfWeeksInCurrentMonth;

/**
 *  计算这个月的第一天是礼拜几
 *
 *  @return 礼拜几
 */
- (NSUInteger)weeklyOrdinality;

/**
 *  计算这个月最开始的一天
 *
 *  @return 最开始的一天
 */
- (NSDate *)firstDayOfCurrentMonth;

/**
 *  上一个月
 *
 *  @return 上一个月
 */
- (NSDate *)dayInThePreviousMonth;
/**
 *  下一个月
 *
 *  @return 下一个月
 */
- (NSDate *)dayInTheFollowingMonth;

/**
 *  获取年月日对象
 *
 *  @return 年月日对象
 */
- (NSDateComponents *)YMDComponents;

/**
 *  NSString转NSDate YY-MM-DD HH:MM:SS格式
 *
 *  @param dateString 日期字符串
 *
 *  @return 日期
 */
+ (NSDate *)dateFromString:(NSString *)dateString;
/**
 *  NSString转NSDate YY-MM-DD格式
 *
 *  @param dateString YY-MM-DD
 *
 *  @return 日期
 */
+ (NSDate *)dateFromStringYY_MM_DD:(NSString *)dateString;

/**
*  NSString转NSDate YY-MM-DD格式
*
*  @param dateString YY-MM-DD
*
*  @param dateFormate 日期格式
*
*  @return 日期
*/
+ (NSDate *)dateFromStringYY_MM_DD:(NSString *)dateString andDateFormate:(NSString *)dateFormate;
/**
 *  NSDate转NSString
 *
 *  @param date 日期
 *
 *  @return 日期字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date;


/**
 *  比较两天哪个在前面
 *
 *  @param day1 第一天
 *  @param day2 第二天
 *
 *  @return 0-sameday, 1-day1 before day2, 2-day1 later day2
 */
+(NSInteger)compareDay1:(NSDate*)day1 andDay2:(NSDate*)day2;

//几天
+ (NSInteger)day:(NSDate *)date;
//几月
+ (NSInteger)month:(NSDate *)date;
//那一年
+ (NSInteger)year:(NSDate *)date;

+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
+ (NSInteger)totaldaysInMonth:(NSDate *)date;
//上一月
+ (NSDate *)lastMonth:(NSDate *)date;
//下一月
+ (NSDate*)nextMonth:(NSDate *)date;

//判断一个日期是今天还是明天还是昨天
+ (NSString*)compareTodayOrTomorrowOrYesterdayDate:(NSDate*)date;

@end
