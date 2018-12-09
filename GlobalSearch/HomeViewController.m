//
//  HomeViewController.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "HomeViewController.h"
#import "GlobalSearchDetailViewController.h"

#import "GlobalSearchHeaders.h"

@interface HomeViewController ()<GlobalSearchViewDelegate>{
    GlobalSearchViewController *globalSearchViewCon;
   __weak IBOutlet UIBarButtonItem *rightBarButton;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //** setup Global Search view controller
    globalSearchViewCon = [[GlobalSearchViewController alloc] initWithNibName:@"GlobalSearchViewController" bundle: nil];
    globalSearchViewCon.searchViewDelegate = self;
    [globalSearchViewCon setupSearchViewController: self];
    
}

//show hide on toggling search button in if needed.
//else you can show only.
-(IBAction)clickedOnSearchButton:(UIBarButtonItem*)inSender{
    
    if ([inSender.title rangeOfString:@"Search"].length > 0) {
        [globalSearchViewCon showSearchView];
    }else{
        [globalSearchViewCon hideSearchView];
    }
}

// Implement global search view delegate if required.
#pragma mark-
#pragma mark- Global Search View Delegate

-(void)didShowSearchView:(GlobalSearchViewController *)innSearch{
    [rightBarButton setTitle:@"Done"];
}

-(void)didHideSearchView:(GlobalSearchViewController *)innSearch{
    [rightBarButton setTitle:@"Global Search"];
}

-(void)didSelectSearchData:(GlobalSearchViewController *)inSearch andSearchData:(id)inData{
   
    GlobalSearchDetailViewController *aViewCon = [self.storyboard instantiateViewControllerWithIdentifier:@"GlobalSearchDetailViewController"];
    
    aViewCon.dataDict = inData;
    [self.navigationController pushViewController:aViewCon animated: YES];

}


@end
