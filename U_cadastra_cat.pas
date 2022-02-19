unit U_cadastra_cat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB;

type
  TFrm_categoria = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    LblEdit_cod: TLabeledEdit;
    LblEdit_categoria: TLabeledEdit;
    ADOQuery_categoria: TADOQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_categoria: TFrm_categoria;

implementation
uses U_principal;

{$R *.dfm}

procedure TFrm_categoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree; //limpa a instância da memória quando fechar
end;

procedure TFrm_categoria.FormShow(Sender: TObject);
begin
  LblEdit_cod.Enabled:= False; //se for inserir, desativa o componete
  LblEdit_categoria.SetFocus;
end;

procedure TFrm_categoria.SpeedButton1Click(Sender: TObject);
begin
  ADOQuery_categoria.Close;
  ADOQuery_categoria.SQL.Clear;
  ADOQuery_categoria.SQL.Add('insert into cat_comercio values('+chr(39)+LblEdit_categoria.Text+chr(39)+')');

  try
    ADOQuery_categoria.ExecSQL;
    ShowMessage('Cadastro realizado com sucesso!');
    Close;
  Except
    ShowMessage('Erro ao cadastrar categoria');
  end;
  
  
end;

procedure TFrm_categoria.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
