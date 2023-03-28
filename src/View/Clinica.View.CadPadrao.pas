unit Clinica.View.CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.WinXPanels, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmCadPadrao = class(TForm)
    pnlMain: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    pnlLineHeader: TPanel;
    pnlGrid: TPanel;
    CardPanel: TCardPanel;
    CardPesquisa: TCard;
    CardCadastro: TCard;
    pnlGridHeader: TPanel;
    edPesquisa: TEdit;
    Label2: TLabel;
    btnPesquisa: TBitBtn;
    BitBtnInserir: TBitBtn;
    BitBtnAlterar: TBitBtn;
    BitBtnDaletar: TBitBtn;
    DBGridPesquisa: TDBGrid;
    pnlGridFooter: TPanel;
    BitBtnSalvar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
    procedure BitBtnAlterarClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnDaletarClick(Sender: TObject);
    procedure DBGridPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Clinica.Controller.Entidades.Usuarios;

{$R *.dfm}

procedure TFrmCadPadrao.BitBtnInserirClick(Sender: TObject);
begin
  if TControllerEntidadesUsuarios.New.UsuarioLogado.Permicoes.Inserir <> 'S'   then
    raise Exception.Create('Voc� n�o pode inserir um novo usu�rio!');
  CardPanel.ActiveCard := CardCadastro;
end;

procedure TFrmCadPadrao.BitBtnAlterarClick(Sender: TObject);
begin
  if TControllerEntidadesUsuarios.New.UsuarioLogado.Permicoes.Alterar <> 'S' then
    raise Exception.Create('Voc� n�o pode alterar um usu�rio!');
  CardPanel.ActiveCard := CardCadastro;
end;

procedure TFrmCadPadrao.BitBtnDaletarClick(Sender: TObject);
begin
  if TControllerEntidadesUsuarios.New.UsuarioLogado.Permicoes.Deletar <> 'S'
  then
    raise Exception.Create('Voc� n�o pode deletar um usu�rio!');
end;

procedure TFrmCadPadrao.BitBtnSalvarClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardPesquisa;
end;

procedure TFrmCadPadrao.BitBtnCancelarClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardPesquisa;
end;

procedure TFrmCadPadrao.DBGridPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(DBGridPesquisa.DataSource.DataSet.RecNo) then
  begin
    DBGridPesquisa.Canvas.Brush.Color := $00434CEB;
    DBGridPesquisa.DefaultDrawDataCell(Rect, Column.Field, State)
  end
  else
  begin
    DBGridPesquisa.Canvas.Brush.Color := $00CFCFCF;
    DBGridPesquisa.DefaultDrawDataCell(Rect, Column.Field, State)  
  end;
end;

procedure TFrmCadPadrao.edPesquisaChange(Sender: TObject);
begin
  DataSource1.DataSet.Locate(DBGridPesquisa.Columns[1].FieldName, edPesquisa.Text, [ loPartialKey ])
end;

procedure TFrmCadPadrao.FormCreate(Sender: TObject);
begin
  CardPanel.ActiveCard := CardPesquisa;
end;

end.
