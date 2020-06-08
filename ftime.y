%{
	#include<stdio.h>
	#include<math.h>
	extern FILE *yyin;
	void yyerror(char *s);
	void printMessage();
%}
%union{
float real;
}
%token <real> NUM 
%token convert time Militarytime to Rhour format AM PM IST Not Validtime
%type <real> S T 

%% 
S: convert time T	{$$=($3);};
T: Militarytime to Rhour format NUM	{$$=$5;
				 
				 if(((int)$$)>12)
				 {
					$$=$$-12.0;
					printf("%.2f PM\n",$$);
				 }
				 else
				 {
					printf("%.2f AM\n",$$);
				 }
				}
   |Rhour to Militarytime format NUM PM	{$$=$5;
					 
					 if(((int)$$)>12)
				 {
					printf("Not Validtime \n");
				 }
				 else
				 {
					$$=$$+12.0;
					printf("%.2f IST\n",$$);
				 }
				}
	|Rhour to Militarytime format NUM AM	{$$=$5;
					 
					 if(((int)$$)>12)
				 {
					printf("Not Validtime \n");
				 }
				 else
				 {
					printf("%.2f IST\n",$$);
				 }
				}				   
   ;
%%
void yyerror(char *s){}
int main(int argc,char *argv[])
{
	printMessage();
	yyin=fopen(argv[1],"r");
	int i;
	for(i=1;i<=100;i++)
	{
		yyparse();
	}
	fclose(yyin);
	return 0;
}
void printMessage(){
    /*Print Helper Message*/
   printf("-----------------------------------------HELP-------------------------------------------------\n\n\n");
   printf("convert time Rhour to Militarytime format num AM /*like 10.25*/ : to convert 12 to 24 hour \n");
   printf("convert time Rhour to Militarytime format num PM /*like 10.25*/ : to convert 12 to 24 hour \n");
   printf("convert time Militarytime to Rhour format num/*like 10.25*/ : to convert 24 to 12 hour \n");
   printf("-----------------------------------------------------------------------------------------------\n\n\n");
 }
