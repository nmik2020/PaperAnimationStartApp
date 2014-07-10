//
//  UIColor+Expanded.m
//
//  Created by Phil Wright on 5/17/11.
//  Copyright 2011 IndigoExcel, LLC, Inc. All rights reserved.
//

#import "UIColor+Expanded.h"

@implementation UIColor (UIColor_Expanded)

+(UIColor *)colorWithHexString:(NSString *)stringToConvert
{
	NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
	unsigned hex;
	if (![scanner scanHexInt:&hex]) return nil;
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:1.0f];	
}
@end
