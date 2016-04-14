//
//  ViewController.m
//  选择生日-键盘处理
//
//  Created by  江苏 on 16/4/14.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIDatePicker* dataPicker;
@property(nonatomic,strong)UITextField* birthTF;
@property(nonatomic,strong)UIToolbar* textFieldToolbar;
@end

@implementation ViewController

-(UIDatePicker *)dataPicker{
    if (_dataPicker==nil) {
        
        _dataPicker=[[UIDatePicker alloc]init];
        //设置显示模式，只显示日期
        _dataPicker.datePickerMode=UIDatePickerModeDate;
        //本地化
        _dataPicker.locale=[NSLocale localeWithLocaleIdentifier:@"zh"];
    }
    return _dataPicker;
}

-(UIView *)textFieldToolbar{
    if (_textFieldToolbar==nil) {
        
        _textFieldToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        _textFieldToolbar.backgroundColor=[UIColor grayColor];
        //设置按钮
        UIBarButtonItem* preBtn=[[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem* nextBtn=[[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem* fixSpaceBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] ;
        UIBarButtonItem* doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishChoose)];
        
        _textFieldToolbar.items=@[preBtn,nextBtn,fixSpaceBtn,doneBtn];
        }
    return _textFieldToolbar;
}
-(UITextField *)birthTF{
    if (_birthTF==nil) {
        _birthTF=[[UITextField alloc]initWithFrame:CGRectMake(60, 60, 200, 30)];
        _birthTF.borderStyle=UITextBorderStyleRoundedRect;
        //设置文本输入框的输入辅助视图为自定义的视图
        _birthTF.inputAccessoryView=self.textFieldToolbar;
        //设置文本输入框的输入视图为自定义的dataPicker;
        _birthTF.inputView=self.dataPicker;
        [self.view addSubview:_birthTF];
    }
    return _birthTF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 40, 30)];
    label.text=@"生日";
    [self.view addSubview:label];
    [self birthTF];
}

-(void)finishChoose{
    //获取时间
    NSDate* choosedDate=self.dataPicker.date;
    //设置日期格式
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yyyy-MM-dd";
    
    NSString* dateStr=[formatter stringFromDate:choosedDate];
    
    self.birthTF.text=dateStr;
    
    [self.birthTF resignFirstResponder];
    
}


@end
