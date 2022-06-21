unit uspIProjeto;

interface

type
  IspProjeto = interface
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetValor(const Value: Currency);
    function GetId: Integer;
    function GetNome: String;
    function GetValor: Currency;
    property Id: Integer read GetId write SetId;
    property Nome: String  read GetNome write SetNome;
    property Valor: Currency  read GetValor write SetValor;
  end;

implementation

end.
