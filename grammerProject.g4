grammar grammerProject;

start: program* | ;

program: importt | class | function | call | commands ;

importt: 'Import'':'':''from''(' libname* ')' require;


libname: NameData '.' classname | NameData;
classname: NameData ','?;
require: 'require' '(' libname (',' libname)* ')';



//create a class----------------------------------------------------------------------
class: level 'CLASS' NameData inherited constructor classBody 'end_Class';

level: 'public'| 'private'| ;
//prantez: '(' NameData ')'  | '(' ')' | ;
inherited: 'Inherited' 'from' NameData | 'Inherited' 'from' NameData',' NameData* ;
constructor: 'constructor' NameData '<''-' fun;
fun: 'function' '(' parameter ')'':'  | '(' ')'':' ;
classBody: 'x' '='  NameData* 'y' '=' NameData* 'end';

//describe variables------------------------------------------------------------
variables: level const dataType;
const: 'const' | ;
dataType: int| float | boolean | string | char | double;

//int type
int:'int' NameData takeValueINT moreInt | 'int' intArray;
moreInt: ',' NameData takeValueINT moreInt | ;
takeValueINT: '<''=' IntNumber | ;
//int[]
intArray: NameDataAry '<''=' 'new int' '[' IntNumber ']' | NameDataAry ',' intArray |
          NameDataAry '<''=' '[' IntNumber (',' IntNumber)* ']' | NameDataAry;

//float type
float: 'float' NameData takeValueFloat moreFloat |  'float' floatArray;
moreFloat: ',' NameData takeValueFloat moreFloat | ;
takeValueFloat: '=' valueF | ;
valueF : IntNumber | FloatNumber | NamadElmi;
//float[]
floatArray: NameDataAry '=' 'new float' '[' IntNumber ']' | NameDataAry ',' floatArray|
           NameDataAry '<''=' '[' valueF (',' valueF)* ']' | NameDataAry;

//double type
double:'double' NameData takeValueFloat moreFloat | 'double' doubleArray;
doubleArray: NameDataAry '<''=' 'new double' '[' IntNumber ']' | NameDataAry ',' doubleArray|
                        NameDataAry '<''=' '[' valueF (',' valueF)* ']' | NameDataAry;

//char type
char:'char' NameData takeValueChar moreChar| 'char'  charArray;
moreChar: ',' NameData takeValueINT moreChar| ;
takeValueChar: '<''=' CharValue | ;
//char[]
charArray:NameDataAry '<''=' 'new char' '[' IntNumber ']' | NameDataAry ',' charArray|
          NameDataAry '<''=' '[' CharValue (',' CharValue)* ']' | NameDataAry;

// String type
string: 'string' NameData takeValueString moreString| 'string' stringArray;
moreString: ',' NameData takeValueString moreString | ;
takeValueString: '<''=' StringValue | ;
//string[]
stringArray:NameDataAry '<''=' 'new string' '[' IntNumber ']' | NameDataAry ',' stringArray|
            NameDataAry '<''=' '[' StringValue (',' StringValue)* ']' | NameDataAry;

//boolaen type
boolean: 'bool' NameData takeValueBool moreBool| 'bool' booleanArray;
moreBool: ',' NameData takeValueBool moreBool | ;
takeValueBool: '<''=' boolValue | ;
boolValue: 'false' | 'true';
//boolean[]
booleanArray: NameDataAry '<''=' 'new bool' '[' IntNumber ']' | NameDataAry ',' booleanArray|
              NameDataAry '<''=' '[' boolValue (',' boolValue)* ']'| NameDataAry;


//commands--------------------------------------------------------------------------
commands: for | while | if | variables | switch | exception |
         entesab | functions| print ;

//---for
for: 'for' '(''(' initializationFor conditions incDec ')'')' 'do' commands* 'done';

initializationFor: 'int' NameData '=' IntNumber ';' | NameData '=' IntNumber ';';

