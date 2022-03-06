unit U_comercios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_comercios = class(TForm)
    LblEdit_categoria: TLabeledEdit;
    Btn_cancelar: TButton;
    DBGrid1: TDBGrid;
    Btn_inserir: TButton;
    Btn_alterar: TButton;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    procedure FormShow(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_inserirClick(Sender: TObject);
    procedure Btn_alterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var acao: String;
  end;

var
  Frm_comercios: TFrm_comercios;

implementation

Uses U_principal, U_cadastra_comercio;

{$R *.dfm}

procedure TFrm_comercios.Btn_alterarClick(Sender: TObject);
begin
  acao:= 'A';
  Frm_cad_comercio:= TFrm_cad_comercio.Create(Application);
  Frm_cad_comercio.LblEdit_cod_loja.Text:= ADODataSet1.FieldByName('cod_sup').AsString;
  Frm_cad_comercio.LblEdit_nome.Text:= ADODataSet1.FieldByName('nome').AsString;
  Frm_cad_comercio.LblEdit_rua.Text:= ADODataSet1.FieldByName('rua').AsString;
  Frm_cad_comercio.LblEdit_numero.Text:= ADODataSet1.FieldByName('numero').AsString;
  Frm_cad_comercio.LblEdit_bairro.Text:= ADODataSet1.FieldByName('bairro').AsString;
  Frm_cad_comercio.LblEdit_cidade.Text:= ADODataSet1.FieldByName('cidade').AsString;
  Frm_cad_comercio.LblEdit_uf.Text:= ADODataSet1.FieldByName('estado').AsString;
  //Frm_cad_comercio.FormShow(Self);
  Frm_cad_comercio.DBLookupComboBox_categoria.KeyValue:= ADODataSet1.FieldByName('cod_cat').AsInteger;
  Frm_cad_comercio.ShowModal;
end;

procedure TFrm_comercios.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_comercios.Btn_inserirClick(Sender: TObject);
begin
  Frm_cad_comercio:= TFrm_cad_comercio.Create(Application);
  Frm_cad_comercio.Show;
end;

procedure TFrm_comercios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_comercios.FormShow(Sender: TObject);
begin
  ADODataSet1.Open;

end;

end.
