unit ufTarefa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, uspThread, StdCtrls;

type
  TfTarefa2 = class(TForm)
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    edtTempo1: TEdit;
    edtTempo2: TEdit;
    btnExecutar: TButton;
    lblTempo1: TLabel;
    lblTempo2: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure edtTempoKeyPress(Sender: TObject; var Key: Char);
    procedure edtTempoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FThreadIDs: array of THandle;
    procedure CriaThread(ProgressBar: TProgressBar; Tempo : Integer);
    procedure TerminaThread(Sender: TObject);
    procedure OnPosition(Sender: TObject; Posicao: Integer);
    procedure DadosValidos(index : integer);
  public
    { Public declarations }
  end; 
var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TfTarefa2 }

procedure TfTarefa2.CriaThread(ProgressBar: TProgressBar; Tempo : Integer);
var
  oThread : TspThread;
begin
  oThread := TspThread.Create(Tempo, ProgressBar);
  oThread.OnPosition := OnPosition;
  oThread.OnTerminate := TerminaThread;
  SetLength(FThreadIDs,Length(FThreadIDs)+1);
  FThreadIDs[Length(FThreadIDs)-1]:= oThread.ThreadID;
  oThread.Resume;
end;

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
var
  i, iQtdThreads: Integer;
begin
  iQtdThreads := 0;
  for i:= 0 to Self.ComponentCount -1 do
    if (Self.Components[i] is TEdit) and (Pos('edtTempo', TEdit(Self.Components[i]).Name) > 0)  then
    begin
      Inc(iQtdThreads);
      DadosValidos(iQtdThreads);
      btnExecutar.Enabled:= False;
      CriaThread(TProgressBar(FindComponent('pbThread'+IntToStr(iQtdThreads))),StrToIntDef(Trim(TEdit(FindComponent('edtTempo'+IntToStr(iQtdThreads))).Text),1000));
    end;
end;

procedure TfTarefa2.edtTempoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and  (Key <> #8)) then
    key := #0;
end;

procedure TfTarefa2.OnPosition(Sender: TObject; Posicao: Integer);
begin
  TProgressBar(Sender).Position := Posicao;
end;

procedure TfTarefa2.edtTempoExit(Sender: TObject);
begin
  if (Trim(TEdit(Sender).Text) = '') then
    TEdit(Sender).Text:= '1000';
end;

procedure TfTarefa2.TerminaThread(Sender: TObject);
var
  i, j: Integer;
begin
  for i:=0 to Length(FThreadIDs) -1 do
    if TThread(Sender).ThreadID = FThreadIDs[i] then
    begin
      for j:= i to Length(FThreadIDs) - 1 do
        FThreadIDs[j]:= FThreadIDs[j + 1];
      SetLength(FThreadIDs, Length(FThreadIDs) - 1);
      Break;
    end;
  btnExecutar.Enabled := Length(FThreadIDs) = 0 ;
end;

procedure TfTarefa2.DadosValidos(index : integer);

begin
  try
    if FindComponent('pbThread'+IntToStr(index)) = nil then
      raise Exception.Create('Não existe um elemento ProgressBar para a  Thread');

    if FindComponent('edtTempo'+IntToStr(index)) = nil then
      raise Exception.Create('Não existe um elemento Edit para a  Thread');
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa2 := nil;
end;

end.
