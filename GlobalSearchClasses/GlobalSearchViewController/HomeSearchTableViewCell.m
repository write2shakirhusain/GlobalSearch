//
//  HomeSearchTableViewCell.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "HomeSearchTableViewCell.h"

@interface HomeSearchTableViewCell (){
    __weak IBOutlet UIImageView * imgView;
    __weak IBOutlet UILabel * lblTitle;
    __weak IBOutlet UILabel * lblPhone;
    __weak IBOutlet UILabel * lblEmail;
    __weak IBOutlet UILabel * lblAddress;
    __weak IBOutlet UILabel * lblTag;

}

@end
@implementation HomeSearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateUIContentWithData:(NSDictionary *)inData{
    
    imgView.image = [UIImage imageNamed: [inData objectForKey:@"image"]];
    
    lblTitle.text = [inData objectForKey:@"title"];
    lblPhone.text = [inData objectForKey:@"phone"];
    lblEmail.text = [inData objectForKey:@"email"];
    lblAddress.text = [inData objectForKey:@"address"];
    lblTag.text = [inData objectForKey:@"tag"];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    imgView.layer.cornerRadius = 5.0;
    imgView.layer.masksToBounds = YES;
}

@end
