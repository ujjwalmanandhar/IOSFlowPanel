//
//  FlowPanelViewController.h
//  FlowPanel
//
//  Created by Deerwalk on 5/2/13.
//  Copyright (c) 2013 ujjwal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum kFlowPanelOrientation {
    Vertical = 1,
    Horizontal = 2,
    None = 0
} kFlowPanelOrientation;

typedef struct CGRectPoint {
    float x;
    float y;
    float x1;
    float y1;
} CGRectPoint;

@interface FlowPanelViewController : UIViewController {
    float currentTop;
    float currentLeft;
    BOOL isFirst;
}

@property (nonatomic) BOOL resizeSubView ;
@property (nonatomic) struct CGRectPoint margin;
@property (nonatomic) enum kFlowPanelOrientation orientation;
@property (nonatomic) CGPoint subViewSpacing;

-(void)relocateSubView : (UIView*) view;
-(id)initWithFrame : (CGRect) frame;
-(void)initialize : (CGRect)frame;
-(void)addSubView : (UIView*) view;
-(void)reloadViews;
+(CGRectPoint)CGRectPointMake : (float)x : (float)y : (float)x1 : (float)y1;
@end
