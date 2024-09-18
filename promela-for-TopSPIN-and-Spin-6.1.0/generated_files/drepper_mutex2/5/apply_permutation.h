void applyPrSwapToState(State *s, int a, int b) {
   uchar tempPid;
   int slot;
   {
       uchar temp;
       temp = s->futex.wait[a];
       s->futex.wait[a] = s->futex.wait[b];
       s->futex.wait[b] = temp;
   }







   if(a==1) {
      P0 temp;
      memcpy(&temp,SEG(s,a),sizeof(P0));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P0));
      memcpy(SEG(s,b),&temp,sizeof(P0));
      tempPid = VAR(s,a,_pid,P0);
      VAR(s,a,_pid,P0) = VAR(s,b,_pid,P0);
      VAR(s,b,_pid,P0) = tempPid;
      return;
   }

   if(a==2) {
      P0 temp;
      memcpy(&temp,SEG(s,a),sizeof(P0));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P0));
      memcpy(SEG(s,b),&temp,sizeof(P0));
      tempPid = VAR(s,a,_pid,P0);
      VAR(s,a,_pid,P0) = VAR(s,b,_pid,P0);
      VAR(s,b,_pid,P0) = tempPid;
      return;
   }

   if(a==3) {
      P0 temp;
      memcpy(&temp,SEG(s,a),sizeof(P0));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P0));
      memcpy(SEG(s,b),&temp,sizeof(P0));
      tempPid = VAR(s,a,_pid,P0);
      VAR(s,a,_pid,P0) = VAR(s,b,_pid,P0);
      VAR(s,b,_pid,P0) = tempPid;
      return;
   }

   if(a==4) {
      P0 temp;
      memcpy(&temp,SEG(s,a),sizeof(P0));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P0));
      memcpy(SEG(s,b),&temp,sizeof(P0));
      tempPid = VAR(s,a,_pid,P0);
      VAR(s,a,_pid,P0) = VAR(s,b,_pid,P0);
      VAR(s,b,_pid,P0) = tempPid;
      return;
   }

   if(a==5) {
      P0 temp;
      memcpy(&temp,SEG(s,a),sizeof(P0));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P0));
      memcpy(SEG(s,b),&temp,sizeof(P0));
      tempPid = VAR(s,a,_pid,P0);
      VAR(s,a,_pid,P0) = VAR(s,b,_pid,P0);
      VAR(s,b,_pid,P0) = tempPid;
      return;
   }

   if(a==6) {
      P1 temp;
      memcpy(&temp,SEG(s,a),sizeof(P1));
      memcpy(SEG(s,a),SEG(s,b),sizeof(P1));
      memcpy(SEG(s,b),&temp,sizeof(P1));
      tempPid = VAR(s,a,_pid,P1);
      VAR(s,a,_pid,P1) = VAR(s,b,_pid,P1);
      VAR(s,b,_pid,P1) = tempPid;
      return;
   }

}

void applyChSwapToState(State *s, int a, int b) {
   uchar tempCid;
   int slot;







}

void applyPermToState(State *s, perm_t *alpha) {
   int i;
   for(i=0; i<alpha->prLength; i=i+2) {
      applyPrSwapToState(s,alpha->pr[i],alpha->pr[i+1]);
   }

   for(i=0; i<alpha->chLength; i=i+2) {
      applyChSwapToState(s,alpha->ch[i],alpha->ch[i+1]);
   }

}

