//
//  GlobalSearchScrollViewDelegate.h
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalSearchScrollViewDelegate : NSObject <UIScrollViewDelegate>

@property (strong, nonatomic) void(^blockSelectIndex)(NSIndexPath* inIndexPath) ;

@end

NS_ASSUME_NONNULL_END
