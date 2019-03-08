unit ftombola;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TFrmTombola }

  TFrmTombola = class(TForm)
    btClear: TButton;
    btEstract: TButton;
    GBTabellone: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    PLastBig: TPanel;
    PCabala: TPanel;
    PLast: TPanel;
    PLastbutone: TPanel;
    PLastbuttwo: TPanel;
    procedure btEstractClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GBTabelloneClick(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private


  public
    buttons: TList;
    numbers: TStringList;
    extracted: TStringList;
    smorfia: TstringList;
    procedure clearTabellone();
    procedure showLast();
  end;

var
  FrmTombola: TFrmTombola;

const
     btnsize = 50;
     btnspacer = 4;
     itemxcol = 10;
     colsize = btnsize + 4;
     extrColor = clRed;
     noextrColor = clNone;
     numofnum = 90;


implementation

{$R *.lfm}

{ TFrmTombola }

procedure TFrmTombola.FormCreate(Sender: TObject);
var
i,c,r: integer;
obj: TPanel;

begin
//                              RegisterClass(TEdit);

  buttons := TList.Create();
  numbers := TStringList.Create();
  extracted := TStringList.Create();
  smorfia := TStringList.Create();

  smorfia.add('L''Italia');
  smorfia.add('A criatura (il bimbo)');
  smorfia.add('''A jatta (il gatto)');
  smorfia.add('''O puorco (il maiale)');
  smorfia.add('''A mano (la mano)');
  smorfia.add('Chella che guarda ''nterra (organo sess. femminile)');
  smorfia.add('''A scuppetta (il fucile)');
  smorfia.add('''A maronna (la madonna)');
  smorfia.add('''A figliata (la prole)');
  smorfia.add('''E fasule (i fagioli)');
  smorfia.add('''E surice (i topi)');
  smorfia.add('''E surdate (i soldati)');
  smorfia.add('Sant''Antonio');
  smorfia.add('''O mbriaco (l''ubriaco)');
  smorfia.add(''' O guaglione (il ragazzo)');
  smorfia.add('''O culo (il deretano)');
  smorfia.add('''A disgrazia (la disgrazia)');
  smorfia.add('''O sanghe (il sangue)');
  smorfia.add(''' A resata (la risata)');
  smorfia.add('''A festa (la festa)');
  smorfia.add('''A femmena annura (la donna nuda)');
  smorfia.add('''O pazzo (il pazzo)');
  smorfia.add('''O scemo (lo scemo)');
  smorfia.add('''E gguardie (le guardie)');
  smorfia.add('Natale');
  smorfia.add('Nanninella (diminuitivo del nome Anna)');
  smorfia.add(''' O cantero (il vaso da notte)');
  smorfia.add('''E zzizze (il seno)');
  smorfia.add('''O pate d''e criature (organo sess. maschile)');
  smorfia.add('''E palle d''o tenente (le palle del tenente)');
  smorfia.add('''O padrone ''e casa (il proprietario di casa)');
  smorfia.add('''O capitone (il capitone)');
  smorfia.add('L''anne '' e Cristo (gli anni di Cristo)');
  smorfia.add('''A capa (la testa)');
  smorfia.add('L''aucielluzzo (l''uccellino)');
  smorfia.add(''' E castagnelle (sorta di petardi)');
  smorfia.add('''O monaco (il frate)');
  smorfia.add('''E mmazzate (le botte)');
  smorfia.add('''A funa ''nganna (la corda al collo)');
  smorfia.add('''A paposcia (ernia inguinale)');
  smorfia.add('''O curtiello (il coltello)');
  smorfia.add('''O ccafè (il caffè)');
  smorfia.add('''Onna pereta affacciata ''o balcone (donna al balcone)');
  smorfia.add('''E ccancelle (il carcere)');
  smorfia.add('''O vino (il vino)');
  smorfia.add('''E denare (i denari)');
  smorfia.add('''O muorto (il morto)');
  smorfia.add('''O muorto che parla (il morto che parla)');
  smorfia.add('''O piezzo '' e carne (il pezzo di carne)');
  smorfia.add('''O ppane (il pane)');
  smorfia.add('''O ciardino (il giardino)');
  smorfia.add('''A mamma (la mamma)');
  smorfia.add('''O viecchio (il vecchio)');
  smorfia.add('''O cappiello (il cappello)');
  smorfia.add('''A museca (la musica)');
  smorfia.add('''A caruta (la caduta)');
  smorfia.add('''O scartellato (il gobbo)');
  smorfia.add('''O paccotto (l''imbroglio)');
  smorfia.add('''E pile (i peli)');
  smorfia.add('''O lament (il lamento)');
  smorfia.add('''O cacciatore (il cacciatore)');
  smorfia.add('''O muorto accis (il morto ammazzato)');
  smorfia.add('''A sposa (la sposa)');
  smorfia.add('''A sciammeria (la marsina)');
  smorfia.add('''O chianto (il pianto)');
  smorfia.add('''E ddoie zetelle (le due zitelle)');
  smorfia.add('''O totano int''a chitarra (il totano nella chitarra)');
  smorfia.add('''A zuppa cotta (la zuppa cotta)');
  smorfia.add('''Sott''e''ncoppo (sottosopra)');
  smorfia.add('''O palazzo (il palazzo)');
  smorfia.add('L''ommo ''e merda (l''uomo senza princìpi)');
  smorfia.add('''A meraviglia (la meraviglia)');
  smorfia.add('''O spitale (l''ospedale)');
  smorfia.add('''A rotta (la grotta)');
  smorfia.add('''Pullecenella (Pulcinella)');
  smorfia.add('''A funtana (la fontana)');
  smorfia.add('''E diavule (i diavoli)');
  smorfia.add('''A bella figliola (la bella ragazza)');
  smorfia.add('''O mariuolo (il ladro)');
  smorfia.add('''A vocca (la bocca)');
  smorfia.add('''E sciure (i fiori)');
  smorfia.add('''A tavula ''mbandita (la tavola imbandita)');
  smorfia.add('''O maletiempo (il maltempo)');
  smorfia.add('''A cchiesa (la chiesa)');
  smorfia.add('L''aneme ''o priatorio (le anime del purgatorio)');
  smorfia.add('''A puteca (il negozio)');
  smorfia.add('''E perucchie (i pidocchi)');
  smorfia.add('''E casecavalle (i caciocavalli)');
  smorfia.add('''A vecchia (la vecchia)');
  smorfia.add('''A paura (la paura)');



  c := 0;
  r := 0;
  for i:=0 to numofnum - 1 do
    begin
    if ( i MOD itemxcol = 0) and ( i > 0) then
       begin
       r := 0;
       c := c + 1;
       end;
    obj := TPanel.Create(nil);
    obj.parent := GBTabellone;
    obj.Height:= 50;
    obj.Width:= 50;
    obj.top :=  colsize * c + ( btnspacer * c);
    obj.left := (obj.Width * r) + ( btnspacer * (r +1)) ;
    obj.Caption := inttostr(i+1);
    obj.Visible:= True;
    obj.Color := noextrColor;
    obj.Font.Size:= 15;

    buttons.add(obj);
    numbers.add(inttostr(i+1));

    r := r + 1;
//    numbers[i] := ;
  end;
  clearTabellone();
end;

procedure TFrmTombola.btEstractClick(Sender: TObject);
var
ex: integer;
i: integer;
found: boolean;

begin
  while true do
  begin
    if extracted.Count = (numofnum - 1) then
       begin
         ShowMessage('gioco finito')
       end
   else
    begin
    ex := Random(numofnum-1);

    found := false;
    if extracted.Count > 0 then
    for i:=0 to (extracted.Count -1) do
      begin
      if extracted[i] = inttostr(ex+1) then
         found := true;
      end;
    end;
    if found then continue;
    TLabel(buttons.Items[ex]).Color := extrColor;
    extracted.add(inttostr(ex+1));
    PCabala.Caption:= smorfia[ex];
    break;


end;
    showLast();
end;

procedure TFrmTombola.btClearClick(Sender: TObject);
begin
  clearTabellone();
  extracted.clear();
end;

procedure TFrmTombola.GBTabelloneClick(Sender: TObject);
begin

end;

procedure TFrmTombola.GroupBox1Click(Sender: TObject);
begin

end;

procedure TFrmTombola.GroupBox2Click(Sender: TObject);
begin

end;

procedure TFrmTombola.GroupBox3Click(Sender: TObject);
begin

end;

procedure TFrmTombola.clearTabellone();
var i, n: integer;
begin

  for  i:=0 to (buttons.Count-1) do
    begin
    TLabel(buttons.Items[i]).Color := noextrColor;
    end;

   PLast.Caption:='';
   PLastBig.Caption := '';
   PLastbutone.Caption:='';
   PLastbuttwo.Caption:='';
   PCabala.Caption:='';
end;


procedure TFrmTombola.showLast();
var n: integer;
begin

   PLast.Caption:='';
   PLastBig.Caption:='';
   PLastbutone.Caption:='';
   PLastbuttwo.Caption:='';
   n := extracted.Count - 1;

   if n = 0 then begin
     PLast.Caption:=extracted[n];
     PLastBig.Caption:=extracted[n];
   end;

   if n = 1 then begin
     PLast.Caption:=extracted[n];
     PLastBig.Caption:=extracted[n];
     PLastbutone.Caption:=extracted[n-1];
   end;

   if n > 1 then begin
     PLast.Caption:=extracted[n];
     PLastBig.Caption:=extracted[n];
     PLastbutone.Caption:=extracted[n-1];
     PLastbuttwo.Caption:=extracted[n-2];
   end;



;
end;


procedure TFrmTombola.Label1Click(Sender: TObject);
begin

end;

procedure TFrmTombola.Label5Click(Sender: TObject);
begin

end;

procedure TFrmTombola.Memo1Change(Sender: TObject);
begin

end;

procedure TFrmTombola.PageControl1Change(Sender: TObject);
begin

end;



end.

