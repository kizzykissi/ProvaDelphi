unit uspControllerProjetos;

interface

uses Classes, Contnrs, uspProjeto, SysUtils;

type
  TOperacao = (opSoma,opDivisao);

type
  TControllerProjetos = class(TObject)
  private
    FValorTotal: Currency;
    FListProjetos : TObjectList;
    FOnProcessamento: TGetStrProc;
    procedure Processando(Texto: string);
    procedure Calcula(Operacao: TOperacao; Index: integer);
  public
    constructor Create;
    destructor Destroy;override;
    function GetValorTotal(Operacao: TOperacao): Currency;
    function CarregaLista(Quantidade: Integer): TObjectList;
    property OnProcessamento: TGetStrProc  read FOnProcessamento write FOnProcessamento;
  end;

implementation

{ TControllerProjetos }

procedure TControllerProjetos.Calcula(Operacao: TOperacao;Index: integer);
begin
  case Operacao of
    opSoma: FValorTotal:= FValorTotal + TspProjeto(FListProjetos[Index]).Valor;
    opDivisao:  if (Index > 0) and (TspProjeto(FListProjetos[Index -1]).Valor > 0) then
                  FValorTotal:=  FValorTotal + (TspProjeto(FListProjetos[Index]).Valor /  TspProjeto(FListProjetos[Index -1]).Valor);
  end;
end;

function TControllerProjetos.CarregaLista(Quantidade: Integer): TObjectList;
var
  i: Integer;
begin
  try
    Processando('Carregando projetos...');
    for i:= 1 to Quantidade do
    begin
      FListProjetos.Add(TspProjeto.New(i,'Projeto n? '+IntToStr(i),StrToCurr(IntToStr(i)+',00')*8));
    end;
  finally
    Result := FListProjetos;
    Processando('');
  end;
end;

constructor TControllerProjetos.Create;
begin
  FListProjetos := TObjectList.Create(True);
end;

destructor TControllerProjetos.Destroy;
begin
   FListProjetos.Clear;
   FreeAndNil(FListProjetos);
  inherited;
end;

function TControllerProjetos.GetValorTotal(Operacao: TOperacao): Currency;
var
  i : Integer;
begin
  FValorTotal:= 0;
  try
    try
      Processando('Calculando valores...');
      for i:=0 to FListProjetos.Count -1 do
         Calcula(Operacao, i);
    except
      on e: Exception do
      begin
        FValorTotal := 0;
        Exception.Create('N?o foi possiv?l realizar o c?lculo. Erro: '+e.Message);
      end;
    end;
  finally
    Result:= FValorTotal;
    Processando('');
  end;  
end;

procedure TControllerProjetos.Processando(Texto: string);
begin
  if Assigned(FOnProcessamento) then
    FOnProcessamento(Texto);
end;
end.
