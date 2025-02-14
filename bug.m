In Objective-C, a common yet subtle error arises when dealing with memory management and object lifecycles, especially with delegate patterns.  Consider this scenario: 

```objectivec
@interface MyDelegate : NSObject <MyProtocol> 
@property (nonatomic, weak) MyObject *myObject;
@end

@implementation MyDelegate
- (void)myProtocolMethod:(MyObject *)object {
  // ... some logic ...
  [self.myObject doSomething]; //Potential crash if myObject is deallocated
}
@end
```

The `weak` property in `MyDelegate` prevents retain cycles. However, if `myObject` is deallocated before `myProtocolMethod` is called, accessing `self.myObject` will result in a crash (EXC_BAD_ACCESS). This is more likely if `myObject`'s lifecycle is shorter than `MyDelegate`'s.  The problem is harder to track because the crash happens seemingly unrelated to the object's creation or assignment.