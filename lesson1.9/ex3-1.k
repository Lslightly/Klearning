module EX3-1
  imports BOOL

  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3), colors(blue, blue)] | "{" "}" [format(%1%2), colors(blue, blue)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%c%3%4 %5), colors(red, blue, yellow, blue)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%c%3%4 %5 %6 %7), colors(red, blue, yellow, blue, red)]
endmodule