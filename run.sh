#! /bin/sh

   lex rules.l    \
&& gcc lex.yy.c   \
&& ./valid.sh $1 \
&& echo  \
&& echo --Input Kino File--   \
&& echo \
&& cat $1 \
&& echo \
&& echo --Mapped C File--      \
&& echo \
&& cat output.c   \
&& gcc output.c   \
&& rm output.c    \
&& echo \
&& echo --Output Generated--  \
&& echo \
&& ./a.out	
