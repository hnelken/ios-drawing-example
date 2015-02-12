//
//  ViewController.m
//  Custom Pedigree
//
//  Created by Harry Nelken on 12/1/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize healthy, horizontal, male, line;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    line = NO;
    male = YES;
    healthy = YES;
    horizontal = YES;
    
    self.maleButton.tintColor = [UIColor blueColor];
    self.lineButton.tintColor = [UIColor blackColor];
    self.femaleButton.tintColor = [UIColor blackColor];
    
    self.pedView.lines = [NSMutableArray array];
    self.pedView.sickShapes = [NSMutableArray array];
    self.pedView.healthyShapes = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedStatus:(id)sender {
    if ([self.statusButton.title isEqualToString:@"Not Sick"]) {
        self.statusButton.title = @"Sick";
        healthy = NO;
    }
    else {
        self.statusButton.title = @"Not Sick";
        healthy = YES;
    }
}

- (IBAction)tappedMale:(id)sender {
    if (!male && !line) {
        male = YES;
        self.maleButton.tintColor = [UIColor blueColor];
        self.femaleButton.tintColor = [UIColor blackColor];
    }
    else if (line) {
        line = NO;
        male = YES;
        self.maleButton.tintColor = [UIColor blueColor];
        self.lineButton.tintColor = [UIColor blackColor];
    }
}

- (IBAction)tappedFemale:(id)sender {
    if (male && !line) {
        male = NO;
        self.femaleButton.tintColor = [UIColor blueColor];
        self.maleButton.tintColor = [UIColor blackColor];
    }
    else if (line) {
        line = NO;
        male = NO;
        self.femaleButton.tintColor = [UIColor blueColor];
        self.lineButton.tintColor = [UIColor blackColor];
    }
}

- (IBAction)tappedLine:(id)sender {
    if (!line) {
        if (male) {
            self.maleButton.tintColor = [UIColor blackColor];
        }
        else {
            self.femaleButton.tintColor = [UIColor blackColor];
        }
        self.lineButton.tintColor = [UIColor blueColor];
        line = YES;
    }
}

- (IBAction)tappedDir:(id)sender {
    if ([self.dirButton.title isEqualToString:@"Hor."]) {
        self.dirButton.title = @"Vert.";
        horizontal = NO;
    }
    else {
        self.dirButton.title = @"Hor.";
        horizontal = YES;
    }
}

- (IBAction)singleTap:(id)sender {
    if (!line) {
        UIBezierPath *path;
        CGPoint point = [sender locationInView:self.pedView];
        if (male) {
            path = [UIBezierPath bezierPathWithRect:CGRectMake(point.x - 25, point.y - 25, 50, 50)];
        }
        else {
            path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(point.x - 25, point.y - 25, 50, 50)];
        }
        if (healthy) {
            [self.pedView.healthyShapes addObject:path];
        }
        else {
            [self.pedView.sickShapes addObject:path];
        }
        [[self pedView] setNeedsDisplay];
    }
}

- (IBAction)panGesture:(id)sender {
    if (line) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
        if (pan.state == UIGestureRecognizerStateBegan) {
            UIBezierPath *path = [UIBezierPath bezierPath];
            CGPoint start = [pan locationInView:pan.view];
            [path moveToPoint:start];
            [self.pedView.lines addObject:path];
        }
        else if (pan.state == UIGestureRecognizerStateEnded) {
            CGPoint end = [pan locationInView:pan.view];
            if (horizontal) {
                UIBezierPath *path = [self.pedView.lines objectAtIndex:[self.pedView.lines count] - 1];
                [path addLineToPoint:CGPointMake(end.x, path.currentPoint.y)];
            }
            else {
                UIBezierPath *path = [self.pedView.lines objectAtIndex:[self.pedView.lines count] - 1];
                [path addLineToPoint:CGPointMake(path.currentPoint.x, end.y)];
            }
            [self.pedView setNeedsDisplay];
        }
    }
}


@end
