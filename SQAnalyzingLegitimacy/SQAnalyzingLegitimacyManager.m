//
//  SQAnalyzingLegitimacyManager.m
//  SQAnalyzingLegitimacy
//
//  Created by SNQU on 2017/3/22.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "SQAnalyzingLegitimacyManager.h"

@implementation SQAnalyzingLegitimacyManager

//判断手机号是否合法
+ (ETAnalyzingLegitimacyType)valiMobile:(NSString *)mobile
{
    if (mobile.length < 11)
    {
        return ETAnalyzingLegitimacyType_numberLess;//@"手机号长度只能是11位";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(173)|(18[0,1,9]))\\d{8}$";
        
        
        /**
         * 所有运营商的号段检测
         */
        NSString *ALL_NUM = @"^(((13[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-9]{1}))+\\d{8})$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        NSPredicate *predAll = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ALL_NUM];
        BOOL isMatchAll = [predAll evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3 || isMatchAll) {
            return ETAnalyzingLegitimacyType_numberLegitimate;
        }else{
            return ETAnalyzingLegitimacyType_numberIllegal;//@"请输入正确的手机号码";
        }
    }
    return ETAnalyzingLegitimacyType_numberLegitimate;
}


#pragma mark - 验证车牌合法性
//车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


@end
