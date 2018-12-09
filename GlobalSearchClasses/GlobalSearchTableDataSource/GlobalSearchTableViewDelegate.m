//
//  HomeViewSearchTableDelegate.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "GlobalSearchTableViewDelegate.h"

@implementation GlobalSearchTableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.blockSelectIndex) {
        self.blockSelectIndex( indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 36;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 36)];
    [view setBackgroundColor: [UIColor darkGrayColor]];
    [view setTag:1];
   
    UILabel *lblResult = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, view.frame.size.width - 16, view.frame.size.height)];
    
    lblResult.textColor = [UIColor whiteColor];
    NSArray *aDataList = [self.globalDelegate getDataList];
    NSString *aStr = @"No Result";
    if (aDataList.count > 0) {
        aStr = [NSString stringWithFormat:@"Results (%li)",aDataList.count];
    }
    lblResult.text = aStr;

    [view addSubview:lblResult];
    
    
    return view;
    
}
@end
