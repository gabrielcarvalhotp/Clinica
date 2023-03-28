unit Clinica.View.Principal;

interface

uses
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons,
  System.Variants,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Clinica.Model.Entidades.Interfaces.Usuarios;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    TBitBtn: TBitBtn;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sistema2: TMenuItem;
    Cadastros1: TMenuItem;
    Cad_Pacientes: TMenuItem;
    Cad_Agendamentos: TMenuItem;
    Relatrios1: TMenuItem;
    RelatoriodePacientes1: TMenuItem;
    Cad_Usuarios: TMenuItem;
    Panel2: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Cad_UsuariosClick(Sender: TObject);
    procedure Cad_PacientesClick(Sender: TObject);
    procedure Sistema2Click(Sender: TObject);
    procedure TBitBtnClick(Sender: TObject);
    procedure Cad_AgendamentosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FUsuario: iModelEntidadesInterfacesUsuarios;
  public
    { Public declarations }
    function Usuario: iModelEntidadesInterfacesUsuarios;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  

implementation

uses
  System.SysUtils,
  Vcl.Dialogs,
  Clinica.View.Login,
  Clinica.Controller.Entidades.Usuarios,
  Clinica.View.Usuarios, 
  Clinica.View.Pacientes, 
  Clinica.View.Agendamentos;

{$R *.dfm}

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  Cad_AgendamentosClick(Cad_Agendamentos)
end;

procedure TFrmPrincipal.Cad_AgendamentosClick(Sender: TObject);
var
  FrmCadAgendamentos : TFrmCadAgendamentos;
begin
  if Usuario.Permicoes.Pesquisar('Cad. Agendamentos', Usuario.Padrao.Id.ToString).Atribuir.Executar <> 'S' then
    raise Exception.Create('Voc� n�o tem permi��o para Cadastrar Agendamentos!');
    
  FrmCadAgendamentos := TFrmCadAgendamentos.Create(nil);
  try
    FrmCadAgendamentos.ShowModal;
  finally
    FrmCadAgendamentos.DisposeOf;
  end;
end;

procedure TFrmPrincipal.Cad_PacientesClick(Sender: TObject);
var
  FrmCadPacientes : TFrmCadPacientes;
begin
  if Usuario.Permicoes.Pesquisar('Cad. Pacientes', Usuario.Padrao.Id.ToString).Atribuir.Executar <> 'S' then
    raise Exception.Create('Voc� n�o tem permi��o para Cadastrar Pacientes!');
    
  FrmCadPacientes := TFrmCadPacientes.Create(nil);
  try
    FrmCadPacientes.ShowModal;
  finally
    FrmCadPacientes.DisposeOf;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  FrmLogin: TFrmLogin;
begin
  FUsuario := TControllerEntidadesUsuarios.New.CriarUsuario;

  FrmLogin := TFrmLogin.Create(nil);
  try
    FrmLogin.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmPrincipal.Sistema2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.TBitBtnClick(Sender: TObject);
begin
  Cad_PacientesClick(Cad_Pacientes);
end;

function TFrmPrincipal.Usuario: iModelEntidadesInterfacesUsuarios;
begin
  result := FUsuario;
end;

procedure TFrmPrincipal.Cad_UsuariosClick(Sender: TObject);
var
  FrmCadUsuarios : TFrmCadUsuarios;
begin
  if Usuario.Permicoes.Pesquisar('Cad. Usuarios', Usuario.Padrao.Id.ToString).Atribuir.Executar <> 'S' then
    raise Exception.Create('Voc� n�o tem permi��o para Cadastrar um Usu�rio!');

  FrmCadUsuarios := TFrmCadUsuarios.Create(nil);
  try 
    FrmCadUsuarios.ShowModal;
  finally
    FrmCadUsuarios.DisposeOf;
  end;
end;

end.
