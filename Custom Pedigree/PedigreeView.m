//
//  PedigreeView.m
//  Custom Pedigree
//
//  Created by Harry Nelken on 12/1/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import "PedigreeView.h"

@implementation PedigreeView
@synthesize lines, sickShapes, healthyShapes;


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [[UIColor blackColor] setStroke];
    for (UIBezierPath *line in lines) {
        line.lineWidth = 3;
        [line stroke];
    }

    [[UIColor blackColor] setFill];
    for (UIBezierPath *shape in sickShapes) {
        [shape fill];
    }
    
    [[UIColor redColor] setFill];
    for (UIBezierPath *shape in healthyShapes) {
        [shape fill];
    }
    
}


@end
