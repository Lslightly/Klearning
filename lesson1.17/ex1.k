module EX1
	imports INT
	syntax Stmts ::= List{Stmt, ""}
    syntax Stmt ::= "enable" | "increment" | "decrement" | "disable"
    configuration 	<k>$PGM:Stmts</k>
    				<optional multiplicity="?"> . </optional>
    rule <k> S:Stmt Ss:Stmts => S ~> Ss ... </k>
	rule <k> .Stmts => . ...</k>
    rule <k> enable => . ...</k>
    		 (.Bag => <optional>0</optional>)
    rule <k> disable => . ...</k>
    		 (<optional>_</optional> => .Bag)
    rule <k> increment => . ...</k>
    		 (<optional>I:Int</optional> => <optional>I +Int 1</optional>)
    rule <k> decrement => . ...</k>
    		 (<optional>I:Int</optional> => <optional>I -Int 1</optional>)
endmodule