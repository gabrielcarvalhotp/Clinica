unit Clinica.Model.Entidades.Interfaces.Padrao;

interface

type

  iModelEntidadesInterfacesPadrao<T> = interface
    ['{2270E02D-A96A-482D-B029-F483D4B8543F}']
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

end.
