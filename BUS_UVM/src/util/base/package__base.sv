package base_pkg;

	const string CLASS_NAME_START               = "class "  ;
	const string CLASS_NAME_PACKAGE_SEPARATOR   = "::"      ;
	const string CLASS_NAME_PARAMETER_OPEN      = " #("     ;
	const string CLASS_NAME_PARAMETER_CLOSE     = ")"       ;

	const string TEXT_TAB	  = "  ";
	const int TEXT_DEPTH_ALL  =   -1;
	const int LINE_LENGTH_MAX = 30;//180;

//	typedef class   ClassName   ;

	`include "base_macros.svh"

	parameter bit RESUME_ON_ERROR = 0;
	
	typedef enum bit {FALSE = 0, TRUE = 1} boolean_e;

	typedef boolean_e boolean	;
	
	typedef byte    chr_t       ;
	typedef chr_t   chr_p[2]    ;
	typedef chr_t   chr_q[$]    ;

	typedef byte    byte_a[]    ;
	typedef byte    byte_p[2]   ;
	typedef byte    byte_q[$]   ;
	typedef byte_a  byte_aa[]   ;
	typedef byte_q  byte_qq[$]  ;

	typedef int     int_a[]     ;
	typedef int     int_p[2]    ;
	typedef int     int_q[$]    ;

	typedef longint long_a[]    ;
	typedef longint long_p[2]   ;
	typedef longint long_q[$]   ;

	typedef string  str_a[]     ;
	typedef string  str_p[2]    ;
	typedef string  str_q[$]    ;
	typedef str_q   str_qq[$]   ;

	const int KILO_FACTOR = 10;
	const int MEGA_FACTOR = 20;
	const int GIGA_FACTOR = 30;
	const int TERA_FACTOR = 40;
	const int PETA_FACTOR = 50;

	const longint ONE  = 1;
	const longint KILO = 1 << KILO_FACTOR;
	const longint MEGA = 1 << MEGA_FACTOR;
	const longint GIGA = 1 << GIGA_FACTOR;
	const longint TERA = 1 << TERA_FACTOR;
	const longint PETA = 1 << PETA_FACTOR; // 1 << 50

	const string    TYPE_NAME_OPEN      	= "<"	;
	const string    TYPE_NAME_CLOSE     	= ">"	;

	const string    OBJECT_NAME_OPEN    	= "{"	;
	const string    OBJECT_NAME_CLOSE   	= "}"	;

	const string    OBJECT_INDEX_OPEN		= "["	;
	const string    OBJECT_INDEX_CLOSE		= "]"	;

	const string    OBJECT_NAME_DELIMITER	= "_"	;
	const int       OBJECT_NAME_INDEX_LIMIT	= 3		;

//	typedef class   CharacterSet;
//	typedef class   WhiteSpaces ;
//	typedef class   Letters     ;
//	typedef class   Digits      ;
//
//	typedef class   I_Printer   ; // to consol or file (URL ? like Java stream)
//	typedef class   I_Printable ;
//	typedef class   I_Text      ;
//	typedef class   I_Object    ;
//	typedef class   I_Part      ;
//	typedef class   I_GlobalPart;
//
//
//	typedef class   A_Void      ;
//	typedef class   A_Wrapper   ;
//	typedef class   A_Entry     ;
//
//	typedef class   Double      ;
//	typedef class   Byte        ;
//	typedef class   Integer     ;
//	typedef class   Long        ;
//	typedef class   String      ; // extended wrapper
//
//	typedef class   Text        ; // to define Object toString() using Text lines
//
//	typedef Text    txt_q[$]    ;
//
//	typedef class   Exception   ;
//	typedef class   Object      ;
//	typedef class   Part        ;
//	//typedef class   GlobalPart    ;
//
//	`include "package__base_string_charsets.sv"
//
//	`include "class__type_name.sv"
//
//	`include "package__base_arrays.sv"

//	`include "package__base_string.sv"
	function automatic void invalid_char(string role, int position, string source, chr_t expected);
		$error("str_pkg::invalid_char> character '%s' at %0d in line:\n%s\n:\n\t expected '%s'\n\t   actual '%s'",
			role, position, source, expected, source[position]);
			if(!RESUME_ON_ERROR) 
				`include "__stop.vi";
	endfunction : invalid_char
	
	function automatic void char_not_found(string role, string source, chr_t expected);
		$error("str_pkg::char_not_found> character '%s' not found in line:\n%s\n:\n\t expected '%s'",
			role, source, expected);
			if(!RESUME_ON_ERROR) 
				`include "__stop.vi";
	endfunction : char_not_found

//	const WhiteSpaces	white_spaces	= new();
//	const Letters		letters			= new();
//	const Digits		digits			= new();
//
//	`include "package__base_string_functions.sv"
//
//	`include "package__base_interfaces.sv"
//	`include "class__proto.sv"
//	`include "class__string.sv"
//	`include "class__text.sv"
//	`include "package__base_classes.sv"
//
//	`include "class__object.sv"
//	`include "class__part.sv"
//
//	function automatic string objName(I_Object obj);
//		return obj == null ? str_NULL : obj.getName();
//	endfunction : objName
//
//	function automatic string strValue(String str); 
//		return (str == null) ? str_NULL : str.value;	 
//	endfunction : strValue
	
endpackage : base_pkg

