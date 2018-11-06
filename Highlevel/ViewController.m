//
//  ViewController.m
//  Highlevel
//
//  Created by Eleven on 2018/10/31.
//  Copyright © 2018 Eleven. All rights reserved.
//

#import "ViewController.h"
#import "IndexedTableView.h"
#import "Phone.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource, IndexedTableViewDataSource>
{
    IndexedTableView *tableView;
    UIButton *button;
    NSMutableArray *dataSource;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[IndexedTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;

    tableView.indexedDataSource = self;
    [self.view addSubview:tableView];

    Phone *p = [[Phone alloc] init];
    
    // 数据源
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"%d",i]];
    }
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)rightbtn:(id)sender {
    [tableView reloadData];
}

- (NSArray<NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView{
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K"];
    }else{
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
    }
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

@end
