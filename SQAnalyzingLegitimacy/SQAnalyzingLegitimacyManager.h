//
//  SQAnalyzingLegitimacyManager.h
//  SQAnalyzingLegitimacy
//
//  Created by SNQU on 2017/3/22.
//  Copyright © 2017年 SNQU. All rights reserved.
//

/****************************************************************************************/
/*
 本类用来判断用户数据是否合法
 */
/****************************************************************************************/

#import <Foundation/Foundation.h>

@interface SQAnalyzingLegitimacyManager : NSObject

typedef NS_ENUM(NSInteger, ETAnalyzingLegitimacyType)
{
    ETAnalyzingLegitimacyType_numberLess = 1,//手机号码位数不够
    ETAnalyzingLegitimacyType_numberLegitimate,//手机号码合法
    ETAnalyzingLegitimacyType_numberIllegal    //不合法
    
}; // 合法性

/*
 判断手机号是否合法
 */
+ (ETAnalyzingLegitimacyType)valiMobile:(NSString *)mobile;

#pragma mark - 验证车牌合法性
+ (BOOL)validateCarNo:(NSString *)carNo;



@end
