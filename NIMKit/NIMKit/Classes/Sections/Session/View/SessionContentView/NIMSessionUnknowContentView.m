//
//  NIMSessionUnknowContentView.h
//  NIMKit
//
//  Created by chris on 15/3/9.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NIMSessionUnknowContentView.h"
#import "M80AttributedLabel+NIMKit.h"
#import "UIView+NIM.h"
#import "NIMMessageModel.h"
#import "NIMKit.h"
#import "NSString+NIMKit.h"
#import "NIMGlobalMacro.h"
#import "UIColor+NIMKit.h"


@interface NIMSessionUnknowContentView()

@property (nonatomic,strong) UILabel *label;

@end

@implementation NIMSessionUnknowContentView

-(instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.backgroundColor = [UIColor clearColor];
        _label.userInteractionEnabled = NO;
        [self addSubview:_label];
    }
    return self;
}

- (void)refresh:(NIMMessageModel *)data{
    [super refresh:data];
    NSString *text = @"请在电脑端查看".nim_localized;
    
    NIMKitSetting *setting = [[NIMKit sharedKit].config setting:data.message];

    self.label.textColor = setting.textColor;
    self.label.font = setting.font;
    [self.label setText:text];
    [self.label sizeToFit];

    [self setBackgroundColor: [UIColor colorWithHex:0xEDF0F4 alpha:1]];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _label.nim_centerX = self.nim_width  * .5f;
    _label.nim_centerY = self.nim_height * .5f;
}

@end
