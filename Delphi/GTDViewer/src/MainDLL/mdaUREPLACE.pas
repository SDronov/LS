unit mdaUREPLACE;

interface

Uses Classes;

Procedure mdaReplaceShablon(L:TStringList;Params:TStrings);
Function  mdaReplaceString(S:String;Params:TStrings):String;
Procedure mdaGetShablonParams(L:TStrings;Params:TStringList);

implementation

Function mdaReplaceString;
   Var i:Integer;
       O,Name:String;
   begin
      O:='';
      i:=1;
      repeat
         while (i<=Length(S))and(S[i]<>'^') do
            begin O:=O+S[i];Inc(i) end;
         if i>Length(S) then break;
         Inc(i);
         Name:='';
         while (i<=Length(S))and(S[i]<>'^') do
            begin Name:=Name+S[i];Inc(i) end;
         if i>Length(S) then break;
         O:=O+Params.Values[Name];
         Inc(i);
      until i>Length(S);
      Result:=O;
   end;

Procedure mdaReplaceShablon;
   Var i:Integer;
   begin
      for i:=0 to L.Count-1 do
            L[i]:=mdaReplaceString(L[i],Params);
   end;

Procedure mdaGetShablonParams;
   Var i,k:Integer;
       S,Name:string;
   begin
      Params.Clear;
      for k:=0 to L.Count-1 do
          begin
             S:=L[k];
             i:=1;
             repeat
                while (i<=Length(S))and(S[i]<>'^') do Inc(i);
                if i>Length(S) then break;
                Inc(i);
                Name:='';
                while (i<=Length(S))and(S[i]<>'^') do
                   begin Name:=Name+S[i];Inc(i) end;
                if Params.IndexOf(Name)<0 then
                   Params.Add(Name);
                Inc(i);
             until i>Length(S);
          end;
   end;

end.
