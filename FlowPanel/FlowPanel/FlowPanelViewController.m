//
//  FlowPanelViewController.m
//  FlowPanel
//
//  Created by Deerwalk on 5/2/13.
//  Copyright (c) 2013 ujjwal. All rights reserved.
//

#import "FlowPanelViewController.h"


@interface FlowPanelViewController ()

@end

@implementation FlowPanelViewController
@synthesize subViewSpacing;
@synthesize orientation;
@synthesize margin;
@synthesize resizeSubView;

-(void)addSubView:(UIView *)view {
    [self.view addSubview:view];
    [self relocateSubView:view];
}

-(void)relocateSubView : (UIView*) view {
    
    if(currentLeft == 0.0f)
        currentLeft = margin.x;
    if(currentTop == 0.0f)
        currentTop = margin.y;
    
    CGRect currentFrame = view.frame;
    float fullWidth = self.view.frame.size.width - margin.x - margin.x1;
    float fullHeight = self.view.frame.size.height - margin.y - margin.y1;
    
    CGRect newFrame ;
    if(!isFirst) {
        currentTop += self.subViewSpacing.y;
        currentLeft += self.subViewSpacing.x;
    }
    if(self.orientation == Vertical) {
        if(self.resizeSubView)
            newFrame = CGRectMake(margin.x, currentTop, fullWidth, currentFrame.size.height);
        else
            newFrame = CGRectMake(margin.x, currentTop, currentFrame.size.width, currentFrame.size.height);
    }
    else if(self.orientation == Horizontal) {
        if(self.resizeSubView)
            newFrame = CGRectMake(currentLeft, margin.y, currentFrame.size.width, fullHeight);
        else
            newFrame = CGRectMake(currentLeft, margin.y, currentFrame.size.width, currentFrame.size.height);
    }
    [view setFrame:newFrame];
    currentLeft += currentFrame.size.width;// + margin.x;
    currentTop+= currentFrame.size.height;// + margin.y;
    
    if(self.orientation == Vertical)
        [(UIScrollView*)self.view setContentSize:CGSizeMake(self.view.frame.size.width, currentTop + margin.y1 )];
    else if(self.orientation == Horizontal)
        [(UIScrollView*)self.view setContentSize:CGSizeMake(currentLeft + margin.x1, self.view.frame.size.height  )];
    isFirst = NO;
    [view setNeedsDisplay];
}

-(void)reloadViews {
    currentLeft = 0.0f;
    currentTop = 0.0f;
    
    if(self.orientation == None) {
        return;
    }
    isFirst = YES;
    for(UIView* view in [self.view subviews]) {
        [self relocateSubView:view];
    }
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

-(id)initWithFrame : (CGRect) frame {
    self = [super init];
    if(self) {
        [self initialize : frame];
    }
    return  self;
}
-(void)initialize  : (CGRect) frame{
    self.view = [[UIScrollView alloc] init];
    self.orientation = None;
    self.margin = [FlowPanelViewController CGRectPointMake:20:20:20:20];
    self.subViewSpacing = CGPointMake(10,10);
    currentLeft = 0;
    currentTop = 0;
    self.resizeSubView = NO;
    [self.view setFrame: frame];
    isFirst = YES;
}

-(void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(CGRectPoint)CGRectPointMake : (float)x : (float)y : (float)x1 : (float)y1 {
    CGRectPoint point;
    point.x = x;
    point.y = y;
    point.x1 = x1;
    point.y1 = y1;
    return point;
}

@end
