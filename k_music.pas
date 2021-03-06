unit k_music;

{$mode objfpc}{$H+}

interface

uses
{$IFDEF UNIX}
  {In case of Unix}
{$ENDIF}
  crt, Windows;

procedure play();

implementation


procedure play();

var
  C3, Db3, D3, Eb3, E3, F3, Gb3, G3, Ab3, A3, Bb3, B3, C4, Db4, D4,
  Eb4, E4, F4, Gb4, G4, Ab4, A4, Bb4, B4, C5, Db5, D5, Eb5, E5, F5,
  Gb5, G5, Ab5, A5, Bb5, B5, C6, Db6, D6, Eb6, E6, F6, Gb6, G6, Ab6,
  A6, Bb6, B6, C7, Db7, D7, Eb7, E7, F7, Gb7, G7, Ab7, A7, Bb7, B7, full, half: integer;

begin

  C3 := 130; Db3 := 138; D3 := 146; Eb3 := 155; E3 := 164; F3 := 174;
  Gb3 := 185; G3 := 196; Ab3 := 207; A3 := 220; Bb3 := 233; B3 := 246;

  C4 := 261; Db4 := 277; D4 := 293; Eb4 := 311; E4 := 329; F4 := 349;
  Gb4 := 369; G4 := 392; Ab4 := 415; A4 := 440; Bb4 := 466; B4 := 493;

  C5 := 523; Db5 := 544; D5 := 587; Eb5 := 622; E5 := 659; F5 := 698;
  Gb5 := 739; G5 := 783; Ab5 := 830; A5 := 880; Bb5 := 932; B5 := 987;

  C6 := 1046; Db6 := 1108; D6 := 1174; Eb6 := 1244; E6 := 1318; F6 := 1396;
  Gb6 := 1479; G6 := 1567; Ab6 := 1661; A6 := 1760; Bb6 := 1864; B6 := 1975;

  C7 := 2093; Db7 := 2217; D7 := 2349; Eb7 := 2489; E7 := 2637; F7 := 2794;
  Gb7 := 2960; G7 := 3136; Ab7 := 3322; A7 := 3520; Bb7 := 3729; B7 := 3951;

  full := 600; half := 300;

  Windows.beep(E5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);

  delay(half);

  Windows.beep(E5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);

  delay(half);

  Windows.beep(E5, half);
  Windows.beep(G5, half);
  Windows.beep(C5, half);
  Windows.beep(D5, half);
  Windows.beep(E5, half);

  Windows.beep(C4, half);
  Windows.beep(D4, half);
  Windows.beep(E4, half);

  Windows.beep(F5, half);
  Windows.beep(F5, half);
  Windows.beep(F5, half);

  delay(half);

  Windows.beep(F5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);

  delay(half);

  Windows.beep(E5, half);
  Windows.beep(D5, half);
  Windows.beep(D5, half);
  Windows.beep(E5, half);
  Windows.beep(D5, half);
  delay(half);
  Windows.beep(G5, half);
  delay(half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);
  delay(half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);
  delay(half);
  Windows.beep(E5, half);
  Windows.beep(G5, half);
  Windows.beep(C5, half);
  Windows.beep(D5, half);
  Windows.beep(E5, half);
  Windows.beep(C4, half);
  Windows.beep(D4, half);
  Windows.beep(E4, half);
  Windows.beep(F5, half);
  Windows.beep(F5, half);
  Windows.beep(F5, half);
  delay(half);
  Windows.beep(F5, half);
  Windows.beep(E5, half);
  Windows.beep(E5, half);
  delay(half);
  Windows.beep(G5, half);
  Windows.beep(G5, half);
  Windows.beep(F5, half);
  Windows.beep(D5, half);
  Windows.beep(C5, full);
  delay(full);
end;



end.
