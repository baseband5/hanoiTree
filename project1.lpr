program swieta;

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

{$R *.res}

begin
  cursoroff;
  _drawGrid();
  hanoiinit(4, rhanoi);
  draw(rhanoi);
  while (doIwin(rhanoi)) do
  //while true do
  begin
    move(znak, rhanoi);
    znak := M_ReadKey;
  end;
end.



