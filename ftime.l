%{
	#include<stdio.h>
	#include "y.tab.h"
%}
%%
[0-1][0-9]"."[0-5][0-9]|[2][0-3]"."[0-5][0-9]	{
						yylval.real=(float)atof(yytext);
						return NUM;
					}
convert	{return convert;}
time	{return time;}
Militarytime	{return Militarytime;}
to	{return to;}
Rhour	{return Rhour;}
format	{return format;}
AM	{return AM;}
PM	{return PM;}
IST	{return IST;}
Not	{return Not;}
Validtime	{return Validtime;}
[\n]	{return yytext;}
[\t]	;
%%
int yywrap()
{

	return 1;
}
