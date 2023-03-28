unit Clinica.Model.PersisteDados;

interface
uses
  Clinica.Model.Interfaces.PersisteDados, 
  Clinica.Model.Conexao.Interfaces,
  FireDAC.stan.Param;

type
  TModelPersisteDados = class(TInterfacedObject, iModelInterfacesPersisteDados)
  private
    { private }
    FDataSet : iModelDataSet;
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iModelInterfacesPersisteDados;
    function PrepareStatement(aSql: string) : iModelInterfacesPersisteDados;
    function AddParaments(aName: string; aValue: integer): iModelInterfacesPersisteDados;overload;
    function AddParaments(aName: string; aValue: string): iModelInterfacesPersisteDados;overload;
    function AddParaments(aName: string; aValue: double): iModelInterfacesPersisteDados;overload;
    function AddParaments(aName: string; aValue: TDateTime): iModelInterfacesPersisteDados;overload;
    function AddParaments(aName: string; aValue: TDate): iModelInterfacesPersisteDados;overload;
    function AddParaments(aName: string; aValue: TTime): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: integer): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: string): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: double): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: TDateTime): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: TDate): iModelInterfacesPersisteDados;overload;
    function SetValue(aIndex: Integer; aValue: TTime): iModelInterfacesPersisteDados;overload;
    function ExecSQL: iModelInterfacesPersisteDados;
  end;

implementation

uses
  Clinica.Controller.Conexao.DataSet, 
  Clinica.Controller.Conexao.Connection,System.Classes;

{ TModelPersisteDados }


function TModelPersisteDados.AddParaments(aName: string; aValue: integer): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

function TModelPersisteDados.AddParaments(aName: string; aValue: TDateTime): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

function TModelPersisteDados.AddParaments(aName: string; aValue: TTime): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

function TModelPersisteDados.AddParaments(aName: string; aValue: TDate): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

function TModelPersisteDados.AddParaments(aName: string; aValue: double): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

function TModelPersisteDados.AddParaments(aName, aValue: string): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.ParamsByName(aName, aValue);
end;

constructor TModelPersisteDados.Create;
begin
  FDataSet := TControllerConexaoDataSet.New.FDataSet(TControllerConexaoConectar.New.Conectar)
end;

destructor TModelPersisteDados.Destroy;
begin
  inherited;

end;

function TModelPersisteDados.ExecSQL: iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.ExecSQL;
end;

class function TModelPersisteDados.New: iModelInterfacesPersisteDados;
begin
  result := self.Create;
end;

function TModelPersisteDados.PrepareStatement(aSql: string): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.Close.Close.Sql(aSql);
end;

function TModelPersisteDados.SetValue(aIndex, aValue: integer): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].AsInteger := aValue;
end;

function TModelPersisteDados.SetValue(aIndex: Integer; aValue: string): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].asString := aValue;
end;

function TModelPersisteDados.SetValue(aIndex: Integer; aValue: double): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].AsFloat := aValue;
end;

function TModelPersisteDados.SetValue(aIndex: Integer; aValue: TDate): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].AsDate := aValue;
end;

function TModelPersisteDados.SetValue(aIndex: Integer; aValue: TTime): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].AsTime := aValue;
end;

function TModelPersisteDados.SetValue(aIndex: Integer; aValue: TDateTime): iModelInterfacesPersisteDados;
begin
  result := self;
  FDataSet.DataSet.Params.Add;
  FDataSet.DataSet.Params[aIndex].AsDateTime := aValue;
end;

end.
