//
//  GlobalSearchViewController.h
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GlobalSearchViewDelegate;

@interface GlobalSearchViewController : UIViewController

@property(nonatomic, weak) id<GlobalSearchViewDelegate>searchViewDelegate;

-(void)setupSearchViewController:(UIViewController *)inParentVieCon;
-(void)showSearchView;
-(void)hideSearchView;
@end



NS_ASSUME_NONNULL_END
