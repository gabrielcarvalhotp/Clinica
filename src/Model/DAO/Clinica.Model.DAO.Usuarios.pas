unit Clinica.Model.DAO.Usuarios;

interface

uses
  system.SysUtils,
  Clinica.Model.DAO.Interfaces.Usuarios, 
  Clinica.Model.Entidades.Interfaces.Usuarios, 
  Clinica.Model.Conexao.Interfaces;
  type
  TModelDaoUsuarios = class(TInterfacedObject, iModelDAOInterfacesUsuarios)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAOInterfacesUsuarios;
    function DAO(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
    function CriarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
    function EditarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
    procedure Pemicoes;
  end;

implementation

uses
  Clinica.Controller.Conexao.DataSet, 
  Clinica.Controller.Conexao.Connection, 
  Clinica.Model.PersisteDados, 
  Clinica.Controller.Entidades.Usuarios;

{ TModelDaoUsuarios }

constructor TModelDaoUsuarios.Create;
begin
  
end;

function TModelDaoUsuarios.CriarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
var
  lSQl : string;
begin
  lSQl := 'INSERT INTO USUARIOS VALUES (?,?,?,?,?,?)';
  
  TModelPersisteDados.New
    .PrepareStatement(lSQl)
    .SetValue(1, aValue.Padrao.Nome)
    .SetValue(2, aValue.Senha)
    .SetValue(3, aValue.Padrao.Data_Cadastro)
    .SetValue(4, aValue.Padrao.Data_Alteracao)
    .SetValue(5, aValue.Padrao.Usuario_Alteracao)
    .ExecSQL;
     
  Pemicoes;
end;

function TModelDaoUsuarios.DAO(aValue: iModelEntidadesInterfacesUsuarios): iModelDAOInterfacesUsuarios;
begin
  result := self;
  if aValue.Padrao.Id = -1 then
    CriarUsuario(aValue)
  else
    EditarUsuario(aValue)
end;

destructor TModelDaoUsuarios.Destroy;
begin
  inherited;

end;

function TModelDaoUsuarios.EditarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
var
  lSQl : string;
begin
  lSQL := ' UPDATE '+
          '   USUARIOS '+
          ' SET '+
          '   USUARIOS.NOME = :pNome, '+
          '   USUARIOS.SENHA = :pSenha,'+
          '   USUARIOS.DATA_CADASTRO = :pdataCadastro, '+
          '   USUARIOS.DATA_ALTERACAO = :pdataAlteracao, '+
          '   USUARIOS.USUARIO_ALTERACAO = :pUsuarioAlteracao '+
          ' WHERE '+
          '   USUARIOS.ID_USUARIOS = :pId ';
          
  TModelPersisteDados.New
    .PrepareStatement(lSQl)
    .AddParaments('pNome', aValue.Padrao.Nome)
    .AddParaments('pSenha', aValue.Senha)
    .AddParaments('pdataCadastro', aValue.Padrao.Data_Cadastro)
    .AddParaments('pdataAlteracao', aValue.Padrao.Data_Alteracao)
    .AddParaments('pUsuarioAlteracao', aValue.Padrao.Usuario_Alteracao)
    .AddParaments('pId', aValue.Padrao.Id)
    .ExecSQL;
end;

class function TModelDaoUsuarios.New: iModelDAOInterfacesUsuarios;
begin
  result := self.Create;
end;

procedure TModelDaoUsuarios.Pemicoes;
var
  lSQl : string;
  lId : integer;
begin
  lId := TControllerConexaoDataSet.New
           .FDataSet(TControllerConexaoConectar.New.Conectar)
           .Close
           .Clear
           .Sql('SELECT * FROM USUARIOS ORDER BY USUARIOS.ID_USUARIOS DESC')
           .Active
           .FieldByName('ID_USUARIOS');
               
  lSQl := ' INSERT INTO USUARIOS_PERMICOES VALUES (?,?,?,?,?,?,?,?,?,?)';
  
  TModelPersisteDados.New
    .PrepareStatement(lSQl)
    .SetValue(2, now)
    .SetValue(3, '01/01/1899 00:00:00')
    .SetValue(4, TControllerEntidadesUsuarios.new.UsuarioLogado.Padrao.Id)
    .SetValue(5, lId)
    .SetValue(6, 'N')
    .SetValue(7, 'N')
    .SetValue(8, 'N')
    .SetValue(9, 'N')
    .SetValue(1, 'Cad. Usuarios')
    .ExecSQL
    .SetValue(1, 'Cad. Pacientes')
    .ExecSQL
    .SetValue(1, 'Cad. Agendamentos')
    .ExecSQL
end;

end.
