unit Clinica.View.Pacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Clinica.View.CadPadrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.WinXPanels, Vcl.ExtCtrls, 
  Clinica.Model.Entidades.Interfaces.Pacientes, Vcl.ComCtrls;

type
  TFrmCadPacientes = class(TFrmCadPadrao)
    Label3: TLabel;
    edId: TEdit;
    Label5: TLabel;
    edDataCadastro: TDateTimePicker;
    Label6: TLabel;
    edDataAtualizacao: TDateTimePicker;
    Label4: TLabel;
    edNome: TEdit;
    Label7: TLabel;
    edDataNascimento: TDateTimePicker;
    Label8: TLabel;
    edIdade: TEdit;
    Label9: TLabel;
    edTelefone: TEdit;
    Label10: TLabel;
    edEmail: TEdit;
    CBPlanoSaude: TComboBox;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edDataNascimentoExit(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnDaletarClick(Sender: TObject);
    procedure BitBtnAlterarClick(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FPaciente : iModelEntidadesInterfacesPacientes;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;
  
implementation

uses
  Clinica.Controller.Entidades.Pacientes, 
  Clinica.Controller.Entidades.Usuarios, 
  DateUtils,
  System.UITypes;

{$R *.dfm}

procedure TFrmCadPacientes.LimpaCampos;
begin 
  edDataNascimento.Date := now;
  edIdade.Text := '';
  edNome.Text := '';
  edTelefone.Text := '';
  edEmail.Text := '';
  CBPlanoSaude.ItemIndex := 0;
  edId.text := '-1';
end;

procedure TFrmCadPacientes.BitBtnAlterarClick(Sender: TObject);
var
  index : integer;
begin
  inherited;
  FPaciente.todos;
  LimpaCampos;
  edId.Text := FPaciente.DataSet.FieldByName('ID');
  edNome.Text := FPaciente.DataSet.FieldByName('NOME');
  edDataCadastro.DateTime := FPaciente.DataSet.FieldByName('DATA_CADASTRO');
  edDataAtualizacao.DateTime := now;
  edDataNascimento.Date := FPaciente.DataSet.FieldByName('DATA_NASCIMENTO');
  edIdade.Text := YearsBetween(edDataNascimento.Date, now).ToString;
  edTelefone.Text := FPaciente.DataSet.FieldByName('TELEFONE');
  edEmail.Text := FPaciente.DataSet.FieldByName('EMAIL');
  if FPaciente.DataSet.FieldByName('PLANO_SAUDE') = 'UNIMED' then index := 0 else index := 1;
  CBPlanoSaude.ItemIndex := index;
end;

procedure TFrmCadPacientes.BitBtnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja Cancelar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    abort;
  FPaciente.Grid;
  inherited;  
end;

procedure TFrmCadPacientes.BitBtnDaletarClick(Sender: TObject);
begin
  inherited;
   if MessageDlg('Deseja Deletar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Abort;
  DataSource1.DataSet.Delete
end;

procedure TFrmCadPacientes.BitBtnInserirClick(Sender: TObject);
begin
  inherited;
  FPaciente.todos;
  LimpaCampos;
  edDataCadastro.DateTime := now;
  edDataAtualizacao.DateTime := StrToDateTime('01/01/1899 00:00:00');
end;

procedure TFrmCadPacientes.BitBtnSalvarClick(Sender: TObject);
begin
  inherited;
  
  if MessageDlg('Deseja salvar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    abort;
    
  FPaciente
      .Padrao
      .Id(edId.Text)
      .Nome(edNome.Text)
      .Data_Cadastro(edDataCadastro.DateTime)
      .Data_Alteracao(edDataAtualizacao.DateTime)
      .Usuario_Alteracao(TControllerEntidadesUsuarios.New.UsuarioLogado.Padrao.Id)
      .&End   
      .DataNascimento(edDataNascimento.Date)
      .Idade(edIdade.Text)
      .Telefone(edTelefone.Text)
      .Email(edEmail.text)
      .Plano_Saude(CBPlanoSaude.Text)
      .DAO;
                
  DataSource1.DataSet.Refresh;
  DBGridPesquisa.Refresh;
  FPaciente.Grid;
end;

procedure TFrmCadPacientes.edDataNascimentoExit(Sender: TObject);
begin
  inherited;
  edIdade.Text := YearsBetween(edDataNascimento.Date, now).ToString;  
end;

procedure TFrmCadPacientes.FormCreate(Sender: TObject);
begin
  FPaciente := TControllerEntidadesPacientes.New.CriarPaciente;
  FPaciente.DataSource(DataSource1);
  inherited;
end;

end.
