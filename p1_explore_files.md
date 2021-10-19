# How Do You Create a Tweak?

## Exploring The Tweak Files

Please open your text editor of choice to your tweak folder. 

```
.
├── Makefile
├── Tweak.x
├── control
└── testtweak.plist
```

This is what your file structure in the folder should look like. The `.plist` file may have a different name depending on the tweak name you chose, but the rest should be the same. Let's take a deeper dive into what each file is.

## `Makefile`
This file essentially has some information about the tweak — `TARGET`, for example, contains the target operating system that you can choose. Another example would be `ARCHS` which have a dozen or so values you can choose from, but you will most likely use `arm64`, (every iPhone before the Xs series and after iOS 6) and `arm64e`, (every iPhone after and including the Xs series). 

## `Tweak.x`
This file is the most "important" out of these four. This is where you write all your code. This code will be written in the language called <a href="https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html">Objective-C</a>, however you could use <a href="https://orion.theos.dev">Orion</a> to utilize <a href="https://developer.apple.com/swift/">Swift</a> instead.

## `control`
This file contains the information about your tweak that will be displayed to the end-user when they try to install your tweak. Things like the name of the developer, what iOS version it supprorts, etc.

## `testtweak.plist`
This file contains what the tweak will be hooking/injecting into. This won't be touched much, compared to the other files, but it does exist and is also important.

<a href="https://github.com/NightwindDev/Tweak-Tutorial/blob/main/readme.md">Previous Page (Setting Up The Tweak)</a>