unit uspControllerProjetosTests;

interface

uses
  uspControllerProjetos,
  TestFrameWork ;

type
  TControllerProjetosTests = class(TTestCase)
  private
    FuspControllerProjetos: TControllerProjetos;
  protected

    procedure SetUp; override;
    procedure TearDown; override;

  published

    // Test methods
    procedure TestGetValorTotal;
    procedure TestCarregaLista;

  end;

implementation

uses SysUtils;

{ TControllerProjetosTests }

procedure TControllerProjetosTests.SetUp;
begin
  inherited;
  FuspControllerProjetos := TControllerProjetos.Create;
end;

procedure TControllerProjetosTests.TearDown;
begin
  inherited;
  FreeAndNil(FuspControllerProjetos);
end;

procedure TControllerProjetosTests.TestCarregaLista;
var
  aValue: Integer;
begin
  aValue := 11;
  FuspControllerProjetos.CarregaLista(aValue);
end;

procedure TControllerProjetosTests.TestGetValorTotal;
var
  returnValue: Currency;
  operacao: TOperacao;
begin
  operacao := opSoma;
  returnValue:=  FuspControllerProjetos.GetValorTotal(operacao);
end;

initialization

  TestFramework.RegisterTest('uspControllerProjetosTests Suite',
    TControllerProjetosTests.Suite);

end.
 