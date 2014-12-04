program hanoiTree;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {In case of Unix} {$ENDIF}
  crt,
  k_music,
  k_view,
  k_model,
  k_controler;

var
  znak: word;
  rhanoi: hanoiRecord;
  size:integer;

{$R *.res}

begin
  cursoroff;
  _drawGrid();
  _drawModal('Set size','prompt');
  Readln(size);
  cursoroff;
  _drawModal('','');
  hanoiinit(size, rhanoi);
  draw(rhanoi);
  while (doIwin(rhanoi)) do
  begin
    move(znak, rhanoi);
    znak := M_ReadKey;
  end;
end.



