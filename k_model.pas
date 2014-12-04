unit k_model;

{$mode objfpc}{$H+}

interface

uses
  crt;

type
  htable = array[0..2] of array of integer;

  hanoiRecord = record
    t: htable;
    c: integer;
    clip: integer;
    m: integer;
  end;

procedure hanoiinit(Height: integer; var rhanoi: hanoiRecord);
function doIwin(rhanoi: hanoiRecord): boolean;
procedure getPiece(var rhanoi: hanoiRecord);
procedure putPiece(var rhanoi: hanoiRecord);

implementation

procedure hanoiinit(Height: integer; var rhanoi: hanoiRecord);
var
  i: integer;
begin
  rhanoi.c := 0;
  rhanoi.clip := 0;
  rhanoi.m := 0;

  SetLength(rhanoi.t[0], Height);
  SetLength(rhanoi.t[1], Height);
  SetLength(rhanoi.t[2], Height);
  for i := 0 to Height - 1 do
  begin
    rhanoi.t[0][i] := Height - i;
  end;

end;

function doIwin(rhanoi: hanoiRecord): boolean;
var
  i: integer;
begin
  for i := 0 to Length(rhanoi.t[0]) - 1 do
  begin
    if (rhanoi.t[0][i] <> 0) or (rhanoi.t[1][i] <> 0) or (rhanoi.clip<>0) then
    begin
      doIwin := True;
      exit;
    end;
  end;
  doIwin := False;
end;

procedure getpiece(var rhanoi: hanoiRecord);
var
  i: integer;
begin
  if rhanoi.clip = 0 then
  begin
    for i := Length(rhanoi.t[rhanoi.c]) - 1 downto 0 do
    begin
      if rhanoi.t[rhanoi.c][i] <> 0 then
      begin
        rhanoi.clip := rhanoi.t[rhanoi.c][i];
        rhanoi.t[rhanoi.c][i] := 0;
        Break;
      end;
    end;
  end;
end;

procedure putPiece(var rhanoi: hanoiRecord);
var
  i: integer;
begin
  if rhanoi.clip <> 0 then;
  begin
    for i := Length(rhanoi.t[rhanoi.c]) - 1 downto 0 do
    begin
      if (rhanoi.t[rhanoi.c][i] <> 0) then
      begin
        if (rhanoi.t[rhanoi.c][i] > rhanoi.clip) then
        begin
          rhanoi.t[rhanoi.c][i + 1] := rhanoi.clip;
          rhanoi.clip := 0;
          Break;
        end;
      end
      else if ((i = 0) and (rhanoi.t[rhanoi.c][0] = 0)) then
      begin
        rhanoi.t[rhanoi.c][i] := rhanoi.clip;
        rhanoi.clip := 0;
        Break;
      end;
    end;
  end;
end;

end.
