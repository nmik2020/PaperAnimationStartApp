//
//  UIImage+Expanded.m
//
//  Created by Phil Wright on 5/17/11.
//  Copyright 2011 IndigoExcel, LLC, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIImage+Expanded.h"

@implementation UIImage(Resources)

+(UIImage*)imageFromResource:(NSString*)name
{
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
}

+(UIImage*)imageFromFullPathResource:(NSString*)fullPath
{
	return [UIImage imageWithData:[NSData dataWithContentsOfFile:fullPath]];
}

@end