conditions: conditions 'or' conditions | conditions 'and' conditions| condition;
condition: conditionForm alamat conditionForm |('!')? boolValue | '!' NameData | callFunc | 'k' alamat IntNumber ;
conditionForm: mathPhrase | callFunc;
alamat: '>' | '<' | '==' | '!=' | '>=' | '<=';

incDec:';' NameData '++' |';' NameData '--' | ;
incdic: '++' | '--' ;

//--while
while: 'while' '[' conditions ']' 'do' 'i' incdic* commands*? 'done' |
      'do' commands*  'as_long_as' '['  conditions ']' | 'while' '[' conditions ']' 'do' 'i' incdic* commands* 'done' 'do''k' incdic* commands*  'as_long_as' '[' conditions ']' ;

//---if
if: 'if' '[' conditions ']' 'then' commands* 'else' commands* 'Fi';

// ternary expression

expression: StringValue |  mathPhrase | callFunc;

//entesab
//---------------
ebarat: NameData '=' mathPhrase | NameData amalgarPlus mathPhrase;
amalgarPlus: '+=' | '-='| '*=' | '/=' | '%=';

mathPhrase: mathPhrase notOrAnd level11 | level11 ;
notOrAnd: 'not' | 'or' | 'and' | '||' | '&&';

level11: level11 biggerThan level10 | level10;
biggerThan: '>' | '<' | '<=' | '>=';

level10: level10 equal level9 | level9;
equal: '==' | '!=' | '<>';

level9: level9 bitwise level8 | level8;
bitwise: '&' | '^' | '|';

level8: level8 shift level7 | level7;
shift: '>>' | '<<';

level7: level7 binary level6 | level6;
binary: '+' | '-';

level6: level6 multy level5 | level5;
multy: '*' | '/' | '//' | '%';

level5: level5 unary level4 | unary level5 level4 | unary level4 | level4 (unary)?;
unary: '++' | '--';

level4: level4 unarySingle level3 | unarySingle level4 level3 | unarySingle level3 | level3 (unarySingle)?;
unarySingle: '-' | '+';

level3: level3 '~' level2 | level2;
level2: level2 '**' level1 | level1;
level1: '(' mathPhrase ')' | valueF | NameData;
//----------------
entesab: entesabSelf | entesabelse;

entesabelse: nameType ebarat';';
entesabSelf: 'this.' ebarat ';';

nameType: 'bool' | 'char' | 'string' | 'float' | 'double' | 'int' | ;


//switch
switch: 'case' expression? when+ ;

when: 'when' valueS commands* | 'when' valueS commands* when 'else' commands* 'end' ;
valueS: NamadElmi | FloatNumber  | IntNumber | boolValue | CharValue | StringValue ;


//--------------functions
functions: function | call; // | calledFunvtion;

call: '@' commands* ;

function: NameData '<''-' level 'function' '(' parameter')' ':' commands* 'end' ;

parameter: intP | floatP | doubleP | boolP| charP | stringP | variablesP | ;
intP  : 'int' NameData | 'int' NameData ',' parameter;
floatP: 'float' NameData | 'float' NameData ',' parameter;
doubleP: 'double' NameData | 'double' NameData ',' parameter;
boolP : 'bool' NameData | 'bool' NameData ',' parameter;
charP : 'char' NameData | 'char' NameData ',' parameter;
stringP: 'string' NameData | 'string' NameData ',' parameter;
variablesP: dataType parameter | dataType; // data type in variables;


//calledFunvtion: callFunc ';' ;
callFunc: cally arrayList* ('.' cally arrayList* )*'(' answerCallFunc (',' answerCallFunc)* ')'  |
          cally arrayList* ('.' cally arrayList* )* '(' ')' ;
arrayList: '[' IntNumber ']' ;
cally: 'this.' NameData| NameData;
answerCallFunc: mathPhrase |  cally arrayList*('.' cally arrayList*)*;
//-------------exceptions
exception: 'try' ':' commands*
           'except'  NameData (',' NameData)* ':' commands* ;

