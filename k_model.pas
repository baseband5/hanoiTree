unit k_model;

{$mode objfpc}{$H+}

interface

uses
  crt;

type
  htable = array[0..2] of array of integer;

  hanoiRecord = object
    t: htable;
    c: integer;
    clip: integer;
    m: integer;
    procedure init(Height: integer);
    function doIwin(): Boolean;
    function getPiece():Boolean;
    function putPiece():Boolean;
    function cutsorLeft():Boolean;
    function cutsorRight():Boolean;
    //procedure destruct();
  end;

//function getMax(hanoii: htable; index: integer);

implementation
{
function getMax(hanoii: htable; index: integer);

begin
     for i := Length(rhanoi.t[0]) - 1 downto 0 do

end;
}
function hanoiRecord.cutsorLeft():boolean;
begin
  if c > 0 then
     begin
        c := c - 1;
        Result:=true;
        Exit;
      end;
  Result:=false;
end;

function hanoiRecord.cutsorRight():boolean;
begin
  if c < 2 then
      begin
        c := c + 1;
        Result:=true;
        Exit;
      end;
  Result:=false;
end;

procedure hanoiRecord.init(Height: integer);
var
  i: integer;
begin
  c := 0;
  clip := 0;
  m := 0;

  SetLength(t[0], Height);
  SetLength(t[1], Height);
  SetLength(t[2], Height);
  for i := 0 to Height - 1 do
  begin
    t[0][i] := Height - i;
  end;

end;

function hanoiRecord.doIwin(): boolean;
var
  i: integer;
begin
  for i := 0 to Length(t[0]) - 1 do
  begin
    if (t[0][i] <> 0) or (t[1][i] <> 0) or (clip <> 0) then
    begin
      doIwin := True;
      exit;
    end;
  end;
  doIwin := False;
end;

function hanoiRecord.getpiece():Boolean;
var
  i: integer;
begin
  if clip = 0 then
  begin
    for i := Length(t[c]) - 1 downto 0 do
    begin
      if t[c][i] <> 0 then
      begin
        clip := t[c][i];
        t[c][i] := 0;
        Result:=True;
        Break;
      end;
    end;
  end
  else
  begin
    Result:=false;
  end;
end;

function hanoiRecord.putPiece():Boolean;
var
  i: integer;
begin
  if clip <> 0 then;
  begin
    for i := Length(t[c]) - 1 downto 0 do
    begin
      if (t[c][i] <> 0) then
      begin
        if (t[c][i] > clip) then
        begin
          t[c][i + 1] := clip;
          clip := 0;
          Break;
        end;
      end
      else if ((i = 0) and (t[c][0] = 0)) then
      begin
        t[c][i] := clip;
        clip := 0;
        Break;
      end;
    end;
  end;
end;

end.
