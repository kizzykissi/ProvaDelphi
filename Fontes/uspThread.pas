unit uspThread;

interface

uses Classes, SysUtils;

type
  TOnPosition = procedure(Sender: TObject ; Posicao: Integer) of object;
  
type
  TspThread = class(TThread)
  private
    FTempo: Integer;
    FPosicao : Integer;
    FSender : TObject;
    FOnPosition: TOnPosition;
    procedure Position;
  public
    procedure Execute; override;
    constructor Create(Tempo: Integer; Sender: TObject);
  published
    property OnPosition : TOnPosition  read FOnPosition write FOnPosition;
  end;


implementation

{ TspThread }

constructor TspThread.Create(Tempo: Integer; Sender: TObject);
begin
  inherited Create(True);
  FTempo := Tempo;
  FSender := Sender;
  FPosicao := 0;
  FreeOnTerminate := True;
end;

procedure TspThread.Execute;
var
  i: Integer;
begin
  for i:= 0 to 100 do
  begin
    Sleep(FTempo);
    Synchronize(Position);
    Inc(FPosicao);
  end;
  FPosicao := 0;
  Synchronize(Position);
end;

procedure TspThread.Position;
begin
  if Assigned(FOnPosition) then
    FOnPosition(FSender,FPosicao);
end;

end.
