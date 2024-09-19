//
//  FFIHelper.h
//  Example
//
//  Created by 杨萧玉 on 2024/9/19.
//

#import <Foundation/Foundation.h>
@import libffi;

NS_ASSUME_NONNULL_BEGIN

@interface FFIHelper : NSObject

+ (size_t)ffiSizeForEncode:(NSString *)encodeString;

@end

NS_ASSUME_NONNULL_END
