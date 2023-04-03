requires "lesson-22.k"
// what does domain.md mean here
requires "domains.md"

module LESSON-22-SPEC-SYNTAX
    imports LESSON-22-SYNTAX

    syntax Id ::= "$a" [token] | "$b" [token] | "$c" [token] | "$s" [token] | "$n" [token] | "$sum" [token] | "$log2" [token]

endmodule

module VERIFICATION
    imports K-EQUAL
    imports LESSON-22-SPEC-SYNTAX
    imports LESSON-22
    imports MAP-SYMBOLIC

    rule { M:Map [K <- V] #Equals M [K <- V']} => {V #Equals V'} [simplification]
    rule maxInt (A:Int, B:Int) => A requires A >=Int B [simplification]
    rule maxInt (A:Int, B:Int) => B requires A <Int B [simplification]

endmodule

module LESSON-22-SPEC
    imports VERIFICATION

    claim <k> 3 + 4 => 7 ...</k>
    claim <k>   if ( 3 + 4 != 7 ) {
                    $a = 1;
                } else {
                    $a = 2;
                }
                => . ...
            </k>
            <store>
                STORE => STORE [$a <- 2]
            </store>
    
    claim   <k>
                $a = A:Int ; $b = B:Int ;
                if ($a < $b) {
                    $c = $b;
                } else {
                    $c = $a;
                }
                => . ...
            </k>
            <store>
                STORE => STORE [$a <- A] [$b <- B] [$c <- ?C:Int]
            </store>
            ensures (?C ==Int A) orBool (?C ==Int B)
    
    claim   <k>
                $a = A:Int ; $b = B:Int ;
                if ($a < $b) {
                    $c = $b;
                } else {
                    $c = $a;
                }
                => . ...
            </k>
            <store>
                STORE => STORE [$a <- A] [$b <- B] [$c <- ?C:Int]
            </store>
            ensures (?C ==Int maxInt(A, B))
    
    claim   <k>
                while ( 0 < $n ) {
                    $s = $s + $n;
                    $n = $n - 1;
                }
                => . ...
            </k>
            <store>
                $s |-> (S:Int => S +Int ((N +Int 1) *Int N /Int 2))
                $n |-> (N:Int => 0)
            </store>
            requires N >=Int 0

    claim   <k>
                while (0 < $b) {
                    $a = $a + $c;
                    $b = $b - 1;
                    $c = $c - 1;
                }
                => . ...
            </k>
            <store>
                $b |-> (S:Int => 0)
                $c |-> (Sc:Int => Sc -Int S)
                $a |-> (Sa:Int => Sa +Int ((Sc +Int Sc -Int S +Int 1) *Int S /Int 2))
            </store>
            requires S >=Int 0
    
    claim   <k>
                def $sum($n, .Ids) {
                    $s = 0;
                    while (0 < $n) {
                        $s = $s + $n;
                        $n = $n - 1;
                    }
                    return $s;
                }

                $s = $sum(N:Int, .Ints);
            => . ...
            </k>
            <funcs> .Map => ?_ </funcs>
            <store> $s |-> (_ => ((N +Int 1) *Int N /Int 2))</store>
            <stack>.List</stack>
            requires N >=Int 0
    
    claim   <k>
                def $log2($n, .Ids) {
                    $a = 0;
                    while ($n > 1) {
                        $n = $n / 2;
                        $a = $a + 1;
                    }
                    return $a;
                }
                $s = $log2(N:Int, .Ints);
                => . ...
            </k>
            <funcs> .Map => ?_</funcs>
            <store> $s |-> (_ => log2Int (N))</store>
            requires N >Int 1

endmodule