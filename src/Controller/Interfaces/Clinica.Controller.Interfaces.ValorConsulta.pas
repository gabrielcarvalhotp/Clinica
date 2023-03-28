unit Clinica.Controller.Interfaces.ValorConsulta;

interface

uses
  Vcl.StdCtrls, Clinica.Model.Entidades.Interfaces.Pacientes;
  type
  iControllerInterfacesValorConsulta = interface
    ['{0579CCFC-3915-41BD-8A36-09889CDA378F}']
    procedure Calcular(aMethod, aPlanoSaude : string; aParam : TEdit);
    procedure Nutricionista(aValue : TEdit; aPlanoSaude : string);
    procedure Cardiologista(aValue : TEdit; aPlanoSaude : string);
    procedure Ortopedista(aValue : TEdit; aPlanoSaude : string);
    procedure Terapeuta(aValue : TEdit; aPlanoSaude : string);
  end;

implementation

end.
