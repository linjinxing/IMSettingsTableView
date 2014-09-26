//
//  IMControlAction.h
//  iMove
//
//  Created by linjinxing on 7/31/14.
//  Copyright (c) 2014 iMove. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^IMControlAction)(id sender, id value, UIControlEvents events);

@protocol IMControlActionHandler <NSObject>
@property(nonatomic, copy)IMControlAction actionHandler;
@end
