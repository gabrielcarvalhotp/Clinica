unit Clinica.Model.Interfaces.Login;

interface

uses
  Vcl.StdCtrls;
type
  iModelInterfacesLogin = interface
  ['{1EF446A6-6CD5-472F-8422-E23A49864D65}']
  function Login(aValue : TEdit) : iModelInterfacesLogin; 
  function Senha(aValue : TEdit) : iModelInterfacesLogin;
  function Usuario : iModelInterfacesLogin;
end;

implementation

end.
