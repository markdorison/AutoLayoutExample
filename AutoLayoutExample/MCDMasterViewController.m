//
//  MCDMasterViewController.m
//  AutoLayoutExample
//
//  Created by Mark Dorison on 1/31/14.
//  Copyright (c) 2014 MCD. All rights reserved.
//

#import "MCDMasterViewController.h"
#import "MCDDetailViewController.h"
#import "MCDExampleCell.h"

static NSString *const MCDExampleCellIdentifier = @"ExampleCell";

@interface MCDMasterViewController ()

@property (nonatomic, strong) NSArray *objects;

@end

@implementation MCDMasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self registerTableCellNib];

    self.objects = @[@{@"title": @"Cell1 Title",
                       @"detailLabelText": @"Single-line detail."},
                     @{@"title": @"Cell2 Title",
                       @"detailLabelText": @"Multi-line detail spanning the height of two rows."}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerTableCellNib {
    [self.tableView registerNib:[UINib nibWithNibName:@"MCDExampleCell" bundle:nil] forCellReuseIdentifier:MCDExampleCellIdentifier];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:MCDExampleCellIdentifier];

    NSDictionary *object = self.objects[indexPath.row];
    cell.cellObject = object;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:MCDExampleCellIdentifier];
    NSDictionary *object = self.objects[indexPath.row];
    cell.cellObject = object;
    [cell.contentView setNeedsLayout];
    [cell.contentView layoutIfNeeded];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    NSLog(@"Cell height: %f", height);
    return height;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
