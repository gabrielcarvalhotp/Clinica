unit Clinica.View.Permicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, 
  Clinica.Model.Conexao.Interfaces, Vcl.Buttons;

type
  TFrmCadPermicoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    pnlLineHeader: TPanel;
    Label3: TLabel;
    edId: TEdit;
    Label4: TLabel;
    edNome: TEdit;
    DataSource1: TDataSource;
    BitBtnAlterar: TBitBtn;
    BitBtnSalvar: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAlterarClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet : iModelDataSet;
  public
    { Public declarations }
    procedure Sql(aValue : string);
  end;

implementation

uses
  Clinica.Controller.Conexao.DataSet, Clinica.Controller.Conexao.Connection;

{$R *.dfm}

procedure TFrmCadPermicoes.Sql(aValue: string);
begin
  FDataSet
    .Close
    .Clear
    .Sql(' SELECT * FROM USUARIOS_PERMICOES WHERE USUARIOS_PERMICOES.ID_USUARIO = ' + aValue)
    .Active;
    DataSource1.DataSet := FDataSet.DataSet;
end;

procedure TFrmCadPermicoes.BitBtnSalvarClick(Sender: TObject);
begin
  DataSource1.DataSet.Post;
  DBGrid1.ReadOnly := True;
  BitBtnAlterar.Enabled := true;
  BitBtnSalvar.Enabled := false;
end;

procedure TFrmCadPermicoes.BitBtnAlterarClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
  DBGrid1.ReadOnly := False;
  BitBtnAlterar.Enabled := false;
  BitBtnSalvar.Enabled := true;
end;

procedure TFrmCadPermicoes.FormCreate(Sender: TObject);
begin
  FDataSet := TControllerConexaoDataSet.New.FDataSet(TControllerConexaoConectar.New.Conectar); 
  BitBtnSalvar.Enabled := false;
  DBGrid1.ReadOnly := True;
end;

end.
