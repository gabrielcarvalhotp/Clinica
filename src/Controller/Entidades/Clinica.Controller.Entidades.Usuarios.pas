unit Clinica.Controller.Entidades.Usuarios;

interface

uses
  Clinica.Controller.Entidades.Interfaces.Usuarios, 
  Clinica.Model.Entidades.Interfaces.Usuarios;

type
  TControllerEntidadesUsuarios = class(TInterfacedObject, iControllerEntidadesInterfacesUsuarios)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntidadesInterfacesUsuarios;
    function UsuarioLogado : iModelEntidadesInterfacesUsuarios;
    function CriarUsuario : iModelEntidadesInterfacesUsuarios;
  end;

implementation

uses
  Clinica.View.Principal, Clinica.Model.Entidades.Usuarios;

{ TControllerEntidadesUsuarios }

constructor TControllerEntidadesUsuarios.Create;
begin

end;

function TControllerEntidadesUsuarios.CriarUsuario: iModelEntidadesInterfacesUsuarios;
begin
  result := TModelEntidadesUsuarios.New;
end;

destructor TControllerEntidadesUsuarios.Destroy;
begin
  inherited;

end;

class function TControllerEntidadesUsuarios.New: iControllerEntidadesInterfacesUsuarios;
begin
  result := self.Create;
end;

function TControllerEntidadesUsuarios.UsuarioLogado: iModelEntidadesInterfacesUsuarios;
begin
  result := FrmPrincipal.Usuario;
end;

end.
