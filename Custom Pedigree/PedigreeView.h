//
//  PedigreeView.h
//  Custom Pedigree
//
//  Created by Harry Nelken on 12/1/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PedigreeView : UIView

@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic, strong) NSMutableArray *sickShapes;
@property (nonatomic, strong) NSMutableArray *healthyShapes;

@end
