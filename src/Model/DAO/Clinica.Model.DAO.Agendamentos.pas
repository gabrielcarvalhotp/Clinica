unit Clinica.Model.DAO.Agendamentos;

interface

uses
  Clinica.Model.DAO.Interfaces.Agendamentos, 
  Clinica.Model.Entidades.Interfaces.Agendamentos;

type
  TModelDAOAgendamentos = class(TInterfacedObject, iModelDAOInterfacesAgendamentos)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAOInterfacesAgendamentos;
    function DAO(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
    function CriarAgendamento(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
    function EditarAgendamento(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
  end;

implementation

uses
  Clinica.Model.PersisteDados;

{ TModelDAOAgendamentos }

constructor TModelDAOAgendamentos.Create;
begin

end;

function TModelDAOAgendamentos.CriarAgendamento( aValue: iModelEntidadesInterfacesAgendamentos): iModelDAOInterfacesAgendamentos;
var
  lSQl : string;
  DataConsulta : TDate;
begin
  result := self;
  DataConsulta := aValue.Data_Consulta;
  lSQl := ' INSERT INTO AGENDAMENTOS VALUES (?,?,?,?,?,?,?,?,?,?) ';
  
  TModelPersisteDados.New
    .PrepareStatement(lSQl)
    .SetValue(1, aValue.Padrao.Data_Cadastro)
    .SetValue(2, aValue.Padrao.Data_Alteracao)
    .SetValue(3, aValue.Padrao.Usuario_Alteracao)
    .SetValue(4, aValue.Id_Paciente)
    .SetValue(5, aValue.Tipo_Consulta)
    .SetValue(6, DataConsulta)
    .SetValue(7, aValue.Hora_Consulta)
    .SetValue(8, aValue.Medico_Consulta)
    .SetValue(9, aValue.Valor_Consulta)
    .ExecSQL   
end;

function TModelDAOAgendamentos.DAO(aValue: iModelEntidadesInterfacesAgendamentos): iModelDAOInterfacesAgendamentos;
begin
  result := self;
  if aValue.Padrao.Id = -1 then
    CriarAgendamento(aValue)
  else
    EditarAgendamento(aValue);
end;

destructor TModelDAOAgendamentos.Destroy;
begin
  inherited;

end;

function TModelDAOAgendamentos.EditarAgendamento( aValue: iModelEntidadesInterfacesAgendamentos): iModelDAOInterfacesAgendamentos;
var
  lSql : string;
  DataConsulta : TDate;
  HoraConsulta : TTime;
begin
  DataConsulta := aValue.Data_Consulta;
  HoraConsulta := aValue.Hora_Consulta;
  lSql := ' UPDATE '+
          '   AGENDAMENTOS '+
          ' SET '+
          '   AGENDAMENTOS.DATA_CADASTRO = :pDataCadastro, '+
          '   AGENDAMENTOS.DATA_ALTERACAO = :pDataAlteracao, '+
          '   AGENDAMENTOS.USUARIO_ALTERACAO = :pUsuarioAlteracao, '+
          '   AGENDAMENTOS.ID_PACIENTE = :pIdPaciente, '+
          '   AGENDAMENTOS.TIPO_CONSULTA = :pTipoConsulta, '+
          '   AGENDAMENTOS.DATA_CONSULTA = :pDataConsulta, '+
          '   AGENDAMENTOS.HORA_CONSULTA = :pHoraConsulta, '+
          '   AGENDAMENTOS.MEDICO_CONSULTA = :pMedicoConsulta, '+
          '   AGENDAMENTOS.VALOR_CONSULTA = :pValorConsulta '+
          ' WHERE '+
          '  AGENDAMENTOS.ID_AGENDAMENTO = :pIdAgendamento ';
          
  TModelPersisteDados.New
    .PrepareStatement(lSql)
    .AddParaments('pDataCadastro', aValue.Padrao.Data_Cadastro)
    .AddParaments('pDataAlteracao', aValue.Padrao.Data_Alteracao)
    .AddParaments('pUsuarioAlteracao', aValue.Padrao.Usuario_Alteracao)
    .AddParaments('pIdPaciente', aValue.Id_Paciente)
    .AddParaments('pTipoConsulta', aValue.Tipo_Consulta)
    .AddParaments('pDataConsulta', DataConsulta)
    .AddParaments('pHoraConsulta', HoraConsulta)
    .AddParaments('pMedicoConsulta', aValue.Medico_Consulta)
    .AddParaments('pValorConsulta', aValue.Valor_Consulta)
    .AddParaments('pIdAgendamento', aValue.Padrao.Id)
    .ExecSQL;
end;

class function TModelDAOAgendamentos.New: iModelDAOInterfacesAgendamentos;
begin
  result := self.Create;
end;

end.
