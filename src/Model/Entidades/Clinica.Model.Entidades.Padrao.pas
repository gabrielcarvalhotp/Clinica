unit Clinica.Model.Entidades.Padrao;

interface
  uses
  Clinica.Model.Entidades.Interfaces.Padrao;
  
type
  TModelEntidadesPadrao<T : iInterface> = class(TInterfacedObject, iModelEntidadesInterfacesPadrao<T>)
  private
    [Weak]
    FParent: T;
    FId : integer;
    FNome : string;
    FData_Cadastro : TDateTime;
    FData_Alteracao : TDateTime;
    FUsuario_Alteracao : integer;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): iModelEntidadesInterfacesPadrao<T>;
    function Id(aValue: string): iModelEntidadesInterfacesPadrao<T>; overload;
    function Nome(aValue: string): iModelEntidadesInterfacesPadrao<T>; overload;
    function Data_Cadastro(aValue: TDateTime) : iModelEntidadesInterfacesPadrao<T>; overload;
    function Data_Alteracao(aValue: TDateTime) : iModelEntidadesInterfacesPadrao<T>; overload;
    function Usuario_Alteracao(aValue: integer) : iModelEntidadesInterfacesPadrao<T>; overload;
    function Id: integer; overload;
    function Nome: string; overload;
    function Data_Cadastro: TDateTime; overload;
    function Data_Alteracao: TDateTime; overload;
    function Usuario_Alteracao: integer; overload;
    function &End : T;
  end;

implementation

uses
  System.SysUtils;

{ TModelEntidadesPadrao<T> }

constructor TModelEntidadesPadrao<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TModelEntidadesPadrao<T>.Destroy;
begin

  inherited;
end;

class function TModelEntidadesPadrao<T>.New(Parent: T): iModelEntidadesInterfacesPadrao<T>;
begin
   result := self.Create(Parent)
end;

function TModelEntidadesPadrao<T>.Id(aValue: string): iModelEntidadesInterfacesPadrao<T>;
begin
  result := self;
  if aValue <> '' then
  FId := StrToInt(aValue);
end;

function TModelEntidadesPadrao<T>.Id: integer;
begin
  result := FId;
end;

function TModelEntidadesPadrao<T>.Nome(aValue: string): iModelEntidadesInterfacesPadrao<T>;
begin
  result := self;
  if aValue = '' then
    raise Exception.Create('Seu nome pode ser vazio!');
  FNome := aValue;
end;

function TModelEntidadesPadrao<T>.Nome: string;
begin
  result := FNome;
end;

function TModelEntidadesPadrao<T>.Data_Cadastro(aValue: TDateTime): iModelEntidadesInterfacesPadrao<T>;
begin
  result := self;
  FData_Cadastro := aValue
end;

function TModelEntidadesPadrao<T>.Data_Cadastro: TDateTime;
begin
  result := FData_Cadastro;
end;

function TModelEntidadesPadrao<T>.Data_Alteracao(aValue: TDateTime): iModelEntidadesInterfacesPadrao<T>;
begin
  result := self;
  FData_Alteracao := aValue;
end;

function TModelEntidadesPadrao<T>.Data_Alteracao: TDateTime;
begin
  result := FData_Alteracao;
end;


function TModelEntidadesPadrao<T>.Usuario_Alteracao(aValue: integer): iModelEntidadesInterfacesPadrao<T>;
begin
  result := self;
  FUsuario_Alteracao := aValue;
end;

function TModelEntidadesPadrao<T>.Usuario_Alteracao: integer;
begin
  result := FUsuario_Alteracao;
end;

function TModelEntidadesPadrao<T>.&End: T;
begin
  result := FParent;
end;

end.