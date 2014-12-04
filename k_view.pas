unit k_view;

{$mode objfpc}{$H+}

interface

uses
  crt, k_model;

procedure _drawGrid();
procedure _drawCursor(cursor: integer);
procedure _drawHanoi(nr: integer; hanoii: htable);
procedure draw(rhanoi: hanoiRecord);
procedure _debug(hanoii:htable;index:integer);

implementation
procedure _debug(hanoii:htable;Index:Integer);
var
  i:integer;
begin
  for i:=0 to Length(hanoii[index]) - 1 do
  begin
       gotoxy(68,23-i);
       write(hanoii[index][i]);
  end;
end;

procedure _drawGrid();
var
  i: integer;
begin
  //first line
  Gotoxy(1, 1);
  Write(AnsiChar(#201));
  for i := 2 to 79 do
    Write(AnsiChar(#205));
  gotoxy(80, 1);
  Write(AnsiChar(#187));
  //bottom line
  GotoXY(1, 24);
  Write(AnsiChar(#200));
  for i := 2 to 79 do
    Write(AnsiChar(#205));
  Write(AnsiChar(#188));

  //vertical long
  for i := 2 to 23 do
  begin
    gotoxy(1, i);
    Write(AnsiChar(#186));
    gotoxy(67, i);
    Write(AnsiChar(#186));
    gotoxy(80, i);
    Write(AnsiChar(#186));
  end;
  //vertical short
  for i := 1 to 12 do
  begin
    gotoxy(23, i + 11);
    Write(AnsiChar(#186));
    gotoxy(45, i + 11);
    Write(AnsiChar(#186));
  end;
  //hshort
  for i := 2 to 66 do
  begin
    gotoxy(i, 7);
    Write(AnsiChar(#205));
    gotoxy(i, 9);
    Write(AnsiChar(#205));
    gotoxy(i, 11);
    Write(AnsiChar(#205));
  end;
  gotoxy(26, 4);
  Write('Choinki z Hanoi');
end;

procedure _drawCursor(cursor: integer);
var
  i: integer;
begin
  for i := 0 to 2 do
  begin
    gotoxy(12 + i * 22, 8);
    Write(' ');
  end;

  gotoxy(12 + cursor * 22, 8);
  Write('V');
end;

procedure _drawHanoi(nr: integer; hanoii: htable);
var
  i, j, max: integer;

begin
  max := 10;
  for i := 0 to high(hanoii[0]) do
  begin
    gotoxy(3 + nr * 22, 22 - i);
    if hanoii[nr][i] = 0 then
    begin
      Write('                   ');
    end
    else if hanoii[nr][i] = 1 then
    begin
      for j := 0 to max - 2 do
        Write(' ');
      Write('*');
      for j := 0 to max - 2 do
        Write(' ');
    end
    else
    begin
      for j := 0 to max - hanoii[nr][i] - 1 do
        Write(' ');
      for j := 0 to hanoii[nr][i] - 2 do
        Write('/');
      Write('|');
      for j := 0 to hanoii[nr][i] - 2 do
        Write('\');
      for j := 0 to max - hanoii[nr][i] - 1 do
        Write(' ');
    end;
  end;
end;

procedure draw(rhanoi: hanoiRecord);
var
  i: integer;
begin
  _drawCursor(rhanoi.c);
  for i := 0 to 2 do
    _drawHanoi(i, rhanoi.t);

end;

end.
