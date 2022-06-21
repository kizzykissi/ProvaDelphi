unit ufTarefa3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBClient, DB, Contnrs, uspControllerProjetos,
  uspProjeto, ComCtrls;

type
  TfTarefa3 = class(TForm)
    dbgrdProjetos: TDBGrid;
    edtTotalProjetos: TEdit;
    btnObterTotal: TButton;
    btnObterTotalDivisao: TButton;
    edtTotalDivisao: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    statProcessamento: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivisaoClick(Sender: TObject);
  private
    FClientDataSet : TClientDataSet;
    FDataSource : TDataSource;
    FControllerProjtos: TControllerProjetos;
    procedure SetDataComponentes;
    procedure PopulaGrid;
    procedure Processamento(const Texto: string);
    function GetTotal(Operacao: TOperacao): String;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

{ TfTarefa3 }

constructor TfTarefa3.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FControllerProjtos := TControllerProjetos.Create;
  FControllerProjtos.OnProcessamento :=  Processamento;
  SetDataComponentes;
end;

procedure TfTarefa3.PopulaGrid;
var
  oListaProjetos: TObjectList;
  i: Integer;
begin
  try
    try
      oListaProjetos:= FControllerProjtos.CarregaLista(10);
      Processamento('Preenchendo projetos aguarde...');
      FClientDataSet.DisableControls;
      FClientDataSet.EmptyDataSet;
      for i:= 0 to oListaProjetos.Count -1 do
      begin
        FClientDataSet.Append;
        FClientDataSet.FieldByName('IDProjeto').Value := TspProjeto(oListaProjetos[i]).Id;
        FClientDataSet.FieldByName('NomeProjeto').Value := TspProjeto(oListaProjetos[i]).Nome;
        FClientDataSet.FieldByName('Valor').Value := TspProjeto(oListaProjetos[i]).Valor;
        FClientDataSet.Post;
      end;
      FClientDataSet.First;
      FClientDataSet.EnableControls;
    except
      on e: Exception do
        ShowMessage('Não foi possível carregar os projetos. Erro: '+e.Message);
    end;
  finally
    Processamento('');
  end;
end;

procedure TfTarefa3.SetDataComponentes;
var
  i: Integer;
begin
  FClientDataSet := TClientDataSet.Create(nil);

  FClientDataSet.FieldDefs.Add('IDProjeto',ftInteger);
  FClientDataSet.FieldDefs.Add('NomeProjeto',ftString,83);
  FClientDataSet.FieldDefs.Add('Valor',ftCurrency);

  FClientDataSet.CreateDataSet;
  FClientDataSet.Open;

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet   := FClientDataSet;

  dbgrdProjetos.DataSource := FDataSource;
  for i:=0 to FClientDataSet.FieldCount - 1 do
  begin
    dbgrdProjetos.Columns.Add;
    dbgrdProjetos.Columns[dbgrdProjetos.Columns.Count -1].FieldName := FClientDataSet.Fields[i].FieldName;
    dbgrdProjetos.Columns[dbgrdProjetos.Columns.Count -1].Title.Caption := FClientDataSet.Fields[i].FieldName;
  end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FDataSource);
  FreeAndNil(FClientDataSet);
  FreeAndNil(FControllerProjtos);
  Action := caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.Processamento(const Texto: string);
begin
  statProcessamento.Panels[0].Text := Texto;
  Application.ProcessMessages;
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
  PopulaGrid;
end;

function TfTarefa3.GetTotal(Operacao: TOperacao): String;
begin
  try
    Result := FormatCurr('0.00',FControllerProjtos.GetValorTotal(Operacao));
  Except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  btnObterTotal.Enabled := false;
  Try
    edtTotalProjetos.Text := GetTotal(opSoma);
  finally
    btnObterTotal.Enabled := true;
  end;
end;

procedure TfTarefa3.btnObterTotalDivisaoClick(Sender: TObject);
begin
  btnObterTotalDivisao.Enabled := false;
  Try
    edtTotalDivisao.Text := GetTotal(opDivisao);
  finally
    btnObterTotalDivisao.Enabled := true;
  end;
end;

end.
