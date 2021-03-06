unit uspQuery;

interface

uses Classes, IBQuery, SysUtils;

type
 
 TspQuery = class(TIBQuery)
 private
   FspCondicoes: TStringList;
   FspColunas: TStringList;
   FspTabelas: TStringList;
   FspOnGeraSQL: TGetStrProc;
   procedure SetspCondicoes(const Value: TStringList);
   procedure SetspColunas(const Value: TStringList);
   procedure SetspTabelas(const Value: TStringList);
   function GetColunas: string;
   function GetCondicoes: string;
   function GetSQL: string;
 public
   procedure GeraSQL;
 published
   property spCondicoes: TStringList write SetspCondicoes;
   property spColunas: TStringList write SetspColunas;
   property spTabelas: TStringList write SetspTabelas;
   property spOnGeraSQL: TGetStrProc  read FspOnGeraSQL write FspOnGeraSQL;
 end;


implementation

{ TspQuery }

procedure TspQuery.GeraSQL;
begin
  if not Assigned(FspTabelas)  then
    Raise Exception.Create('? necess?rio informar ao menos uma tabela para a gera??o do SQL.');

  if FspTabelas.Count > 1 then
    Raise Exception.Create('? permitido informar apenas uma tabela para a gera??o do SQL.');

  if FspTabelas.Count < 1 then
   Raise Exception.Create('? necess?rio informar ao menos uma tabela para a gera??o do SQL.');

  Self.SQL.Text := GetSQL;
  if Assigned(FspOnGeraSQL) then
    FspOnGeraSQL(Self.SQL.Text);
end;

function TspQuery.GetColunas: string;
begin
  Result := '*';
  if Assigned(FspColunas) and (FspColunas.Count > 0) then
  begin
    FspColunas.Delimiter:= ',';
    Result := FspColunas.DelimitedText;
  end;
end;

function TspQuery.GetCondicoes: string;
var
  i: integer;
begin
  Result := '';
  if Assigned(FspCondicoes) and  (FspCondicoes.Count > 0) then
  begin
    for i:=0 to FspCondicoes.Count -1 do
      if i = 0 then
        Result := ' WHERE '+FspCondicoes[i]
      else
        Result := ' AND '+FspCondicoes[i];
  end;
end;

function TspQuery.GetSQL: String;
var
  sSql: string;
begin
  sSql:= '';
  try
    try
      sSql := Format('SELECT %s FROM %s%s', [GetColunas, FspTabelas[0], GetCondicoes]);
    Except
      on e:Exception do
       raise Exception.Create('N?o foi poss?vel montar o SQL. Erro: '+e.Message);
    end;
  finally
    Result := sSql;
  end;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes:= Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  FspTabelas := Value;
end;

end.
 
