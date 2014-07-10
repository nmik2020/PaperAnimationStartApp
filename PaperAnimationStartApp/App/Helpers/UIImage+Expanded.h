//
//  UIImage+Expanded.h
//
//  Created by Phil Wright on 5/17/11.
//  Copyright 2011 IndigoExcel, LLC, Inc. All rights reserved.
//

@import UIKit;

@interface UIImage (Expanded)
    +(UIImage*)imageFromFullPathResource:(NSString*)fullPath;
    +(UIImage*)imageFromResource:(NSString*)name;
@end