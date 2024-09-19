//
//  FFIHelper.m
//  Example
//
//  Created by 杨萧玉 on 2024/9/19.
//

#import "FFIHelper.h"

@implementation FFIHelper

#define SINT(type) do { \
    if (str[0] == @encode(type)[0]) { \
        if (sizeof(type) == 1) { \
            return &ffi_type_sint8; \
        } else if (sizeof(type) == 2) { \
            return &ffi_type_sint16; \
        } else if (sizeof(type) == 4) { \
            return &ffi_type_sint32; \
        } else if (sizeof(type) == 8) { \
            return &ffi_type_sint64; \
        } else { \
            NSLog(@"Unknown size for type %s", #type); \
            abort(); \
        } \
    } \
} while(0)

#define UINT(type) do { \
    if (str[0] == @encode(type)[0]) { \
        if (sizeof(type) == 1) { \
            return &ffi_type_uint8; \
        } else if (sizeof(type) == 2) { \
            return &ffi_type_uint16; \
        } else if (sizeof(type) == 4) { \
            return &ffi_type_uint32; \
        } else if (sizeof(type) == 8) { \
            return &ffi_type_uint64; \
        } else { \
            NSLog(@"Unknown size for type %s", #type); \
            abort(); \
        } \
    } \
} while(0)

#define INT(type) do { \
    SINT(type); \
    UINT(unsigned type); \
} while(0)

#define COND(type, name) do { \
    if (str[0] == @encode(type)[0]) {\
        return &ffi_type_ ## name; \
    } \
} while(0)

#define PTR(type) COND(type, pointer)

+ (ffi_type *)ffiTypeForEncode:(const char *)str {
    SINT(_Bool);
    SINT(signed char);
    UINT(unsigned char);
    INT(short);
    INT(int);
    INT(long);
    INT(long long);
    
    PTR(id);
    PTR(Class);
    PTR(SEL);
    PTR(void *);
    PTR(char *);
    
    COND(float, float);
    COND(double, double);
    COND(void, void);
    
    // Ignore Method Encodings
    switch (*str) {
        case 'r':
        case 'R':
        case 'n':
        case 'N':
        case 'o':
        case 'O':
        case 'V':
            return [self ffiTypeForEncode:str + 1];
    }
    
    // Struct Type Encodings
    if (*str == '{') {
        // TODO:
        return nil;
    }
    
    NSLog(@"Unknown encode string %s", str);
    return nil;
}

+ (size_t)ffiSizeForEncode:(NSString *)encodeString {
    return [self ffiTypeForEncode:encodeString.UTF8String]->size;
}

@end
