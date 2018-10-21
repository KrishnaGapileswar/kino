%{

#include<stdio.h>
#include<stdlib.h>
int i=0;

%}

%option yylineno

%%
[ ]					{fprintf(yyout,"%c",' ');}

"."                                     {fprintf(yyout,"%c",';');}

"!"|"#"|"<"|">"|"%"|"="			{fprintf(yyout,"%s",yytext);}

")"|"("|"{"|"}"|"["|"]"|"-"|"*"|"/"|"+" {fprintf(yyout,"%s",yytext);}

"&&"|"||"|"<="|">="|"=="|"!="|"++"|"--" {fprintf(yyout,"%s",yytext);}

[1-9][0-9]*            {fprintf(yyout,"%s",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"%s",yytext);}

do.*                   {fprintf(yyout,"%s",yytext);}

\#casting.*           {fprintf(yyout,"%s","#include");
                      i=8;
                      while(i<yyleng){
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}
                      }
\#dialogue.*          {fprintf(yyout,"%s","define");
                      i=9;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}
                      }
blank.*               {fprintf(yyout,"%s","void");
                      i=5;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}
                      }
trailer.*             {fprintf(yyout,"%s","int");
                      i=7;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}
                      }
teaser.*              {fprintf(yyout,"%s","char");
                      i=6;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }	
movie.*               {fprintf(yyout,"%s","float");
                      i=5;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
kino.*                {fprintf(yyout,"%s","const");
                      i=4;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
test.*                {fprintf(yyout,"%s","if");
                      i=4;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
retest.*              {fprintf(yyout,"%s","else");
                      i=6;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}
                      }
rollback.*            {fprintf(yyout,"%s","while");
                      i=8;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
rolling.*             {fprintf(yyout,"%s","for");
                      i=7;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
action.*              {fprintf(yyout,"%s","printf");
                      i=6;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
record.*              {fprintf(yyout,"%s","scanf");
                      i=6;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
cut.*                 {fprintf(yyout,"%s","break");
                      i=3;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
		      i++;}	
                      }
retake.*              {fprintf(yyout,"%s","continue");
                      i=6;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
take.*                {fprintf(yyout,"%s","case");
                      i=4;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
back.*                {fprintf(yyout,"%s","default");
                      i=4;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]); 
                      i++;}
		      }
collect.*             {fprintf(yyout,"%s","return");
                      i=7;
                      while(i<yyleng){
			if(yytext[i]=='.') fprintf(yyout,"%c",';');
			else
                      fprintf(yyout,"%c",yytext[i]);
                      i++;}
		      }
.           ;
\n          ECHO;

%%

int yywrap(){
return 1;
}

int main(){
//yyin=fopen("input.kino","r");
yyout=fopen("output.c","w");
yylex();
return 0;
}
