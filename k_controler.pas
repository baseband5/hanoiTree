unit k_controler;

{$mode objfpc}{$H+}

interface

uses
  k_model, k_view, crt, k_music;

procedure move(znak: word; var rhanoi: hanoiRecord);
procedure cheat(var rhanoi: hanoiRecord);
function M_ReadKey: word;


implementation

function M_ReadKey: word; //ta funkcja zostala znaleziona w sieci
var
  ch: char;
begin
  ch := ReadKey;
  if ch = #0 then
  begin
    ch := ReadKey;
    M_ReadKey := 256 + Ord(ch);
  end
  else
    M_ReadKey := Ord(ch);
end;


procedure move(znak: word; var rhanoi: hanoiRecord);
begin
  case znak of
    //#32: ; spacja
    328:
    begin
      if rhanoi.getPiece() then
      begin
        rhanoi.m := rhanoi.m + 1;
        _drawHanoi(rhanoi.c, rhanoi.t);
        _drawCursor(rhanoi);
        _drawScore(rhanoi);
      end
      else
      begin
           _drawModal('Clipboard is not empty!','warning');
      end;

      cheat(rhanoi);
    end;{ Gorna }
    336:
    begin
      if rhanoi.clip <> 0 then
        rhanoi.m := rhanoi.m + 1;
      rhanoi.putpiece();
      _drawHanoi(rhanoi.c, rhanoi.t);
      _drawCursor(rhanoi);
      _drawScore(rhanoi);
    end;                    { Dolna }
    331: if rhanoi.cutsorLeft() then
      begin
        _drawCursor(rhanoi);
      end
      else
      begin
        _drawModal('Out of range', 'warning');
      end;
    333: if rhanoi.cutsorRight() then
      begin
        _drawCursor(rhanoi);
      end
      else
      begin
        _drawModal('Out of range', 'warning');
      end;
    Ord('q'): halt(1);
    Ord('z'): _debug(rhanoi.t, 0);
    Ord('x'): _debug(rhanoi.t, 1);
    Ord('c'): _debug(rhanoi.t, 2);
  end;

end;

procedure cheat(var rhanoi: hanoiRecord);
type
  cheatcode = array[0..8] of word;
var
  zna: word;
  cc: cheatcode;
  i: integer;
begin
  cc[0] := 328;
  cc[1] := 336;
  cc[2] := 336;
  cc[3] := 331;
  cc[4] := 333;
  cc[5] := 331;
  cc[6] := 333;
  cc[7] := Ord('b');
  cc[8] := Ord('a');
  for i := 0 to 8 do
  begin
    zna := M_ReadKey;
    if zna = cc[i] then
    begin
      if zna <> 328 then //exclude double up and inifinity loop between move and cheat
        move(zna, rhanoi);
    end
    else
    begin
      move(zna, rhanoi);
      exit;
    end;
  end;
  play();
end;

end.
