unit Clinica.Model.Interfaces.PersisteDados;

interface
  type
  iModelInterfacesPersisteDados = interface
    ['{480D9DDC-B5A0-4758-A8E8-F1265437157E}']
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

end.
