unit uspThreadTests;

interface

uses
  uspThread,
  TestFrameWork,
  ComCtrls;

type
  TspThreadTests = class(TTestCase)
  private
    FspThread : TspThread;
    FProgressBar: TProgressBar;
    procedure OnPosition(Sender: TObject; Posicao: Integer);
  protected

   procedure SetUp; override;
   procedure TearDown; override;

  published

    // Test methods
    procedure TestExecute;

  end;

implementation

uses SysUtils;

{ TspThreadTests }

procedure TspThreadTests.OnPosition(Sender: TObject; Posicao: Integer);
begin
  TProgressBar(Sender).Position := Posicao;
end;

procedure TspThreadTests.SetUp;
begin
  inherited;
  FProgressBar := TProgressBar.Create(nil);
  FspThread := TspThread.Create(1000, FProgressBar);
end;

procedure TspThreadTests.TearDown;
begin
  inherited;
  FreeAndNil(FProgressBar);
end;

procedure TspThreadTests.TestExecute;
begin
  FspThread.OnPosition := OnPosition;
  FspThread.Resume;
end;

initialization

  TestFramework.RegisterTest('uspThreadTests Suite',
    TspThreadTests.Suite);

end.
 