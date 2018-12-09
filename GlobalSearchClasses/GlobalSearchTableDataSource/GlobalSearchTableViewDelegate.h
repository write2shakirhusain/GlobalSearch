//
//  HomeViewSearchTableDelegate.h
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalSearchScrollViewDelegate.h"
#import"GlobalSearchProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface GlobalSearchTableViewDelegate : GlobalSearchScrollViewDelegate<UITableViewDelegate>

@property(nonatomic,weak) id<GlobalSearchDelegate>globalDelegate;

@end

NS_ASSUME_NONNULL_END
