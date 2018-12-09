//
//  Utility.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (id )getDataFromPlist:(NSString *)inFileName {
    
    id aObject = nil;
    NSError *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",inFileName]];
   
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:inFileName ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    
    aObject = [NSPropertyListSerialization
               propertyListFromData:plistXML
               mutabilityOption:NSPropertyListMutableContainersAndLeaves
               format:&format
               errorDescription:&errorDesc];
    if (!aObject) {
        //        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    return aObject;
}

@end
