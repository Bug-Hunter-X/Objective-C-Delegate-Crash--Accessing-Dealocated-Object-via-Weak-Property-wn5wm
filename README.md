# Objective-C Delegate Crash: Accessing Deallocated Object via Weak Property

This repository demonstrates a common Objective-C bug involving crashes due to accessing deallocated objects through weak properties within delegate methods.  The issue is subtle and often difficult to debug because the crash site may seem unrelated to the object's initial creation or assignment.

## The Problem

The example code showcases a scenario where a delegate holds a weak reference to an object. If the object is deallocated before the delegate method is called, accessing the weak property results in a crash (EXC_BAD_ACCESS).

## Solution

The solution involves carefully managing object lifecycles and ensuring that the object referenced by the weak property remains valid throughout the delegate's execution.  This could involve additional checks, using strong references during critical sections, or restructuring the delegate pattern entirely for better lifetime control.