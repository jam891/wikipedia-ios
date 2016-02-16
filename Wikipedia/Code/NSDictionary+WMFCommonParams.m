//
//  NSDictionary+WMFCommonParams.m
//  Wikipedia
//
//  Created by Brian Gerstle on 11/9/15.
//  Copyright © 2015 Wikimedia Foundation. All rights reserved.
//

#import "NSDictionary+WMFCommonParams.h"
#import "WMFNumberOfExtractCharacters.h"
#import "UIScreen+WMFImageWidth.h"

@implementation NSDictionary (WMFCommonParams)

+ (instancetype)wmf_titlePreviewRequestParameters {
    return [self wmf_titlePreviewRequestParametersWithExtractLength:WMFNumberOfExtractCharacters];
}

+ (instancetype)wmf_titlePreviewRequestParametersWithExtractLength:(NSUInteger)extractLength {
    NSMutableDictionary* defaults =
        [[NSMutableDictionary alloc] initWithObjectsAndKeys:
         @"", @"continue",
         @"json", @"format",
         @"query", @"action",
         @"pageterms|pageimages|pageprops", @"prop",
         // pageprops
         @"ppprop", @"ns",
         // pageterms
         @"description", @"wbptterms",
         // pageimage
         @"thumbnail", @"piprop",
         [[UIScreen mainScreen] wmf_leadImageWidthForScale], @"pithumbsize", nil];

    if (extractLength > 0) {
        defaults[@"explaintext"] = @"";
        defaults[@"exintro"] = @YES;
        defaults[@"exchars"] = @(extractLength);
        defaults[@"prop"] = [defaults[@"prop"] stringByAppendingString:@"|extracts"];
    }

    return defaults;
}

@end
