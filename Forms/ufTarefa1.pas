unit ufTarefa1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uspQuery;

type
  TfTarefa1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    mmoCondicoes: TMemo;
    btnGeraSQL: TButton;
    mmoSQL: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSQL: TLabel;
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure GeraSql(const Sql: string);
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
var
  oQry: TspQuery;
begin
  oQry := nil;
  btnGeraSQL.Enabled := False;
  try
    try
      oQry := TspQuery.Create(Self);
      oQry.spColunas  := TStringList(mmoColunas.Lines);
      oQry.spCondicoes := TStringList(mmoCondicoes.Lines);
      oQry.spTabelas  := TStringList(mmoTabelas.Lines);
      oQry.spOnGeraSQL := GeraSql;
      oQry.GeraSQL;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  finally
    FreeAndNil(oQry);
    btnGeraSQL.Enabled := True;
  end;
end;

procedure TfTarefa1.GeraSql( const Sql: string);
begin
  mmoSQL.Lines.Clear;
  mmoSQL.Lines.Text := Sql;  
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa1 := nil;
end;

end.
