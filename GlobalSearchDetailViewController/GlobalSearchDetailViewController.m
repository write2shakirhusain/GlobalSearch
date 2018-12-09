//
//  GlobalSearchDetailViewController.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//


#import "GlobalSearchDetailViewController.h"

@interface GlobalSearchDetailViewController (){
//details
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UILabel *lblTag;
    __weak IBOutlet UILabel *lblPhone;
    __weak IBOutlet UILabel *lblEmail;
    __weak IBOutlet UILabel *lblAddress;
    __weak IBOutlet UIImageView *imgView;

}

@end

@implementation GlobalSearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigation];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setUpNavigation {

    self.title = @"Search Details";
}

-(void)updateUI{
    
    imgView.image = [UIImage imageNamed: [self.dataDict objectForKey:@"image"]];
    
    lblTitle.text = [self.dataDict objectForKey:@"title"];
    lblPhone.text = [self.dataDict objectForKey:@"phone"];
    lblEmail.text = [self.dataDict objectForKey:@"email"];
    lblAddress.text = [self.dataDict objectForKey:@"address"];
    lblTag.text = [self.dataDict objectForKey:@"tag"];
}

-(IBAction)clickedOnBackButton:(UIButton*)inSender{
    [self.navigationController popViewControllerAnimated: YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
