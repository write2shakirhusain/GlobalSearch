//
//  GlobalSearchTableDataSource.h
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobalSearchProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface GlobalSearchTableDataSource : NSObject<UITableViewDataSource,GlobalSearchDelegate>

@property(nonatomic,strong) NSMutableArray *dataList;

@end

NS_ASSUME_NONNULL_END
