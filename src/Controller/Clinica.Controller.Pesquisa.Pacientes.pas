unit Clinica.Controller.Pesquisa.Pacientes;

interface

uses
  Clinica.Controller.Interfaces.Pesquisa,
  Clinica.Model.Conexao.Interfaces, 
  Clinica.Model.Entidades.Interfaces.Pacientes;

type
  TControllerPesquisaPacientes = class(TInterfacedObject, iControllerInterfacesPesquisaPacientes)
  private
    { private }
    FPaciente : iModelEntidadesInterfacesPacientes;
    FDataSet : iModelDataSet;
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerInterfacesPesquisaPacientes;
    function Pesquisar : iControllerInterfacesPesquisaPacientes;
    function Id : string;
    function Nome : string;
    procedure Paciente(aValue : string);overload;
    function Paciente : iModelEntidadesInterfacesPacientes;overload;
  end;

implementation

uses
  Clinica.Controller.Conexao.DataSet, Clinica.Controller.Conexao.Connection, 
  Clinica.View.LookUpPadrao, Clinica.Controller.Entidades.Pacientes, 
  System.SysUtils;

{ TModelPesquisaPacientes }

constructor TControllerPesquisaPacientes.Create;
begin
  FDataSet := TControllerConexaoDataSet.New.FDataSet(TControllerConexaoConectar.New.Conectar);
  FPaciente := TControllerEntidadesPacientes.New.CriarPaciente;
end;

procedure TControllerPesquisaPacientes.Paciente(aValue : string);
begin
  FDataSet.Close.Clear.Sql(' SELECT * FROM PACIENTES WHERE PACIENTES.ID = ' + aValue).Active;
  if FDataSet.DataSet.RecordCount <> 1 then
    Abort;
  FPaciente
    .Padrao
    .Id(FDataSet.FieldByName('ID'))
    .Nome(FDataSet.FieldByName('NOME'))
    .Data_Cadastro(FDataSet.FieldByName('DATA_CADASTRO'))
    .Data_Alteracao(FDataSet.FieldByName('DATA_ALTERACAO'))
    .Usuario_Alteracao(FDataSet.FieldByName('USUARIO_ALTERACAO'))
    .&End   
    .DataNascimento(FDataSet.FieldByName('DATA_NASCIMENTO'))
    .Idade(FDataSet.FieldByName('IDADE'))
    .Telefone(FDataSet.FieldByName('TELEFONE'))
    .Email(FDataSet.FieldByName('EMAIL'))
    .Plano_Saude(FDataSet.FieldByName('PLANO_SAUDE'));
end;

function TControllerPesquisaPacientes.Paciente: iModelEntidadesInterfacesPacientes;
begin
  result := FPaciente;
end;

function TControllerPesquisaPacientes.Pesquisar: iControllerInterfacesPesquisaPacientes;
var
 FrmPesquisa : TFrmPesquisa;
begin
  result := self;
  FrmPesquisa := TFrmPesquisa.Create(nil);
  try
    FrmPesquisa.SQL(' SELECT ID, NOME FROM PACIENTES ');
    FrmPesquisa.ShowModal;
  finally
    Paciente(FrmPesquisa.id);
    FrmPesquisa.DisposeOf;
  end;
  inherited;
end;

destructor TControllerPesquisaPacientes.Destroy;
begin
  inherited;

end;

function TControllerPesquisaPacientes.Id: string;
begin
  result := IntToStr(FPaciente.Padrao.Id);
end;

class function TControllerPesquisaPacientes.New: iControllerInterfacesPesquisaPacientes;
begin
  result := self.Create;
end;

function TControllerPesquisaPacientes.Nome : string;
begin
  result := FPaciente.Padrao.Nome;
end;
end.
