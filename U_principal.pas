unit U_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Menus, Data.DB, Data.Win.ADODB;

type
  TFrm_principal = class(TForm)
    Image1: TImage;
    groupbox: TGroupBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Comrcio1: TMenuItem;
    Categoriadecomrcio1: TMenuItem;
    ADOConnection1: TADOConnection;
    CategoriadeProdutos1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Panel3: TPanel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Produtos1Click(Sender: TObject);
    procedure Categoriadecomrcio1Click(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Comrcio1Click(Sender: TObject);
    procedure CategoriadeProdutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_principal: TFrm_principal;

implementation
uses U_cadastra_cat, U_cadastra_comercio, U_cadastra_prod, U_cad_cat_prod,
U_comercios, U_produtos, U_cadastro_compras;

{$R *.dfm}

procedure TFrm_principal.Categoriadecomrcio1Click(Sender: TObject);
begin
  Frm_categoria:= TFrm_categoria.Create(Application);
  Frm_categoria.ShowModal;
end;

procedure TFrm_principal.CategoriadeProdutos1Click(Sender: TObject);
begin
  Frm_cad_cat_prod:= TFrm_cad_cat_prod.Create(Application);
  Frm_cad_cat_prod.ShowModal;
end;

procedure TFrm_principal.Comrcio1Click(Sender: TObject);
begin
  Frm_comercios:= TFrm_comercios.Create(Application);
  Frm_comercios.ShowModal;
end;

procedure TFrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree; //limpa a inst�ncia da mem�ria quando fechar
end;

procedure TFrm_principal.Image1Click(Sender: TObject);
begin
  Frm_cadastro_compras:= TFrm_cadastro_compras.Create(Application);
  Frm_cadastro_compras.ShowModal;
end;

procedure TFrm_principal.Image1MouseLeave(Sender: TObject);
begin
  Image1.Stretch:= False;
end;

procedure TFrm_principal.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Image1.Stretch:= True;
end;

procedure TFrm_principal.Produtos1Click(Sender: TObject);
begin
  Frm_produtos:= TFrm_produtos.Create(Application);
  Frm_produtos.Show;
end;

end.