//----print
print: 'print' '(' printForm (',' printForm)* ')' ;
printForm: StringValue | NameData arrayList* | mathPhrase;



Comment: [/]{1}[/]{1}[a-zA-Z0-9/*-+?><.,'":; }{[\]=_)(&^%$#@!~`]*[\n]{1,} -> skip;
BigComment:[/]{1}[*]{1}[a-zA-Z0-9/*-+?><.,'":; }{[\]=_)(&^%$#@!~`\n]*[*]{1}[/]{1} -> skip;
WS: [ \t\r\n]+ -> skip;

/* require- end - begin-  public - private - public - from -const - int - string -
char - float - double - bool - class - implements - this -  return - Null - for -
while - in - and - or - do - if - else - switch - case - break - default - try -
catch - true  - false
*/
Words: [r]{1}[e]{1}[q]{1}[u]{1}[i]{1}[r]{1}[e]{1} | [e]{1}[n]{1}[d]{1} | [b]{1}[e]{1}[g]{1}[i]{1}[n]{1} |
 [p]{1}[u]{1}[b]{1}[l]{1}[i]{1}[c]{1} | [f]{1}[r]{1}[o]{1}[m]{1} | [c]{1}[o]{1}[n]{1}[s]{1}[t]{1}|
 [i]{1}[n]{1}[t]{1}| [s]{1}[t]{1}[r]{1}[i]{1}[n]{1}[g]{1} |[c]{1}[h]{1}[a]{1}[r]{1} | [f]{1}[l]{1}[o]{1}[a]{1}[t]{1} |
 [d]{1}[o]{1}[u]{1}[b]{1}[l]{1}[e]{1} |  [b]{1}[o]{1}[o]{1}[l]{1} | [c]{1}[l]{1}[a]{1}[s]{2} |
 [i]{1}[m]{1}[p]{1}[l]{1}[e]{1}[m]{1}[e]{1}[n]{1}[t]{1}[s]{1} |[t]{1}[h]{1}[i]{1}[s] | [r]{1}[e]{1}[t]{1}[u]{1}[r]{1}[n] |
 [N]{1}[u]{1}[l]{2} |[f]{1}[o]{1}[r]{1} |[w]{1}[h]{1}[i]{1}[l]{1}[e]{1} | [i]{1}[n]{1} | [a]{1}[n]{1}[d]{1} | [o]{1}[r]{1}|
 [d]{1}[o]{1} | [i]{1}[f]{1} | [e]{1}[l]{1}[s]{1}[e]{1} | [s]{1}[w]{1}[i]{1}[t]{1}[c]{1}[h]{1} |
 [c]{1}[a]{1}[s]{1}[e]{1} | [b]{1}[r]{1}[e]{1}[a]{1}[k]{1} | [d]{1}[e]{1}[f]{1}[a]{1}[u]{1}[l]{1}[t]{1} |
 [t]{1}[r]{1}[y]{1} | [c]{1}[a]{1}[t]{1}[c]{1}[h] |[p]{1}[r]{1}[i]{1}[v]{1}[a]{1}[t]{1}[e]{1}|
  [t]{1}[r]{1}[u]{1}[e]{1} | [f]{1}[a]{1}[l]{1}[s]{1}[e]{1};

IntNumber: [1-9][0-9]* | [0];
FloatNumber:[0-9]* [.] [0-9]*;
NamadElmi: [0-9][.][0-9]*[e][-+][1-9][0-9]*;
NameDataAry:[a-zA-Z$][a-zA-Z0-9$_]+[[]{1}[\]]{1} ;
CharValue: [']{1}[0-9a-zA-Z!@#$%^&*()_+-/='"<>]{1}[']{1};
StringValue: ["]{1}[0-9a-zA-Z!@#$%^&*()_+-/='"<> ]+["]{1};
NameData:[a-zA-Z$]{1}[a-zA-Z0-9$_]+  ;

