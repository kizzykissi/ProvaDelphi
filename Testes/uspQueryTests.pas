unit uspQueryTests;

interface

uses
  uspQuery,
  TestFrameWork, Classes;

type
  TspQueryTests = class(TTestCase)
  private
    FuspQuery: TspQuery;
  protected

   procedure SetUp; override;
   procedure TearDown; override;

  published

    // Test methods
    procedure TestGeraSQL;

  end;

implementation

uses SysUtils;

{ TspQueryTests }

procedure TspQueryTests.SetUp;
begin
  inherited;
  FuspQuery := TspQuery.Create(nil);
end;

procedure TspQueryTests.TearDown;
begin
  inherited;
  FreeAndNil(FuspQuery);
end;

procedure TspQueryTests.TestGeraSQL;
var
  aValueColunas: TStringList;
  aValueCondicoes: TStringList;
  aValueTabelas: TStringList;
begin
  aValueColunas:= TStringList.Create;
  aValueColunas.Add( 'Coluna');
  aValueCondicoes:= TStringList.Create;
  aValueCondicoes.Add('Condi??es');
  aValueTabelas:= TStringList.Create;
  aValueTabelas.Add('Tabelas');
  try
    FuspQuery.spCondicoes := aValueCondicoes;
    FuspQuery.spColunas := aValueColunas;
    FuspQuery.spTabelas := aValueTabelas;
    FuspQuery.GeraSQL;
  finally
    FreeAndNil(aValueColunas);
    FreeAndNil(aValueCondicoes);
    FreeAndNil(aValueTabelas);
  end;
end;

initialization

  TestFramework.RegisterTest('uspQueryTests Suite',
    TspQueryTests.Suite);

end.
