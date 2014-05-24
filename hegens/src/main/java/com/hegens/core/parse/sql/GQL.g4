grammar GQL;

parse: 
	select_statement SCOL|
 	create_statement SCOL
 ;

select_statement: KW_SELECT columns KW_FROM table;

create_statement: 
	KW_CREATE KW_TABLE 
	OPAR 
	table meta_columns_info  (','meta_columns_info)* 
	CPAR
;

//

// Keywords
KW_SELECT : 'SELECT'|'select';
KW_FROM : 'FROM'|'from';
KW_CREATE : 'CREATE'|'create';
KW_TABLE: 'TABLE'|'table';
 
TYPE_STRING : 'STRING'|'string';
TYPE_INT : 'INT'|'int';
TYPE_HBASE : 'HBASE' | 'hbase';
TYPE_SQLSERVER : 'SQLSERVER'|'sqlserver';


table: ID;
columns: ID (','ID)*;
meta_columns_info : ID type_statement datasoruce_statement;


type_statement:
	TYPE_INT|
	TYPE_STRING
;

	
datasoruce_statement:
	TYPE_HBASE|
	TYPE_SQLSERVER
;




ID
 : [a-zA-Z_] [a-zA-Z_0-9]*
;
SCOL : ';';
R : '||';
AND : '&&';
EQ : '==';
NEQ : '!=';
GT : '>';
LT : '<';
GTEQ : '>=';
LTEQ : '<=';
PLUS : '+';
MINUS : '-';
MULT : '*';
DIV : '/';
MOD : '%';
POW : '^';

DECLARE: 'declare';
ASSIGN : '=';
OPAR : '(';
CPAR : ')';
OBRACE : '{';
CBRACE : '}';


SPACE
 : [ \t\r\n] -> skip
 ;

OTHER
 : . 
 ;
 
COMMENT
: '/*' .*? '*/' -> skip
;

LINE_COMMENT
: '//' ~[\r\n]* -> skip
;

SQL_COMMENT
: '--' ~[\r\n]* -> skip
;
