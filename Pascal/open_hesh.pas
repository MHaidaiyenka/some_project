program hesh1;
var
  i,B:integer;
  S:string[20];
  
  function h(x:string[20];j:integer):integer;
    var i,sum:integer;
    begin
      sum:=0;
      for i:=1 to j do 
      sum:=sum+ord(x[i]);
      h:=sum mod B;
    end;
    
begin
  writeln('введите B');
  readln(B);
  writeln('введите ключ');
  readln(S);
  i:=length(S);
  writeln(h(s,i));
end.