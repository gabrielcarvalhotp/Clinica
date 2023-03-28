unit Clinica.Model.Conexao.Parametros;

interface
uses
  Clinica.Model.Conexao.Interfaces;

type
  TModelConexaoParametros = class(TInterfacedObject, iModelConexaoParametros)
  private
    [weak]
    FParent: iModelConnection;
    FDataBase: string;
    FUserName: string;
    FPassword: string;
    FDriverId: string;
    FServer: string;
    FPorta: integer;
  public
    constructor Create(aParent: iModelConnection);
    destructor Destroy; override;
    class function New(aParent: iModelConnection): iModelConexaoParametros;
    function DataBase(aValue: string): iModelConexaoParametros; overload;
    function DataBase: string; overload;
    function UserName(aValue: string): iModelConexaoParametros; overload;
    function UserName: string; overload;
    function Password(aValue: string): iModelConexaoParametros; overload;
    function Password: string; overload;
    function DriverId(aValue: string): iModelConexaoParametros; overload;
    function DriverId: string; overload;
    function Server(aValue: string): iModelConexaoParametros; overload;
    function Server: string; overload;
    function Porta(aValue: string): iModelConexaoParametros; overload;
    function Porta: string; overload;
    function &End: iModelConnection;
  end;

implementation

uses
  System.SysUtils;

constructor TModelConexaoParametros.Create(aParent: iModelConnection);
begin
  FParent := aParent;
end;

function TModelConexaoParametros.DataBase(aValue: string) : iModelConexaoParametros;
begin
  result := self;
  FDataBase := aValue;
end;

function TModelConexaoParametros.DataBase: string;
begin
  result := FDataBase;
end;

destructor TModelConexaoParametros.Destroy;
begin

  inherited;
end;

function TModelConexaoParametros.DriverId: string;
begin
  result := FDriverId;
end;

function TModelConexaoParametros.DriverId(aValue: string) : iModelConexaoParametros;
begin
  result := self;
  FDriverId := aValue;
end;

function TModelConexaoParametros.&End: iModelConnection;
begin
  result := FParent;
end;

class function TModelConexaoParametros.New(aParent: iModelConnection) : iModelConexaoParametros;
begin
  result := self.Create(aParent);
end;

function TModelConexaoParametros.Password(aValue: string) : iModelConexaoParametros;
begin
  result := self;
  FPassword := aValue;
end;

function TModelConexaoParametros.Password: string;
begin
  result := FPassword;
end;

function TModelConexaoParametros.Porta: string;
begin
  result := IntToStr(FPorta);
end;

function TModelConexaoParametros.Porta(aValue: string): iModelConexaoParametros;
begin
  result := self;
  FPorta := strToInt(aValue);
end;

function TModelConexaoParametros.Server(aValue: string) : iModelConexaoParametros;
begin
  result := self;
  FServer := aValue;
end;

function TModelConexaoParametros.Server: string;
begin
  result := FServer;
end;

function TModelConexaoParametros.UserName(aValue: string) : iModelConexaoParametros;
begin
  result := self;
  FUserName := aValue;
end;

function TModelConexaoParametros.UserName: string;
begin
  result := FUserName;
end;

end.
