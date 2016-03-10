structure tigerassem =
struct

type reg = string
type temp = tigertemp.temp
type label = tigertemp.label
    
datatype instr = OPER of {assem:string, src:temp list, dst:temp list, jump:label list option }
               | LABEL of {assem:string, lab:label}
               | MOVE of {assem:string, src:temp, dst:temp}

  fun format saytemp =
    let 
	    fun speak assem dst src jmp =
	        let fun iL l x = List.nth(l,ord x - ord #"0")
                fun saylab s = s
		        fun f(#"'":: #"s":: i::rest) = saytemp(iL src i) ^ f rest
		          | f( #"'":: #"d":: i:: rest) = saytemp(iL dst i) ^ f rest
		          | f( #"'":: #"j":: i:: rest) = saylab(iL jmp i) ^ f rest
		          | f( #"'":: #"'":: rest) = "`" ^ f rest
		          | f( #"'":: _ :: rest) = raise Fail "bad Assem format"
		          | f(c :: rest) = Char.toCString c ^ f rest
		          | f [] = ""
	        in f(explode assem) end
    in fn OPER{assem,dst,src,jump} => "\t" ^ speak assem dst src (getOpt(jump, []))
	      | LABEL{assem,...} => assem
	      | MOVE{assem,dst,src} => if ((saytemp dst) = (saytemp src)) then "" else "\t" ^ speak assem [dst] [src] []
    end

  fun assemToString (OPER {assem,dst,src,jump=NONE}) = "OPER: "^assem^" D:["^(String.concatWith "," dst)^"] S:["^(String.concatWith "," src)^"]"
    | assemToString (OPER {assem,dst,src,jump=SOME j}) = "OPER: "^assem^" D:["^(String.concatWith "," dst)^"] S:["^(String.concatWith "," src)^"] J:["^(String.concatWith "," j)^"]"
    | assemToString (MOVE {assem,dst,src}) = "MOVE: "^assem^" D:"^dst^" S:"^src^""
    | assemToString (LABEL {lab,...}) = "LABEL: "^lab^""

end
