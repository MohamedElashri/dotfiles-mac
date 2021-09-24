# VSCode-Language-FHiCL
 FHiCL language support for Visual Studio Code

## Background 
I'm working on the NOvA experiment at Fermilab, During my MS years at UMD, I have used Atom as my editor on ubuntu instance. After some time I started to hate atom performance and it being electron-based software did not help with that. So I decided to move to VScode for the main development environment that I have a complex integration with my machine on Fermilab. I work regularly on developing code on ART software using C++ and *FHiCL* language which developed as a common language for configuring scientific applications inside many HEP experiments. My friend [Justin vessel](https://github.com/justinvasel) developed a syntax package for this language for [Atom](https://github.com/justinvasel/atom-language-fhicl) but with my move to VScode, I wanted something similar. Thanks to Justin for his initiative and continuous support.

## Installation 
It is available on [VSCode marketplace](https://marketplace.visualstudio.com/items?itemName=muhammadelashri.FHiCL) and you install manually by downloading extension from [release section](https://github.com/MohamedElashri/VSCode-Language-Fhicl/releases) and add the folder to VS Code extensions folder. 
Better way is to open the terminal and run that (assuming you have git installed) 

### MAC OS
```
git clone https://github.com/MohamedElashri/VSCode-Language-Fhicl $HOME/.vscode/extensions/VSCode-Language-Fhicl
```

### Linux
```
git clone https://github.com/MohamedElashri/VSCode-Language-Fhicl $HOME/.vscode/extensions/VSCode-Language-Fhicl
```


### Windows 
```
git clone https://github.com/MohamedElashri/VSCode-Language-Fhicl %USERPROFILE%\.vscode\extensions\VSCode-Language-Fhicl
```

*I doubt if anyone is using windows in our community for development anymore*


## Resources to help 
I have learned a lot of things about how to create a syntax package for VScode mainly from the following sources: 

- [VSCode official Syntax Highlight Guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)
- [VSCode official Syntax theming Guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)
- [StackOverFlow](https://stackoverflow.com/)
 1. [Create Custom Language in Visual Studio Code](https://stackoverflow.com/questions/30687783/create-custom-language-in-visual-studio-code)
 2. [Creating Visual Studio Code extension for syntax highlighting of a custom language](https://stackoverflow.com/questions/43456813/creating-visual-studio-code-extension-for-syntax-highlighting-of-a-custom-langua)
