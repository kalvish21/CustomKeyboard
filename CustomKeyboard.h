//
//  CustomKeyboard.h
//
//  Created by Kalyan Vishnubhatla on 10/9/12.
//
//

#import <Foundation/Foundation.h>

// Protocol for classes using this
@protocol CustomKeyboardDelegate
- (void)nextClicked:(NSUInteger)selectedId;
- (void)previousClicked:(NSUInteger)selectedId;
- (void)doneClicked:(NSUInteger)selectedId;
@end

@interface CustomKeyboard : NSObject {
    id<CustomKeyboardDelegate> delegate;
    NSUInteger currentSelectedTextboxIndex;
}

@property (nonatomic, strong) id<CustomKeyboardDelegate> delegate;
@property (nonatomic) NSUInteger currentSelectedTextboxIndex;

- (UIToolbar *)getToolbarWithPrevNextDone:(BOOL)prevEnabled :(BOOL)nextEnabled;
- (UIToolbar *)getToolbarWithDone;

@end
