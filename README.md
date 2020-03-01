# Recerse poland notation calculator

Pretty simple application which implement Reverse poland notation calculator.     

Please use Ruby not less than 2.6.

- Implemented four operations: + - / *
- Use space as delimiter for digits and operators.
- Use enter as end of input.
- Use a ```q``` command or an end of input indicator (EOF / Ctrl+D) for exit.
- We can't divide to zero.

## Run application

1. Download or clone application from git
2. run application like:   
``` ruby calculator.rb```

## Use application

```
╰─➤  ruby calculator.rb
Reverse polish notation calculator.
> 2 3 +
[5]
> 4 /
[1.25]
> 8
[1.25, 8]
> *
[10.0]
> 6 5 4 / -
[10.0, 4.75]
> q
╰─➤
```



