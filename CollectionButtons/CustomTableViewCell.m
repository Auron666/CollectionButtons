//
//  CustomTableViewCell.m
//  CollectionButtons
//
//  Created by Benjamin Kolosov on 10.03.17.
//  Copyright © 2017 Benjamin Kolosov. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"Self = %@", self);
    }
    return self;
}



@end
