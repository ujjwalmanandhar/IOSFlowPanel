//
//  ViewController.m
//  FlowPanel
//
//  Created by Deerwalk on 5/2/13.
//  Copyright (c) 2013 ujjwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize hFlowPanel;
@synthesize vflowPanel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.vflowPanel = [[FlowPanelViewController alloc] initWithFrame:CGRectMake(100,100,400,500)];
    [vflowPanel setOrientation:Vertical];
   
    for(int i = 0;i<=10;i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:@"Buttons" forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(0, 0,i+100, 60)];
        [vflowPanel addSubView:btn];
    }
    [vflowPanel.view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:vflowPanel.view];
    
    
    self.hFlowPanel = [[FlowPanelViewController alloc] initWithFrame:CGRectMake(520,100,400,100)];
    self.hFlowPanel.resizeSubView = YES;
    [hFlowPanel setOrientation:Horizontal];
    [hFlowPanel setMargin:[FlowPanelViewController CGRectPointMake:5:5:5:5]];
    for(int i = 0;i<=10;i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(0, 0,50, i+50)];
        [hFlowPanel addSubView:btn];
    }
    [hFlowPanel.view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:hFlowPanel.view];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
