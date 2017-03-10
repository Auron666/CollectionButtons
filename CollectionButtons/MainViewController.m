//
//  MainViewController.m
//  CollectionButtons
//
//  Created by Benjamin Kolosov on 10.03.17.
//  Copyright © 2017 Benjamin Kolosov. All rights reserved.
//

#import "MainViewController.h"
#import "CustomTableViewCell.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CustomTableViewCell *customCell;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"CollectionButtons";
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CustomTableViewCell self] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"cell";
    
    self.customCell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 255 / 255.0f green:arc4random() % 255 / 255.0f blue:arc4random() % 255 / 255.0f alpha:1.0f];
    
    if(self.customCell){
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.customCell.frame.size.width, self.customCell.frame.size.height)];
        [scrollView setBackgroundColor:randomColor];
        [self.customCell.contentView addSubview:scrollView];
        
        int x = 0;
        
        UIImage *image = [UIImage imageNamed:@"icon_smile.png"];
        CGSize imageSize = image.size;
        NSLog(@"Image Size = %@", NSStringFromCGSize(imageSize));
        
        for (int i = 1; i < 10; i++){
            UIButton *buttonItem = [[UIButton alloc] initWithFrame:CGRectMake(x, 30, 150, 40)];
            [buttonItem setTitle:[NSString stringWithFormat:@"Item %d", i] forState:UIControlStateNormal];
            [buttonItem setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 30.0, 5, 10.0)];
            [buttonItem setTag:i];
            buttonItem.layer.borderColor = [UIColor blueColor].CGColor;
            buttonItem.layer.borderWidth = 0.5;
            
            [buttonItem setImage:image forState:UIControlStateNormal];
            [buttonItem setImageEdgeInsets:UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0)];
            [buttonItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            
            
            [buttonItem addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:buttonItem];
            
            x += buttonItem.frame.size.width;
        }
        [scrollView setContentSize:CGSizeMake(x, scrollView.frame.size.height)];
    }
    
    return self.customCell;
}

- (void)btnClicked:(id)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    
    NSLog(@"Selected Button %ld into Cell %ld", [sender tag], indexPath.row + 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
