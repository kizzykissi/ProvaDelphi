unit uspProjeto;

interface

uses Classes, uspIProjeto;

type
  TspProjeto = class(TInterfacedObject, IspProjeto)
  private
    FId: Integer;
    FNome: String;
    FValor: Currency;
  public
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetValor(const Value: Currency);
    function GetId: Integer;
    function GetNome: String;
    function GetValor: Currency;
    property Id: Integer read GetId write SetId;
    property Nome: String  read GetNome write SetNome;
    property Valor: Currency  read GetValor write SetValor;
  class function New(Id: Integer; Nome: string; Valor: Currency): TspProjeto;
  end;

implementation

{ TProjeto }

function TspProjeto.GetId: Integer;
begin
  Result := FId;
end;

function TspProjeto.GetNome: String;
begin
  Result := FNome;
end;

function TspProjeto.GetValor: Currency;
begin
  Result := FValor;
end;

class function TspProjeto.New(Id: Integer; Nome: string; Valor: Currency): TspProjeto;
begin
  Result:= TspProjeto.Create;
  Result.Id:= Id;
  Result.Nome := Nome;
  Result.Valor := Valor;
end;

procedure TspProjeto.SetId(const Value: Integer);
begin
  FId := Value
end;

procedure TspProjeto.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TspProjeto.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
