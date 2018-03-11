//
//  ABFCalendarController.m
//  ABigFishTV
//
//  Created by 陈立宇 on 18/3/11.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

#import "ABFCalendarController.h"
#import "AppDelegate.h"
#import "ABFCalendarRecordView.h"


@interface ABFCalendarController ()<ABFCalendarRecordViewDelegate>

@property(nonatomic,strong) ABFCalendarRecordView *calendarRecordView;

@end

@implementation ABFCalendarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *currentDate = [self getCurrentDate];
    [self setupUI];
    [self.calendarRecordView resetCalendarWithDate:currentDate];
    self.calendarRecordView.delegate = self;
    
    self.view.backgroundColor = LINE_BG;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏
    [AppDelegate APP].allowRotation = false;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.tabBarController.tabBar setHidden:YES];
    [self addNavigationBarView];
}
- (void)addNavigationBarView{
    
    self.title = @"日历";
    
    self.navigationController.navigationBar.barTintColor = COMMON_COLOR;
    //self.navigationController.navigationBar.alpha = 0.8;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(backClick:)
      forControlEvents:UIControlEventTouchUpInside];
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(10,20,60,20);
    [leftBtn setImage:[UIImage imageNamed:@"btn_nback"] forState:UIControlStateNormal];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    //[self.calendarRecordView addSubview:leftBtn];
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.calendarRecordView resetCalendarFrame];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
}

-(void)setupUI{
    ABFCalendarRecordView *calendarRecordView = [[ABFCalendarRecordView alloc] init];
    CGFloat height = (kScreenWidth/7+10)*6 + 64;
    calendarRecordView.frame =CGRectMake(0, 64, kScreenWidth, height);
    [self.view addSubview:calendarRecordView];
    _calendarRecordView = calendarRecordView;
}


- (NSDate *)getCurrentDate
{
    NSDate *date = [NSDate date];
    return date;
}

- (void)resetCalendar
{
    // 用户登录或者退出时，日历界面的跑步数据刷新。
    NSDate *currentDate = [self getCurrentDate];
    [self.calendarRecordView resetCalendarWithDate:currentDate];
}

#pragma mark - ABFCalendarRecordViewDelegate

- (void)calendarRecordDidSelectedDate:(NSDate *)date
{
    
}

-(void)backClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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