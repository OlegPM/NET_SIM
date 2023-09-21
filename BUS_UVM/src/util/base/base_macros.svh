`ifndef BASE_MACRO_SVH
`define BASE_MACRO_SVH

`define STOP `include "__stop.vi"

`define TYPE_NAME \
virtual function string typeName(); \
  ClassName cn; \
  string r; \
  cn = new($typename(this)); \
  r = cn.full_name; \
  return r; \
endfunction : typeName

`define SHORT_TYPE_NAME \
virtual function string typeName(); \
  ClassName cn; \
  string r; \
  cn = new($typename(this)); \
  r = cn.short_name; \
  return r; \
endfunction : typeName

`define TO_TEXT \
virtual function Text toText(Text parent_text = null); \
	Text this_text; \
	this_text = new(parent_text); \
	addLines(this_text); \
	return this_text; \
endfunction : toText

`define TO_STRING \
virtual function string toString(); \
	return toText().toString(); \
endfunction : toString

`define TO_PRINT \
virtual function void toPrint(I_Printer printer = null); \
  string s; \
  s = toString(); \
  if(printer == null) $display("%s", s); \
  else printer.out(s); \
endfunction : toPrint

`define DBG(E, F, M, P) if(E) begin $display("DEBUG> <%s>[%p].%s: %s", $typename(this), getName(), F, M); if(P) `include "__stop.vi"; end
`define DBG_(E, F, M, P) if(E) begin $display("DEBUG> %s: %s", F, M); if(P) `include "__stop.vi"; end

`endif 