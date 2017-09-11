//
//  gifCell.m
//  ImageGifAdd
//
//  Created by 王俊钢 on 2017/9/9.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "gifCell.h"

@implementation gifCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.imageGif];
        self.imageGif.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 190);
    }
    return self;
}


-(UIImageView *)imageGif
{
    if(!_imageGif)
    {
        _imageGif = [[UIImageView alloc] init];
        
    }
    return _imageGif;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
