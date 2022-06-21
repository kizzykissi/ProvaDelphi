unit ufPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ufTarefa1, ufTarefa2;

type
  TfPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    mniTarefa1: TMenuItem;
    mniTarefa2: TMenuItem;
    mniTarefa3: TMenuItem;
    procedure mniTarefa1Click(Sender: TObject);
    procedure mniTarefa2Click(Sender: TObject);
    procedure mniTarefa3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function CriaForm(FormClass: TFormClass; Form: TForm): TForm;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses ufTarefa3;


{$R *.dfm}

{ TfPrincipal }

function TfPrincipal.CriaForm(FormClass: TFormClass; Form: TForm): TForm;
begin
  try
    if not Assigned(Form) then
      Form := FormClass.Create(Application);
    Form.Show;
    Result := Form;
  except
    raise Exception.Create('Não foi possível criar o formulário.')
  end;
end;

procedure TfPrincipal.mniTarefa1Click(Sender: TObject);
begin
  fTarefa1 := TfTarefa1(CriaForm(TfTarefa1, fTarefa1));
end;

procedure TfPrincipal.mniTarefa2Click(Sender: TObject);
begin
  fTarefa2 := TfTarefa2(CriaForm(TfTarefa2, fTarefa2));
end;

procedure TfPrincipal.mniTarefa3Click(Sender: TObject);
begin
  fTarefa3 := TfTarefa3(CriaForm(TfTarefa3, fTarefa3));
end;

procedure TfPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Screen.FormCount = 1;
end;

end.
