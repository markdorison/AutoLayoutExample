//
//  MCDExampleCell.m
//  AutoLayoutExample
//
//  Created by Mark Dorison on 1/31/14.
//  Copyright (c) 2014 MCD. All rights reserved.
//

#import "MCDExampleCell.h"

static NSString *const MCDOptionalLabelText = @"Optional Label Populated";

@interface MCDExampleCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailLabel;
@property (nonatomic, weak) IBOutlet UILabel *optionalLabel;

@property (nonatomic, weak) NSLayoutConstraint *optionalLabelHeightConstraint;

@end

@implementation MCDExampleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    self.detailLabel.preferredMaxLayoutWidth = 234.0;
}

- (void)setCellObject:(NSDictionary *)cellObject {
    if (_cellObject != cellObject) {
        _cellObject = cellObject;

        [self configureCellContent];

        [self.contentView setNeedsLayout];
        [self.contentView layoutIfNeeded];
    }
}

- (void)layoutSubviews {
    if ([self.optionalLabel.text isEqualToString:@""]) {
        self.optionalLabelHeightConstraint = nil;
        self.optionalLabelHeightConstraint = [NSLayoutConstraint constraintWithItem:self.optionalLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:0.0f];
        self.optionalLabelHeightConstraint.priority = 1000;
        [self.optionalLabel addConstraint:self.optionalLabelHeightConstraint];
    }
    else {
        self.optionalLabelHeightConstraint = nil;
    }
}

- (void)configureCellContent {
    self.titleLabel.text = [self.cellObject valueForKey:@"title"];
    self.detailLabel.text = [self.cellObject valueForKey:@"detailLabelText"];
}

- (IBAction)didTapActionButton:(id)sender {
    if ([self.optionalLabel.text isEqualToString:@""]) {
        self.optionalLabel.text = MCDOptionalLabelText;
    }
    else {
        self.optionalLabel.text = @"";
    }
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}


@end
